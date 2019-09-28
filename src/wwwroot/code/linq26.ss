{{ [5, 4, 1, 3, 9, 8, 6, 7, 2, 0] |> to => numbers }}
All elements starting from first element divisible by 3:
{{ numbers 
   |> skipWhile => it % 3 != 0 
   |> joinln }}