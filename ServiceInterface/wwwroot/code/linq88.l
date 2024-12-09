(htmldump (map (fn [g] (
                let ( (max-price (apply max (map .UnitPrice g))) ) {
                      :category (.Key g)
                      :most-expensive-products (where #(= (.UnitPrice %) max-price) g) 
                    }))
                (group-by .Category products-list)))