{{ products
   |> groupBy => it.Category
   |> let => {
        g: it,
        MaxPrice: it.max(p => p.UnitPrice), 
     }
   |> map => { Category: g.Key, MostExpensiveProducts: g.where(p => p.UnitPrice = MaxPrice) }
   |> htmlDump }}