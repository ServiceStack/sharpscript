(let ( (digits ["zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine"]) )
  (println "Short digits:")
  (doseq (d (filter-index #(< (length %1) %2) digits))
    (println "The word " d " is shorter than its value")))