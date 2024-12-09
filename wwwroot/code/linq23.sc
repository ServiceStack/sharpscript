`   All but first 2 orders in WA:`
{{ customers |> zip => it.Orders
   |> let => { c: it[0], o: it[1] }
   |> where => c.Region == 'WA'
   |> skip(2)
   |> map => { c.CustomerId, o.OrderId, o.OrderDate }
   |> htmlDump }}