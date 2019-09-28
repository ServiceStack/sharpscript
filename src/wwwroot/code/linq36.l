(let ( (words ["aPPLE" "AbAcUs" "bRaNcH" "BlUeBeRrY" "ClOvEr" "cHeRry"]) )
    (joinln (order-by [#(count %) { :comparer (CaseInsensitiveComparer.) }] words)))