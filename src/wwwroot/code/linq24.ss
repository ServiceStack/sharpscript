{{ [5, 4, 1, 3, 9, 8, 6, 7, 2, 0] |> to => numbers }}
First numbers less than 6:
{{ numbers 
   |> takeWhile => it < 6 
   |> joinln }}