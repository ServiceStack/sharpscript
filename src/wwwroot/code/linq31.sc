['aPPLE', 'AbAcUs', 'bRaNcH', 'BlUeBeRrY', 'ClOvEr', 'cHeRry'] |> to => words
 words |> orderBy(o => o, { comparer }) |> joinln