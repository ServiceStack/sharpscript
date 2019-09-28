`Product Info:`
products |> map => { it.ProductName, it.Category, Price: it.UnitPrice } |> to => productInfos
#each productInfos
`${ProductName} is in the Category ${Category} and costs ${Price.currency()} per unit.`
/each