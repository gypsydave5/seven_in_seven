List myAverage := method(
    if(self detect(v, v type != "Number"),
        Exception raise("No average of non numbers"),
        self reduce(+) / self size
    )
)

list(1, 2, 3, 4, 5) myAverage println // => 3
list(1, 2, "three", 4) myAverage println // => throws