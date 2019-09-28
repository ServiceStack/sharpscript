{{ customers 
   |> let => { cust: it, custIndex: index }
   |> zip => cust.Orders
   |> let => { o: it[1] }
   |> map => `Customer #${custIndex + 1} has an order with OrderID ${o.OrderId}` |> joinln }}