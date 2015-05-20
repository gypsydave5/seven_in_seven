"Hello, World!" println

bob := 1 + 1
//hey, it's like a variable declaration

"this should be 2: #{bob}" interpolate println

Mammal := Object clone
Mammal legs := 4
Mammal limbs := method(if(arms, arms, 0) + if(legs, legs, 0))

Human := Mammal clone
Human arms := 2
Human legs = 2

dave := Human clone
"this should be 2 too: #{dave limbs}" interpolate println