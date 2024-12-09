(htmldump (map-where #(any? (fn [p] (= (.UnitsInStock p) 0)) %) 
                     #(it { :category (.Key %), :products % })
                     (group-by .Category products-list)))