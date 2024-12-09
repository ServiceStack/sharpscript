(let ( (customer-orders (map 
            #(it (str "Customer #" (:i %) " has an order with OrderID " (.OrderId (:o %))))
            (flatten (map-index (fn [c i] (map #(it { 
                    :o % 
                    :i (1+ i) }) 
                (.Orders c))) customers-list)))) )
    (joinln customer-orders))