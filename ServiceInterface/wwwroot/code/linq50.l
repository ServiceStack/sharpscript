(let ( (numbers-a [0 2 4 5 6 8 9])
       (numbers-b [1 3 5 7 8]) )
    (println "Common numbers shared by both arrays:")
    (joinln (/intersect numbers-a numbers-b)))