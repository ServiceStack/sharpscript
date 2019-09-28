There are 3 different APIs for creating instances of Types:

 - `new` - create instances from Type **name** with specified List of arguments
 - `createInstance` - create instance of **Type** with specified List of arguments
 - `Constructor` - create a Constructor **delegate** that can create instances via method invocation

Built-in .NET Types and Types in `ScriptTypes`, `ScriptAssemblies` or `ScriptNamespaces` can be created using their Type Name, 
including generic Types:

```js
'int'.new()
'DateTime'.new()
'Dictionary<string,DateTime>'.new()
```

Otherwise new instances of Types can be created using their **full Type Name**:

```js
'System.Int32'.new()
'System.Text.StringBuilder'.new()
```

A list of arguments can be passed to the `new` method to call the constructor with the specified arguments:

```js
'Ints'.new([1,2])
'Adder'.new([1.0])
'KeyValuePair<string,int>'.new(['A',1])
```

### Constructor Resolution

`#Script` will use the constructor that matches the same number of specified arguments, when needed it uses
[ServiceStack's Auto Mapping](https://docs.servicestack.net/auto-mapping) to convert instances when their Types don't match, e.g:

```js
'Ints'.new([1.0,2.0])
'KeyValuePair<char,double>'.new(['A',1])
```

However if there are multiple constructors with the same number of arguments, it will only use the constructor where all its argument Types
match with the supplied arguments. Attempting to create an instance of the `Adder` class which only has constructors for `string` or
`double` will fail with an **Ambiguous Match Exception** when trying to create it with an `int`:

```js
'Adder'.new([1])  // FAIL: Ambiguous Constructor
```

In this case you'll need to convert the arguments so its Types matches one of the available constructors:

```js
'Adder'.new([1.0])
'Adder'.new([intArg.toDouble()])
'Adder'.new(['A'])
'Adder'.new([`${instance}`]) // or 'Adder'.new([instance.toString()]) 
```

### Constructor function

Alternatively you can use the `Constructor` method to specify the constructor you want by specifying the argument types of the 
constructor you want to use, which will return a delegate that lets you call a method to create instances using that Type's constructor:

```js
Constructor('Adder(double)') |> to => doubleAdder
Constructor('Adder(string)') |> to => stringAdder
```

In this case you will be able to create instances of `Adder` using an `int` argument as the built-in automapping will convert it to
the Argument Type of the Constructor you've chosen:

```js
doubleAdder(1)
stringAdder(1)

// equivalent to:
Constructor('Adder(double)')(1)
Constructor('Adder(string)')(1)
```

As the Constructor Function returns a delegate you will be able to invoke it like a normal method where it can also be invoked as 
an extension method or inside a filter expression:

```csharp
Constructor('Uri(string)') |> to => url

url('http://example.org')
'http://example.org'.url()
'http://example.org' |> url

// equivalent to:
'Uri'.new(['http://example.org'])
Constructor('Uri(string)')('http://example.org')
```

### C() alias

To reduce syntax noise when needing to create a lot of constructors you can use the much shorter alias `C` instead of `Constructor`:

```js
C('Uri(string)') |> to => url
C('Adder(double)')(1)
```

### createInstance

The `createInstance` is like `new` except it's used to create instances from a `Type` instead of its `string` Type Name:

```js
typeof('Ints').createInstance([1,2])
typeof('Adder').createInstance([1.0])
typeof('KeyValuePair<string,int>').createInstance(['A',1])
```

## set

Once you've created instance you can further populate it using the `set` method which will let you populate **public properties**
with a JS Object literal, performing any auto-mapping conversions as needed:

```js
'Ints'.new([1,2]).set({ C:3, D:4.0 })
Constructor('Ints(int,int)')(1,2).set({ C:3, D:4.0 })
```

As `set` returns the instance, it can be used within a chained expression:

```js
instance.set({ C:3 }).set({ D:4.0 }).call('GetTotal')
```
