(let ( (words ["cherry" "apple" "blueberry"]) )
    (println "The sorted list of words (by length):")
    (joinln (sort-by count words)))