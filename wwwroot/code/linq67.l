(let ( (words ["believe" "relief" "receipt" "field"]) )
    (println "There is a word that contains in the list that contains 'ei': " 
        (any? #(.Contains % "ie") words)))