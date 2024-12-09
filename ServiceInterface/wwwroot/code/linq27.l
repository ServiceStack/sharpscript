(let ( (numbers [5 4 1 3 9 8 6 7 2 0])
       (i 0) )
    (println "All elements starting from first element less than its position:")
    (joinln (skip-while #(>= % (f++ i)) numbers)))