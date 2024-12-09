(htmldump (map (fn [g] 
              (let ( (min-price (apply min (map .UnitPrice g))) ) {
                      :category (.Key g)
                      :cheapest-products (where #(= (.UnitPrice %) min-price) g)
                  }))
            (group-by .Category products-list)))