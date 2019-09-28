{{ products 
   |> groupBy => it.Category
   |> map => { Category: it.Key, CheapestPrice: it.min(p => p.UnitPrice) }
   |> htmlDump }}