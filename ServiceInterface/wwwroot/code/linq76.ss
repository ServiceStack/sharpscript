{{ customers 
   |> let => { it.CustomerId, OrderCount: it.Orders.count() } 
   |> map => `${CustomerId}, ${OrderCount}` |> joinln }}