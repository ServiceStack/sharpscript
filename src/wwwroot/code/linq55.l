(let ( (words ["cherry" "apple" "blueberry"]) )
    (println "The sorted word list:")
    (joinln (to-list (sort words))))