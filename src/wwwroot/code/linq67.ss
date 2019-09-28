{{ ['believe', 'relief', 'receipt', 'field'] |> to => words }}
{{ words |> any => it.contains('ei') |> to => iAfterE }}
There is a word that contains in the list that contains 'ei': {{ iAfterE | lower }}