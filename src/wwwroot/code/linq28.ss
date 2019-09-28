{{ ['cherry', 'apple', 'blueberry'] |> to => words }}
The sorted list of words:
{{#each words orderby it}}
{{it}}
{{/each}}
