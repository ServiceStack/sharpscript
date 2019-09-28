{{ [{name:'Alice',score:50},{name:'Bob',score:40},{name:'Cathy',score:45}] |> to => records }}
{{ records |> toDictionary => it.name |> to => scoreRecordsDict }}
Bob's score: {{ scoreRecordsDict.Bob.score }}