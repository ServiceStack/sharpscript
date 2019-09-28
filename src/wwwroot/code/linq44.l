(let ( (anagrams ["from   " " salt" " earn " "  last   " " near " " form  "]) )
    (doseq (x (group-by .Trim { :comparer (AnagramEqualityComparer.) } anagrams)) 
        (println (/json x)) ))