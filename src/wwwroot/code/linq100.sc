[5, 4, 1, 3, 9, 8, 6, 7, 2, 0] |> to => numbers
0 |> to => i
numbers |> let => { i: i + 1 } |> toList |> map => `v = ${index + 1}, i = ${i}` |> joinln