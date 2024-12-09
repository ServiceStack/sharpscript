{{ [5, 4, 1, 3, 9, 8, 6, 7, 2, 0] |> to => numbers }}
{{ numbers.min() |> to => minNum }}
The minimum number is {{minNum}}.