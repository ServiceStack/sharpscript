(let ( (product-first-chars  (map #(:0 (.ProductName %)) products-list))
       (customer-first-chars (map #(:0 (.CompanyName %)) customers-list)) )
    (println "Common first letters from Product names and Customer names:")
    (joinln (/intersect product-first-chars customer-first-chars)))