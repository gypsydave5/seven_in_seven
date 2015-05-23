sumNDArray := method(lst,
    lst reduce(memo, item,
        if(item type != "List",
            memo + item,
            memo + sumNDArray(item)), 0))

array := list(1, 3, 5)
sumNDArray(array) println

twoDarray := list(list(1, 2, 3), list(4, 5, 6))
sumNDArray(twoDarray) println // => 21

// oh look - Io's got flatten!

sumNDwithFlatten := method(lst, lst flatten reduce(+))
sumNDwithFlatten(twoDarray) println // => 21

// BOOM!