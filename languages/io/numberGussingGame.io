Sequence color := method(color,
    colors := list("red", "green", "blue")
    codes := list("[31m", "[32m", "[34m")
    colorMap := Map clone addKeysAndValues(colors, codes)
    resetCode := "[0m"
    colorCode := colorMap at(color)
    "#{colorCode}#{self}#{resetCode}" interpolate
)

RandomNumberGame := Object clone
RandomNumberGame rules := method(
    "Guess a number between #{self lowerBound} and #{self upperBound}\n" interpolate
)

RandomNumberGame start := method(lowerBound, upperBound,
    self lowerBound := lowerBound
    self upperBound := upperBound
    self randomNumber := Random value(lowerBound - 1, upperBound) ceil
    newSlot("lastGuessDistance")
    newSlot("currentGuess")
    newSlot("guessDistance")
    newSlot("result")
    return self
)

RandomNumberGame hasWon := method(
    guessDistance == 0)
RandomNumberGame doWon = method(
    lastGuessDistance = guessDistance
    list(true, "You win!" color("green")))
RandomNumberGame isWarmer := method(
    lastGuessDistance and lastGuessDistance > guessDistance)
RandomNumberGame warmer := method(
    list(false, "Wrong, but warmer..." color("green")))
RandomNumberGame isColder := method(
    lastGuessDistance and lastGuessDistance < guessDistance)
RandomNumberGame colderResult := method(
    list(false, "Wrong, and colder..." color("red")))
RandomNumberGame isFirstGuess := method(
    lastGuessDistance not)
RandomNumberGame firstGuess := method(
    list(false, "Wrong...")
)

RandomNumberGame guess := method(guess,

    currentGuess = guess asNumber
    if(currentGuess isNan, return list(false, "Not a number!"))

    setGuessDistance((currentGuess - randomNumber) abs)

    if(hasWon, setResult(doWon))
    if(isWarmer, setResult(warmerResult))
    if(isColder, setResult(colderResult))
    if(isFirstGuess, setResult(firstGuess))

    lastGuessDistance = guessDistance
    result
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