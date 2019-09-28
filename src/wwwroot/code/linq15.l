(let ( (orders (flatmap (fn [c]
                    (map #(it {
                            :customer-id (.CustomerId c) 
                            :order-id    (.OrderId %) 
                            :total       (.Total %) }) 
                        (where #(< (.Total %) 500) (.Orders c)) ))
                    customers-list)) )
    (htmldump orders))