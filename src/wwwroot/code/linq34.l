(let ( (words ["aPPLE" "AbAcUs" "bRaNcH" "BlUeBeRrY" "ClOvEr" "cHeRry"]) )
    (joinln (order-by [{ :comparer (CaseInsensitiveComparer.) :desc true }] words)))