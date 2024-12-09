{{ customers   |> where => it.Region == 'WA' |> to => waCustomers }}
Customers from Washington and their orders:
{{ waCustomers |> selectPartial: customer }}