Function is a universal accessor for .NET Types where it can create a cached **delegate** to access Instance, Static and Generic Static Types - Including Nested Types (aka Inner Classes), Instance, Static and Generic Methods of those Types as well as their Instance and Static Properties, 
Fields and Constants.

As a simple example we'll use `Function` to create a delegate to call .NET's `System.Console.WriteLine(string)` static method:

```js
Function('Console.WriteLine(string)') |> to => writeln
```

Which lets you call it like a regular Script method:

```js
writeln('A')
'A'.writeln()
Function('Console.WriteLine(string)')('A')
```

All Examples below uses classes defined in [ScriptTypes.cs](https://github.com/ServiceStack/sharpscript/blob/master/src/ScriptTypes.cs).

### Instance Methods

`Function` create delegates that lets you genericize the different types of method invocations in .NET, including instance methods, 
generic methods and `void` Action methods on an **instance**:

```js
'InstanceLog'.new(['A']) |> to => o
Function('InstanceLog.Log') |> to => log              // instance void method
Function('InstanceLog.AllLogs') |> to => allLogs      // instance method
Function('InstanceLog.Log<int>') |> to => genericLog  // instance generic method

o.log('B')
log(o,'C')
o.genericLog(1)
o |> genericLog(2)    
o.allLogs() |> to => snapshotLogs
```

### Static Type Methods

As well as calling static methods and static `void` Action methods on a **static Type**:

```js
Function('StaticLog.Clear')()
Function('StaticLog.Log') |> to => log                // static void method
Function('StaticLog.AllLogs') |> to => allLogs        // static method
Function('StaticLog.Log<int>') |> to => genericLog    // static generic method

log('A')
'B'.log()
genericLog('C')
allLogs() |> to => snapshotLogs
```

### Generic Static Type Methods

Including calling generic static methods on a **generic static Type**:

```js
Function('GenericStaticLog<string>.Clear()')()
Function('GenericStaticLog<string>.Log(string)') |> to => log      // generic type static void method
Function('GenericStaticLog<string>.AllLogs') |> to => allLogs      // generic type static method
Function('GenericStaticLog<string>.Log<int>') |> to => genericLog  // generic type generic static method

log('A')
'B'.log()
genericLog('C')
allLogs() |> to => snapshotLogs
```

### F() alias

You can use the shorter `F()` alias to reduce syntax noise when writing #Script that heavily interops directly with .NET Classes.

### Instance and Static Properties, Fields and Constants

In addition to being able to create Delegates that genericize access to .NET Methods, it can also be used to create a delegate
for accessing Instance and Static Properties, Fields and Constants including members of Inner Classes, e.g: 

Each of the members of the following Type definition:

```csharp
public class StaticLog
{
    public static string Prop { get; } = "StaticLog.Prop";
    public static string Field = "StaticLog.Field";
    public const string Const = "StaticLog.Const";

    public string InstanceProp { get; } = "StaticLog.InstanceProp";
    public string InstanceField = "StaticLog.InstanceField";

    public class Inner1
    {
        public static string Prop1 { get; } = "StaticLog.Inner1.Prop1";
        public static string Field1 = "StaticLog.Inner1.Field1";
        public const string Const1 = "StaticLog.Inner1.Const1";

        public string InstanceProp1 { get; } = "StaticLog.Inner1.InstanceProp1";
        public string InstanceField1 = "StaticLog.Inner1.InstanceField1";

        public static class Inner2
        {
            public static string Prop2 { get; } = "StaticLog.Inner1.Inner2.Prop2";
            public static string Field2 = "StaticLog.Inner1.Inner2.Field2";
            public const string Const2 = "StaticLog.Inner1.Inner2.Const2";
        }
    }
}
```

Can be accessed the same way, where you can use `Function` to create a zero-argument delegate for static members that can be immediately invoked, 
or a 1 argument Delegate for instance members.

Examples below uses Function's shorter `F()` alias:

```js
F('StaticLog.Prop')()
F('StaticLog.Field')()
F('StaticLog.Const')()

F('StaticLog.Inner1.Prop1')()
F('StaticLog.Inner1.Field1')()
F('StaticLog.Inner1.Const1')()

F('StaticLog.Inner1.Inner2.Prop2')()
F('StaticLog.Inner1.Inner2.Field2')()
F('StaticLog.Inner1.Inner2.Const2')()

'StaticLog'.new() |> to => o
F('StaticLog.InstanceProp')(o)
F('StaticLog.InstanceField')(o)

'StaticLog.Inner1'.new() |> to => o
F('StaticLog.Inner1.InstanceProp1')(o)
F('StaticLog.Inner1.InstanceField1')(o)
```
