(let ( (dbls [1.7 2.3 1.9 4.1 2.9]) )
    (println "Every other double from highest to lowest:")
    (joinln (/step (reverse (sort dbls)) { :by 2 })))