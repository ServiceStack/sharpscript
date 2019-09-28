(let ( (numbers [5 4 1 3 9 8 6 7 2 0])
       (digits  ["zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine"]) )
    (println "Numbers < 5:")
    (joinln (map #(nth digits %) (where #(< % 5) numbers))))