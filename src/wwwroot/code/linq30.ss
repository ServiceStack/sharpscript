{{ products 
   |> orderBy => it.ProductName 
   |> htmlDump }}