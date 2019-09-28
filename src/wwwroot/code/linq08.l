(let ( (numbers [5 4 1 3 9 8 6 7 2 0])
       (strings ["zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine"]) )
    (println "Number strings:")
    (joinln (map #(nth strings %) numbers)))