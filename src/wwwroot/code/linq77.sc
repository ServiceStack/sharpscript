{{ products 
   |> groupBy => it.Category
   |> let => { Category: it.Key, ProductCount: it.count() }
   |> htmlDump }}