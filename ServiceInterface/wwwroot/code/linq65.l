(doseq (n (range 100 150))
    (println "The number " n " is " (if (even? n) "even" "odd")))