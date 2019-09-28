(htmldump (map #(it {
                  :category (.Key %)
                  :average-price (apply average (map .UnitPrice %))
                })
              (group-by .Category products-list)))