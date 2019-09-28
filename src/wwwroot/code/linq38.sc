['aPPLE', 'AbAcUs', 'bRaNcH', 'BlUeBeRrY', 'ClOvEr', 'cHeRry'] |> to => words
words |> orderBy => it.length |> thenByDescending(w => w, { comparer }) |> joinln