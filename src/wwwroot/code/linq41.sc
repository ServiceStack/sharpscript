['blueberry', 'chimpanzee', 'abacus', 'banana', 'apple', 'cheese'] |> to => words
words |> groupBy => it[0] |> map => { firstLetter: it.Key, words: it } |> to => groups
#each groups
    `Words that start with the letter '${firstLetter}':`
    words |> joinln
/each
