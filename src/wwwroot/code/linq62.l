(let ( (product-789 (first (where #(= (.ProductId %) 789) products-list))) )
    (println "Product 789 exists: " (not= product-789 nil)))