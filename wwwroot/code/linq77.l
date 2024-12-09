(htmldump (map #(it {
                :category (.Key %)
                :product-count (count %) })
            (group-by .Category products-list)))