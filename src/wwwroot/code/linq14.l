(let ( (numbers-a [0 2 4 5 6 8 9])
       (numbers-b [1 3 5 7 8]) )
    (println "Pairs where a < b:")
    (doseq (pair (zip-where #(< %1 %2) #(it { :a %1 :b %2 }) numbers-a numbers-b))
      (println (:a pair) " is less than " (:b pair))))