['aPPLE', 'AbAcUs', 'bRaNcH', 'BlUeBeRrY', 'ClOvEr', 'cHeRry'] |> to => words
words |> orderBy => it.length |> thenBy(w => w, { comparer })  |> joinln