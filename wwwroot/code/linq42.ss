{{ products 
   |> groupBy => it.Category
   |> let => { Category: it.Key, Products: it }
   |> htmlDump }}