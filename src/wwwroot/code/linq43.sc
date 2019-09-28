{{ customers |> map => { 
    CompanyName: it.CompanyName, 
    YearGroups: it.Orders.groupBy(it => it.OrderDate.Year).map(yg =>
        { 
            Year: yg.Key,
            MonthGroups: yg.groupBy(o => o.OrderDate.Month).map(mg => 
                { Month: mg.Key, Orders: mg }
            ) 
        }
      ) 
   }
   |> htmlDump }}