{{ [2, 2, 3, 5, 5] |> to => factorsOf300 }}
{{ factorsOf300.distinct().count() |> to => uniqueFactors }}
There are {{uniqueFactors}} unique factors of 300.