{{ products  
   |> map => it.ProductName[0] 
   |> to => productFirstChars }}
{{ customers 
   |> map => it.CompanyName[0] 
   |> to => customerFirstChars }}
First letters from Product names, but not from Customer names:
{{#each productFirstChars.except(customerFirstChars) }}
  {{it}}
{{/each}}