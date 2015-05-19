// Is Io weakly or strongly typed?

1 + 1 // => 2
1 + "one" // => throws an Exception

// So we're strongly typed; Io won't attempt to cast the arguments

// True and false
true and true // => true
true and false // => false
true and 0 // => true, so 0 is truthy
true and "" // => true, so the empty string is truthy
true and nil // => false, so nil is falsey
// only nil and false are falsey

// Which slots does a prototype support
slotNames
//ie
Object slotNames // => list( a lot of slots!)

// What is the difference between =, := and ::=
//
// `=` assigns value to a slot, raises exception if it doensn't exist
// `:=` creates a slot and assigns a value to it
// `::=` creates a slot, assigns a value AND creates a setter
// eh?
//
Car = Object clone // => error, no slot (in the Lobby - the global object...)
Car := Object clone // => a new car
Car name = "Kit" // => nope, still no slot
Car name := "Kit" // => happier, makes the slot
Car name // => "Kit"
Car name = "Brum" // => slot's there, okay!
Car setName("Batmobile") // => error, no setter method
Car name ::= "Batmobile" // => fine
Car setName("Supercar") // => OK too
Car name // => "Supercar"
