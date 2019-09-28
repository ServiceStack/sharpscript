(let ( (words ["blueberry" "chimpanzee" "abacus" "banana" "apple" "cheese"])
       (word-groups) )
    (setq word-groups 
        (map #(it {:first-letter (.Key %) :words % }) (group-by #(:0 %) words) ))
    (doseq (g word-groups)
        (println "Words that start with the letter: " (:first-letter g))
        (println (joinln (:words g))) ))