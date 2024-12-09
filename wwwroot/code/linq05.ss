{{ ['zero','one','two','three','four','five','six','seven','eight','nine'] |> to => digits }}
Short digits:
{{#each d in digits where d.Length < index}}
  The word {{d}} is shorter than its value.
{{/each}}
