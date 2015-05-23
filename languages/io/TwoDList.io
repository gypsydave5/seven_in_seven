TwoDList := Object clone

dim := method(x, y,
    new2dList := TwoDList clone
    new2dList _inner = list()
    for(i, 1, y,
        new2dList _inner push(
            list() setSize(x)
        )
    )
    new2dList
)

TwoDList _inner := list()

TwoDList println := method(
    self _inner println
)

TwoDList set := method(x, y, value,
    self _inner at(y) atPut(x, value)
)

TwoDList get := method(x, y,
    self _inner at(y) at(x)
)

TwoDList transpose := method(
    newX := self _inner size
    newY := self _inner at(0) size
    new2dList := dim(newX, newY)
    for(i, 0, newY - 1,
        for(j, 0, newX -1,
            new2dList set(j, i, self get(i, j))
        )
    )
    new2dList
)

twoder := dim(3, 3)
twoder set(2, 1, "me")
twoder get(2, 1) println // => me
tranper := twoder transpose
(twoder get(2, 1) == tranper get(1, 2)) println // => true

file := File with("twoDarray.data")
file openForUpdating
file write(twoder serialized)
file close

file := File with("twoDarray.data")
file openForReading
file close

readFile := doFile("twoDarray.data")
readFile get(2, 1) println // => "me" - hooray, it's deserialized!