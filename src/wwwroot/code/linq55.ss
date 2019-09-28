{{ [ 'cherry', 'apple', 'blueberry' ] |> to => words }}
The sorted word list:
{{ words
   |> orderBy => it 
   |> toList 
   |> joinln }}