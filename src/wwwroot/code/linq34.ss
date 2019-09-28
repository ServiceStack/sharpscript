{{ ['aPPLE', 'AbAcUs', 'bRaNcH', 'BlUeBeRrY', 'ClOvEr', 'cHeRry'] |> to => words }}
{{ words 
   |> orderByDescending(o => o, { comparer }) 
   |> joinln }}