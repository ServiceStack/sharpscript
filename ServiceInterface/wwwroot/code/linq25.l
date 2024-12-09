(let ( (numbers [5 4 1 3 9 8 6 7 2 0] )
       (i 0) )
    (println "First numbers not less than their position:")
    (joinln (take-while #(>= % (f++ i)) numbers)))