using System.Text;

namespace SharpScript
{
    public class Ints
    {
        public Ints(int a, int b)
        {
            A = a;
            B = b;
        }
        public int A { get; set; }
        public int B { get; set; }
        public int C { get; set; }
        public int D { get; set; }
        public int GetTotal() => A + B + C + D;

        public string GenericMethod<T>() => typeof(T).Name + " " + GetTotal();

        public string GenericMethod<T>(T value) => typeof(T).Name + $" {value} " + GetTotal();
    }

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

    public class StaticLog
    {
        static StringBuilder sb = new StringBuilder();

        public static void Log(string message) => sb.Append(message);

        public static string AllLogs() => sb.ToString();

        public static void Clear() => sb.Clear();
    }

    public class InstanceLog
    {
        private readonly string prefix;
        public InstanceLog(string prefix) => this.prefix = prefix;

        StringBuilder sb = new StringBuilder();

        public void Log(string message) => sb.Append(prefix + " " + message);

        public void Log<T2>(string message) => sb.Append(prefix + " " + typeof(T2).Name + " " + message);

        public string AllLogs() => sb.ToString();

        public void Clear() => sb.Clear();
    }

    public class GenericStaticLog<T>
    {
        static StringBuilder sb = new StringBuilder();

        public static void Log(string message) => sb.Append(typeof(T).Name + " " + message);

        public static void Log<T2>(string message) => sb.Append(typeof(T).Name + " " + typeof(T2).Name + " " + message);

        public static string AllLogs() => sb.ToString();

        public static void Clear() => sb.Clear();
    }
   
}
