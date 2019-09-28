['aPPLE', 'BlUeBeRrY', 'cHeRry'] |> to => words
words |> map => { Uppercase: it.upper(), Lowercase: it.lower() } |> to => upperLowerWords
#each ul in upperLowerWords
    `Uppercase: ${ul.Uppercase}, Lowercase: ${ul.Lowercase}`
/each