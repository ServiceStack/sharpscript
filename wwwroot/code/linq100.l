(let ( (numbers [5 4 1 3 9 8 6 7 2 0])
       (i 0) )
    (setq q (map #(it (f++ i)) numbers))
    (doseq (v q) (println "v = " v ", i = " i)))