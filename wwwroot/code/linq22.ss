{{ [5, 4, 1, 3, 9, 8, 6, 7, 2, 0] |> to => numbers }}
All but first 4 numbers:
{{#each numbers skip 4}}
{{it}}
{{/each}}
