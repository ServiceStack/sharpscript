(let ( (numbers [5 4 1 3 9 8 6 7 2 0])
       (strings ["zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine"]) )
    (doseq (d (map #(it { :digit (nth strings %) :even (even? %) }) numbers))
        (println "The digit " (:digit d) " is " (if (:even d) "even" "odd")) ))