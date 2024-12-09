(doseq (x (map #(it {
                :customer-id (.CustomerId %) 
                :order-count (count (.Orders %)) }) 
            customers-list))
    (println (:customer-id x) ", " (:order-count x)))