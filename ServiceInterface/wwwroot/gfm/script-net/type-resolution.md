If you've registered Types using either `ScriptTypes` or `ScriptAssemblies` than you'll be able to reference the Type using
**just the Type Name**, unless multiple Types of the same name are registered in which case the `typeof()` will return the **first Type**
registered, all other subsequent Types with the same Name will need to be referenced with their **Full Name**.

```js
typeof('MyType')
typeof('My.Namespace.MyType')
```

When `AllowScriptingOfAllTypes=true` is enabled, you can use `ScriptNamespaces` to add Lookup Namespaces for resolving Types, 
which for #Script Pages, Sharp Apps and Sharp Scripts are pre-configured with:

```csharp
var context = new ScriptContext {
    //...
    ScriptNamespaces = {
        "System",
        "System.Collections.Generic",
        "ServiceStack",
    }
}.Init();
```

All other Types (other than [.NET built-in types](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/built-in-types-table)) 
not registered in `ScriptTypes`, `ScriptAssemblies` or have their namespace defined in `ScriptNamespaces` will need to be referenced using
their **Full Type Name**. This same Type resolution applies for all references of Types in `#Script`.

#### Examples Configuration

The examples below assumes a `ScriptContext` configured with:

```csharp
var context = new ScriptContext {
    ScriptMethods = { new ProtectedScripts() },
    AllowScriptingOfAllTypes = true,
    ScriptNamespaces = {
        "System",
        "System.Collections.Generic",
    },
    ScriptTypes = {
        typeof(Ints),
        typeof(Adder),
        typeof(StaticLog),
        typeof(InstanceLog),
        typeof(GenericStaticLog<>),
    },
}.Init();
```

With the types for the above classes defined in [ScriptTypes.cs](https://github.com/ServiceStack/sharpscript/blob/master/src/ScriptTypes.cs).
This is the definition of the `Adder` class that's referenced frequently in the examples below:

```csharp
public class Adder
{
    public string String { get; set; }
    public double Double { get; set; }

    public Adder(string str) => String = str;
    public Adder(double num) => Double = num;

    public string Add(string str) => String += str;
    public double Add(double num) => Double += num;

    public override string ToString() => String != null ? $"string: {String}" : $"double: {Double}";
}
```
