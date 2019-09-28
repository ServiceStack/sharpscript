In-stock products that cost more than 3.00:
{{#each products where UnitsInStock > 0 && UnitPrice > 3.00}}
  {{ProductName}} is in stock and costs more than 3.00.
{{/each}}