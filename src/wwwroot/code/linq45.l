(let ( (anagrams ["from   " " salt" " earn " "  last   " " near " " form  "]) )
    (doseq (x (group-by .Trim { :comparer (AnagramEqualityComparer.) :map /upper } anagrams)) 
        (println (/json x)) ))