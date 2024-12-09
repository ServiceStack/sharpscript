(let ( (words ["cherry", "apple", "blueberry"]) )
    (println "The longest word is " (apply max (map count words)) " characters long."))