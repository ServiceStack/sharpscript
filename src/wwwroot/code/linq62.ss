{{ products |> first => it.ProductId = 789 |> to => product789 }}
Product 789 exists: {{ product789 != null }}