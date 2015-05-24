Sequence color := method(color,
    colors := list("red", "green", "blue")
    codes := list("[31m", "[32m", "[34m")
    colorMap := Map clone addKeysAndValues(colors, codes)
    resetCode := "[0m"
    colorCode := colorMap at(color)
    "#{colorCode}#{self}#{resetCode}" interpolate
)

RandomNumberGame := Object clone
RandomNumberGame clone := RandomNumberGame
RandomNumberGame rules := method(
    "Guess a number between #{self lowerBound} and #{self upperBound}\n" interpolate
)

RandomNumberGame start := method(lowerBound, upperBound,
    self lowerBound := lowerBound
    self upperBound := upperBound
    self randomNumber := Random value(lowerBound - 1, upperBound) ceil
    self lastGuessDistance := nil
    self currentGuess := nil
    return self
)

RandomNumberGame guess := method(guess,

    currentGuess = guess asNumber
    if(currentGuess isNan, return list(false, "Not a number!"))

    guessDistance := (currentGuess - randomNumber) abs

    if(guessDistance == 0, return list(true, "You win!" color("green")))

    if(lastGuessDistance,
        if(lastGuessDistance > guessDistance,
            result := list(false, "Wrong, but warmer..." color("green")),
            result := list(false, "Wrong, and colder..." color("red"))
        ),
        result := list(false, "Wrong...")
    )

    lastGuessDistance = guessDistance
    return result
)

gameRunner := method(game,

    "IO GUESSING GAME" println
    "----------------" println
    "Welcome to a guessing game" println
    "The rules are:" print
    game rules println

    guessResult := list(false)

    while(guessResult first not,
        "guess: " color("blue") print
        input := File standardInput readLine asNumber
        guessResult = game guess(input)
        guessResult last println
    )
)

gameRunner(RandomNumberGame start(1, 100))