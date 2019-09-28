['from   ', ' salt', ' earn ', '  last   ', ' near ', ' form  '] |> to => anagrams
#each anagrams.groupBy(w => w.trim(), { map: a => a.upper(), comparer: anagramComparer })
    it |> json
/each