[5, 4, 1, 3, 9, 8, 6, 7, 2, 0] |> to => numbers
['zero','one','two','three','four','five','six','seven','eight','nine'] |> to => strings
numbers |> map => { Digit: strings[it], Even: it % 2 == 0 } |> to => digitOddEvens
#each digitOddEvens
    `The digit ${Digit} is ${Even ? "even" : "odd"}.`
/each