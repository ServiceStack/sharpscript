(let ( (words ["aPPLE" "AbAcUs" "bRaNcH" "BlUeBeRrY" "ClOvEr" "cHeRry"]) )
    (joinln (sort-by it (CaseInsensitiveComparer.) words)))