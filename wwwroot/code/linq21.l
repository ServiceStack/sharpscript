(println "  First 3 orders in WA:")
(htmldump (take 3 
   (flatmap (fn [c] 
      (map #(it {
            :customer-id (.CustomerId c) 
            :order-id    (.OrderId %) 
            :order-date  (.OrderDate %) }) 
         (.Orders c) ))
      (where #(= (.Region %) "WA") customers-list) )) )