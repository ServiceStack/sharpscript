{{ products 
   |> groupBy => it.Category
   |> let => { 
        g: it,
        MinPrice: it.min(p => p.UnitPrice), 
     }
   |> map => { Category: g.Key, CheapestProducts: g.where(p => p.UnitPrice == MinPrice) }
   |> htmlDump }}
