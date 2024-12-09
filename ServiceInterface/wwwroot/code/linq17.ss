{{ customers |> zip => it.Orders
   |> let => { c: it[0], o: it[1] }
   |> where => o.Total >= 2000 
   |> map => o
   |> htmlDump }}