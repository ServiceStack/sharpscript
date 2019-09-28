[ 'cherry', 'apple', 'blueberry' ] |> to => wordsA
[ 'cherry', 'apple', 'blueberry' ] |> to => wordsB
wordsA.equivalentTo(wordsB) |> to => match
`The sequences match: ${match.lower()}`