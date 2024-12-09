(let ( (orders (flatmap (fn [c] 
                    (map-where #(> (.OrderDate %) (DateTime. 1998 1 1))
                        #(it {
                            :customer-id (.CustomerId c) 
                            :order-id    (.OrderId %) 
                            :order-date  (.OrderDate %) }) 
                        (.Orders c) )) 
                    customers-list) ))
     (htmldump orders))