(let ( (digits ["zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine"]) 
         (i 0) )
    (println "Sorted digits:")
    (joinln (order-by [#(count %) it] digits )))