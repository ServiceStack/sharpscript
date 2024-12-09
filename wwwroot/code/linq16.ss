{{ customers |> zip => it.Orders
   |> let => { c: it[0], o: it[1] }
   |> where => o.OrderDate >= '1998-01-01'
   |> map => o
   |> htmlDump }}