{{ [null, 1.0, 'two', 3, 'four', 5, 'six', 7.0] |> to => numbers }}
Numbers stored as doubles:
{{ numbers 
   |> of({ type: 'Double' })
   |> select: { it |> format('#.0') }\n }}