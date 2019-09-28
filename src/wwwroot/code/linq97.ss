{{ [ 'cherry', 'apple', 'blueberry' ] |> to => wordsA }}
{{ [ 'apple', 'blueberry', 'cherry' ] |> to => wordsB }}
{{ wordsA.equivalentTo(wordsB) |> to => match }}
The sequences match: {{ match |> lower }}
