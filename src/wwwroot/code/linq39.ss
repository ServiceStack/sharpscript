{{ ['zero','one','two','three','four','five','six','seven','eight','nine'] |> to =>digits }}
A backwards list of the digits with a second character of 'i':
{{ digits 
   |> where => it[1] == 'i'
   |> reverse
   |> joinln }}