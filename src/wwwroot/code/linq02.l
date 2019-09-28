(let ( (sold-out-products (where #(= 0 (.UnitsInStock %)) products-list)) )
    (println "Sold out products:")
    (doseq (p sold-out-products)
        (println (.ProductName p) " is sold out") ))