TwoDList := clone Object

dim := method(x, y,
    l := list()
    for(i, 0, y,
        l push(
            list() setSize(x)
        )
    )
    new2dList := TwoDList clone
    new2dList _inner := l
)

/*TwoDList println := method(*/
    /*self l println*/
/*)*/

bob := dim(2, 4)
bob type println