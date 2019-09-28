Use the `call` and `Function` APIs to call methods on .NET Types:

- `call` - invoke a method on an instance
- `Function` - create a Function **delegate** that can invoke methods via normal method invocation

## call

In its most simplest form you can invoke an instance method that doesn't have any arguments using just its name:

```js
'Ints'.new([1,2]) |> to => ints
ints.call('GetMethod')
```

Any arguments can be specified in an arguments list:

```js
'Adder'.new([1.0,2.0]) |> to => adder3
adder3.call('Add',[3.0]) //= 6.0
```

### Method Resolution    

The same Resolution rules in **Constructor Resolution** also applies when calling methods where any **ambiguous methods** needs to be
called with arguments containing the **exact types** (as above), or you can specify the argument types of the method you want to call,
in which case it will let you use the built-in Auto Mapping to call a method expecting a `double` with an `int` argument:

```js
adder3.call('Add(double)',[3])
```

### Generic Methods

You can call generic methods by specifying the Generic Type in the method name:

```js
'Ints'.new([1,2]).call('GenericMethod<string>',['A'])
```

`call` only invokes instance methods, to call static methods you'll need to use `Function`.
