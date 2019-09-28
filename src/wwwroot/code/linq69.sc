{{ products 
   |> groupBy => it.Category
   |> where => it.any(it => it.UnitsInStock = 0)
   |> let => { Category: it.Key, Products: it } 
   |> htmlDump }}