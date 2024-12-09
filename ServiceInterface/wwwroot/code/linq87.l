(htmldump (map #(it {
                  :category (.Key %)
                  :most-expensive-price (apply max (map .UnitPrice %))
                })
              (group-by .Category products-list)))