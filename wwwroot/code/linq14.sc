[0, 2, 4, 5, 6, 8, 9] |> to => numbersA
[1, 3, 5, 7, 8]       |> to => numbersB
`Pairs where a < b:`
{{ numbersA.zip(numbersB)
   |> let => { a: it[0], b: it[1] }  
   |> where => a < b 
   |> map => `${a} is less than ${b}` |> joinln
}}