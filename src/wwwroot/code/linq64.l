(let ( (numbers [5 4 1 3 9 8 6 7 2 0]) )
    (println "Second number > 5: " (:1 (where #(> % 5) numbers))))