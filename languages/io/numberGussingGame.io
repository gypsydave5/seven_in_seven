Sequence color := method(color,
    colors := list("red", "green", "blue")
    codes := list("[31m", "[32m", "[34m")
    colorMap := Map clone addKeysAndValues(colors, codes)
    resetCode := "[0m"
    colorCode := colorMap at(color)
    "#{colorCode}#{self}#{resetCode}" interpolate
)

RandomNumberGame := Object clone

RandomNumberGame start := method(lowerBound, upperBound,

    randomNumber := Random value(lowerBound - 1, upperBound) ceil
    lastGuessDistance := nil
    guess := nil

    "IO GUESSING GAME" println
    "----------------" println
    "Welcome to a guessing game" println
    "Guess a number between #{lowerBound} and #{upperBound}" interpolate println

    while(guess != randomNumber,

        "guess: " color("blue") print
        guess = File standardInput readLine asNumber
        "" println
        if(guess isNan, "Not a number" println; return)
        guessDistance := (guess - randomNumber) abs
        if(guessDistance == 0, "Correct!\nYou win!" println; return)
        if(lastGuessDistance,
            if(lastGuessDistance > guessDistance,
                "No, but warmer..." color("green") println,
                "No, and you're colder" color("red") println
            ),
            "Nope" println
        )
        "Try again!" println
        lastGuessDistance = guessDistance
    )
)

RandomNumberGame start(1, 100)