(let ( (customer-names (map .CompanyName customers-list))
       (product-names  (map .ProductName products-list)) )
    (println "Customer and product names:")
    (joinln (flatten [customer-names product-names])))