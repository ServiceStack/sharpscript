(let ( (numbers [5 4 1 3 9 8 6 7 2 0]) )
    (println "First numbers less than 6:")
    (joinln (take-while #(< % 6) numbers)))