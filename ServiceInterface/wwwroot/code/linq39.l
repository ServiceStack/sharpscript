(let ( (digits ["zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine"]) )
    (println "A backwards list of the digits with a second character of 'i':")
    (joinln (reverse (where #(= (:1 %) (:0 "i")) digits))))