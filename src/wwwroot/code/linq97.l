(let ( (words-a ["cherry" "apple" "blueberry"]) 
       (words-b ["apple" "blueberry" "cherry"]) )
    (println "The sequences match: " (/sequenceEquals words-a words-b)))