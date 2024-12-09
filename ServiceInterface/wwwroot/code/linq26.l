(let ( (numbers [5 4 1 3 9 8 6 7 2 0]) )
    (println "All elements starting from first element divisible by 3:")
    (joinln (skip-while #(not= (mod % 3) 0) numbers)))