{{ ['from   ', ' salt', ' earn ', '  last   ', ' near ', ' form  '] |> to => anagrams }}
{{#each anagrams.groupBy(w => w.trim(), { comparer: anagramComparer }) }}
{{it |> json}}
{{/each}}
