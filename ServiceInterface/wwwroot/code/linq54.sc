[ 1.7, 2.3, 1.9, 4.1, 2.9 ] |> to => doubles
`Every other double from highest to lowest:`
doubles |> orderByDescending => it |> step({ by: 2 }) |> joinln