(let ( (words ["cherry", "apple", "blueberry"]) )
    (println "The average word length is " (apply average (map count words)) " characters."))