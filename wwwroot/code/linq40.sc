[5, 4, 1, 3, 9, 8, 6, 7, 2, 0] |> to => nums
{{ nums 
   |> groupBy => it % 5
   |> let => { remainder: it.Key, nums: it }
   |> map => `Numbers with a remainder of ${remainder} when divided by 5:\n${nums.join('\n')}`
   |> joinln
}}