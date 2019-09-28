products  |> map => it.ProductName[0] |> to => productFirstChars
customers |> map => it.CompanyName[0] |> to => customerFirstChars
`Unique first letters from Product names and Customer names:`
#each productFirstChars.union(customerFirstChars)
  it
/each