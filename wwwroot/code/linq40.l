(let ( (numbers [5 4 1 3 9 8 6 7 2 0]) 
       (number-groups) )
    (setq number-groups 
        (map #(it { :remainder (.Key %) :numbers % }) (group-by #(mod % 5) numbers)))
    (doseq (g number-groups)
        (println "Numbers with a remainder of " (:remainder g) " when divided by 5:")
        (println (joinln (:numbers g))) ))