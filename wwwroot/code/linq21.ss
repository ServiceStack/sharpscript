   First 3 orders in WA:
{{ customers |> zip => it.Orders 
   |> let => { c: it[0], o: it[1] }
   |> where => c.Region == 'WA'
   |> take(3)
   |> map => o
   |> htmlDump }}