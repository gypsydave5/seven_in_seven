// recursive fibonacci
fibRec := method(nth, fibList,
    fibList := if(fibList, fibList, list(1, 1))
    if(fibList size >= nth,
        fibList last,
        fibRec(nth, fibList append(fibList slice(-2) sum))
    )
)

// iterative fibonacci
fibItr := method(number,
    initialList := list(1, 1)
    while(number > 2,
        initialList append(initialList slice(-2) sum)
        number = number - 1
    )
    initialList last
)

fibItr(1) println
