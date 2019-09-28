(println "In-stock products that cost more than 3.00:")
(doseq (p (where #(and (> (.UnitsInStock %) 0) (> (.UnitPrice %) 3)) products-list))
  (println (.ProductName p) " is in stock and costs more than 3.00"))