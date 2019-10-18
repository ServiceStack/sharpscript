"Numbers < 5:"
(let ( (numbers [5 4 1 3 9 8 6 7 2 0]) )
    (joinln (where #(< % 5) numbers)))
