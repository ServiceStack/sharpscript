{{ products
   |> where => it.ProductId == 12 
   |> first
   |> dump }}