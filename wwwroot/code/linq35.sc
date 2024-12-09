['zero','one','two','three','four','five','six','seven','eight','nine'] |> to => digits
`Sorted digits:`
digits |> orderBy => it.length |> thenBy => it |> joinln