{{ [1.7, 2.3, 1.9, 4.1, 2.9] |> to => doubles }}
{{ doubles.reduce((runningProduct, nextFactor) => runningProduct * nextFactor, 1)
   |> to => product }}
Total product of all numbers: {{ product }}.