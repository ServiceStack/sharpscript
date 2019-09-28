{{ [2, 2, 3, 5, 5] |> to => factorsOf300 }}
Prime factors of 300:
{{ factorsOf300.distinct() |> joinln }}