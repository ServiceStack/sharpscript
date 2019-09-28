Type Examples

{{#function info(o) }}
   `${o.getType().typeQualifiedName()} '${o}'` |> raw |> return
{{/function}}

```code
'DateTime'.new() | info
'int'.new() | info
'Int32'.new() | info
'System.Text.StringBuilder'.new() | info
'Dictionary<string,int>'.new() | info

'Ints'.new([1,2])
'Ints'.new([1.0,2.0])
'KeyValuePair<string,int>'.new(['A',1])
'KeyValuePair<char,double>'.new(['A',1])

```
