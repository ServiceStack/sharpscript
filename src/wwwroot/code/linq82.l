(let ( (words ["cherry", "apple", "blueberry"]) )
    (println "The shortest word is " (apply min (map count words)) " characters long."))