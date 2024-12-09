(let ( (product-first-chars  (map #(:0 (.ProductName %)) products-list))
       (customer-first-chars (map #(:0 (.CompanyName %)) customers-list)) )
    (println "First letters from Product names, but not from Customer names:")
    (joinln (/except product-first-chars customer-first-chars)))