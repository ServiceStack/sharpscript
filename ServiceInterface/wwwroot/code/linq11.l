(let ( (product-infos (map #(it {
                                :ProductName (.ProductName %)
                                :Category    (.Category %)
                                :Price       (.UnitPrice %) }) 
                          products-list)) )
    (println "Product Info:")
    (doseq (p product-infos)
      (println (:ProductName p) " is in the category " (:Category p) " and costs " (:Price p))))