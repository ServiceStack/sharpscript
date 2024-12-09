(let ( (numbers [nil 1.0 "two" 3 "four" 5 "six" 7.0]) )
    (println "Numbers stored as doubles:")
    (joinln (/of numbers { :type "Double" })))