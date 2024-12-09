{{ products 
   |> orderByDescending => it.UnitsInStock
   |> htmlDump }}