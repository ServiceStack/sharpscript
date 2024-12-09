'1997-01-01' |> to => cutoffDate
{{ customers 
   |> where => it.Region == 'WA'
   |> zip => it.Orders
   |> let => { c: it[0], o: it[1] }
   |> where => o.OrderDate >= cutoffDate 
   |> map => o
   |> htmlDump }}