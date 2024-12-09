(let ( (numbers [5 4 1 3 9 8 6 7 2 0]) )
    (println "All but first 4 numbers:")
    (joinln (skip 4 numbers)))