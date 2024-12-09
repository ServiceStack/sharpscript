{{ [ 'cherry', 'apple', 'blueberry' ] |> to => words }}
{{ words |> min => it.Length |> to => shortestWord }}
The shortest word is {{shortestWord}} characters long.