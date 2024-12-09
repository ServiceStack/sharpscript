(htmldump (flatmap (fn [c] 
        (map-where #(>= (.Total %) 2000)
            #(it {
                :customer-id (.CustomerId c) 
                :order-id    (.OrderId %) 
                :total       (.Total %) })
            (.Orders c) )) 
    customers-list))
