(htmldump (map #(it {
                :category (.Key %)
                :total-units-in-stock (sum (map .UnitsInStock %)) })
              (group-by .Category products-list)))