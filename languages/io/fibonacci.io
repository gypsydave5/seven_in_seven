// recursive fibonacci
fib := method(nth, fibList,
    fibList := if(fibList, fibList, list(1, 1))
    if(fibList size >= nth,
        fibList last,
        fib(nth, fibList append(fibList slice(-2) sum))
    )
)
