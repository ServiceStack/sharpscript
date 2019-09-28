{{ [20, 10, 40, 50, 10, 70, 30] |> to => attemptedWithdrawals }}
{{ attemptedWithdrawals.reduce((balance, nextWithdrawal) => 
   ((nextWithdrawal <= balance) ? (balance - nextWithdrawal) : balance), 100.0)
   |> to => endBalance }}
Ending balance: {{endBalance}}.