Use the `call` and `Function` APIs to call methods on .NET Types:

- `call` - invoke a method on an instance
- `Function` - create a Function **delegate** that can invoke methods via normal method invocation

## call

In its most simplest form you can invoke an instance method that doesn't have any arguments using just its name:

```js
'Ints'.new([1,2]) | to => ints
ints.call('GetMethod')
```

Any arguments can be specified in an arguments list:

```js
'Adder'.new([1.0,2.0]) | to => adder3
adder3.call('Add',[3.0]) //= 6.0
```

### Method Resolution    

The same Resolution rules in **Constructor Resolution** also applies when calling methods where any ambiguous methods needs to be
called with arguments containing the exact types (as above), or you can specify the argument types of the method you want to call,
in which case it will let you use the built-in Auto Mapping to call a method expecting a `double` with an `int` argument:

```js
adder3.call('Add(double)',[3])
```

### Generic Methods

You can call generic methods by specifying the Generic Type in the method name:

```js
'Ints'.new([1,2]).call('GenericMethod<string>',['A'])
```

## Function

`call` only invokes instance methods, to call static methods you'll need to create a **delegate** of it first using the 
`Function` method

```js
Function('Console.WriteLine(string)') | to => writeln
```

Which lets you call it like a regular Script method:

```js
writeln('A')
'A'.writeln()
Function('Console.WriteLine(string)')('A')
```

Examples below uses classes in [ScriptTypes.cs](https://github.com/ServiceStack/sharpscript/blob/master/src/ScriptTypes.cs).

### Instance Methods

`Function` create delegates that lets you genericize the different types of method invocations in .NET, including instance methods, 
instance generic methods and `void` Action methods:

```js
'InstanceLog'.new(['A']) | to => o
Function('InstanceLog.Log') | to => log              // instance void method
Function('InstanceLog.AllLogs') | to => allLogs      // instance method
Function('InstanceLog.Log<int>') | to => genericLog  // instance generic method

o.log('B')
log(o,'C')
o.genericLog(1)
o | genericLog(2)    
o.allLogs() | to => snapshotLogs
```

### Static Type Methods

Examples of using `Function` to call static methods and static action methods on a static Type:

```js
Function('StaticLog.Clear')()
Function('StaticLog.Log') | to => log                // static void method
Function('StaticLog.AllLogs') | to => allLogs        // static method
Function('StaticLog.Log<int>') | to => genericLog    // static generic method

log('A')
'B'.log()
genericLog('C')
allLogs() | to => snapshotLogs
```

### Generic Static Type Methods

Examples of using `Function` to call static methods and void action methods on a generic static Type:

```js
Function('GenericStaticLog<string>.Clear()')()
Function('GenericStaticLog<string>.Log(string)') | to => log      // generic type static void method
Function('GenericStaticLog<string>.AllLogs') | to => allLogs      // generic type static method
Function('GenericStaticLog<string>.Log<int>') | to => genericLog  // generic type generic static method

log('A')
'B'.log()
genericLog('C')
allLogs() | to => snapshotLogs
```
