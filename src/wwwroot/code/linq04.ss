Customers from Washington and their orders:
{{#each c in customers where c.Region == 'WA'}}
Customer {{ c.CustomerId }} {{ c.CompanyName |> raw }}
{{#each c.Orders}}
    Order {{ OrderId }}: {{ OrderDate |> dateFormat }}
{{/each}}
{{/each}}