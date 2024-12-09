{{ var numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0] }}

code:
```code
#each numbers where it < 5
  it
/each
```

lisp:
{|lisp (joinln (where #(< % 5) numbers)) |}