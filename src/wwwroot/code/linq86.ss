{{ [ 'cherry', 'apple', 'blueberry' ] |> to => words }}
{{ words |> max => it.Length |> to => longestLength }}
The longest word is {{longestLength}} characters long.