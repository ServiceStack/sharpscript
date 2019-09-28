(let ( (numbers [5 4 1 3 9 8 6 7 2 0]) )
 
    (defn low-numbers [] (where #(<= % 3) numbers))

    (println "First run numbers <= 3:")
    (doseq (n (low-numbers)) (println n))

    (setq numbers (map #(- %) numbers))
    
    (println "Second run numbers <= 3")
    (doseq (n (low-numbers)) (println n)))