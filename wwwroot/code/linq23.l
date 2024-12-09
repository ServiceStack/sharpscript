(println "All but first 2 orders in WA:")
(htmldump (skip 2 
   (flatmap (fn [c] 
      (map #(it {
            :customer-id (.CustomerId c) 
            :order-id    (.OrderId %) 
            :order-date  (.OrderDate %) }) 
         (.Orders c) ))
      (where #(= (.Region %) "WA") customers-list) )) )