{{ [5, 4, 1, 3, 9, 8, 6, 7, 2, 0] |> to => numbers }}
Numbers + 1:
{{#each numbers}}
  {{ it + 1 }}
{{/each}}
