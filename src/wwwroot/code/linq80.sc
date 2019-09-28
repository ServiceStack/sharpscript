{{ products 
   |> groupBy => it.Category
   |> map => { Category: it.Key, TotalUnitsInStock: it.sum(p => p.UnitsInStock) } 
   |> htmlDump }}