{{ [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ] |> to => numbers }} 
{{ numbers |> where => it > 5 | elementAt(1) |> to => fourthLowNum }}
Second number > 5: {{ fourthLowNum }}