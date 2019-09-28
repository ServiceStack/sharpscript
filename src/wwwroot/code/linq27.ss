{{ [5, 4, 1, 3, 9, 8, 6, 7, 2, 0] |> to => numbers }}
All elements starting from first element less than its position:
{{ numbers 
   |> skipWhile => it >= index 
   |> joinln }}