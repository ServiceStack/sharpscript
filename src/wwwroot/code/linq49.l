(let ( (product-first-chars  (map #(:0 (.ProductName %)) products-list))
       (customer-first-chars (map #(:0 (.CompanyName %)) customers-list)) )
        
    (println "Unique first letters from Product names and Customer names:")
    (joinln (/union product-first-chars customer-first-chars)))