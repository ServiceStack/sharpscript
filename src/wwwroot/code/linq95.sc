customers |> map => it.CompanyName |> to => customerNames
products  |> map => it.ProductName |> to => productNames
`Customer and product names:`
customerNames.concat(productNames) |> joinln