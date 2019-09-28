{{ products 
   |> groupBy => it.Category
   |> map => { Category: it.Key, AveragePrice: it.average(p => p.UnitPrice) } 
   |> htmlDump }}