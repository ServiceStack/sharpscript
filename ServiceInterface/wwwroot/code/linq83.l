(htmldump (map #(it {
                :category (.Key %)
                :cheapest-price (apply min (map .UnitPrice %)) })
            (group-by .Category products-list)))