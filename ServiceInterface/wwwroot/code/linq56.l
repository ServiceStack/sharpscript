(let ( (sorted-records [{ :name "Alice", :score 50 }
                        { :name "Bob",   :score 40 }
                        { :name "Cathy", :score 45 }]) )
    (println "Bob's score: " (:score (:"Bob" (to-dictionary :name sorted-records)))))