(let ( (strings ["zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine"]) )
    (println "A string starting with 'o': " (first (where #(/startsWith % "o") strings))))