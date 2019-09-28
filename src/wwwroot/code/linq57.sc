[null, 1.0, 'two', 3, 'four', 5, 'six', 7.0] |> to => numbers 
`Numbers stored as doubles:`
numbers |> of({ type: 'Double' }) |> map => `${it.format('#.0') }` |> joinln