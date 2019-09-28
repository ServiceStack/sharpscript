(let ( (cutoff-date (DateTime. 1997 1 1)) )
    (htmldump (flatmap (fn [c] 
        (map-where #(>= (.OrderDate %) cutoff-date)
            #(it {
                :customer-id (.CustomerId c) 
                :order-id    (.OrderId %) })
            (.Orders c) ))
        (where #(= (.Region %) "WA") customers-list))))