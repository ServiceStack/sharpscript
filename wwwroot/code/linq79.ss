{{ [ 'cherry', 'apple', 'blueberry'] |> to => words }}
{{ words |> sum => it.Length |> to => totalChars }}
There are a total of {{totalChars}} characters in these words.