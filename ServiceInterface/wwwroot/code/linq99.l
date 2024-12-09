(let ( (numbers [5 4 1 3 9 8 6 7 2 0])
       (i 0) )
    (doseq (v (map #(it (fn [] (f++ i))) numbers)) (println "v = " (v) ", i = " i)))