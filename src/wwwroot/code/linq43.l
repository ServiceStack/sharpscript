(let ( (customer-order-groups
      (map (fn [c] {
        :company-name (.CompanyName c)
        :year-groups  (map (fn [yg] {
                :year (.Key yg)
                :month-groups (map #(it {
                        :month  (.Key %)
                        :orders % })
                    (group-by #(.Month (.OrderDate %)) yg)) }) 
            (group-by #(it (.Year (.OrderDate %))) (.Orders c))) }) 
      customers-list)) )
    (htmldump customer-order-groups))