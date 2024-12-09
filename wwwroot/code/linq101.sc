[5, 4, 1, 3, 9, 8, 6, 7, 2, 0] |> to => numbers
numbers |> where => it <= 3 |> to => lowNumbers

`First run numbers <= 3:`
lowNumbers |> joinln
10 |> times |> do => numbers[index] = -numbers[index]

`Second run numbers <= 3:`
lowNumbers |> joinln

`Contents of numbers:`
numbers |> joinln