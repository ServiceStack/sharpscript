[ 0, 2, 4, 5, 6, 8, 9 ] |> to => numbersA
[ 1, 3, 5, 7, 8 ]       |> to => numbersB
`Common numbers shared by both arrays:`
numbersA.intersect(numbersB) |> joinln