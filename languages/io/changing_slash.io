3 / 0 // => inf - nice, there's an infinity type
42 type //=> Number - cool, there's the class we need to change the behaviour of

Number slotNames //=> a shed load of slots..

// so let's keep the old divide somewhere safe

Number divide := Number getSlot("/") // => copies then contents of the / slot over to another slot

// and wrap the original with our new functionality

Number / = method(number, if(number == 0, 0, self divide(number)))

1 / 0 println // => 0
22 / 0 println // => 0
20 / 4 println // => 5