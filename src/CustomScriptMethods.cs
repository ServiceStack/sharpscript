using System.Threading.Tasks;
using ServiceStack;
using ServiceStack.Script;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Diagnostics;
using System;
using ServiceStack.Redis;
using ServiceStack.OrmLite;
using System.Reflection;

namespace SharpScript
{
    public class CustomScriptMethods : ScriptMethods
    {
        public Dictionary<int, KeyValuePair<string, string>> DocsIndex { get; } = new Dictionary<int, KeyValuePair<string, string>>();
        public Dictionary<int, KeyValuePair<string, string>> AppsIndex { get; } = new Dictionary<int, KeyValuePair<string, string>>();
        public Dictionary<int, KeyValuePair<string, string>> CodeIndex { get; } = new Dictionary<int, KeyValuePair<string, string>>();
        public Dictionary<int, KeyValuePair<string, string>> LispIndex { get; } = new Dictionary<int, KeyValuePair<string, string>>();
        public Dictionary<int, KeyValuePair<string, string>> UseCasesIndex { get; } = new Dictionary<int, KeyValuePair<string, string>>();
        public Dictionary<int, KeyValuePair<string, string>> LinqIndex { get; } = new Dictionary<int, KeyValuePair<string, string>>();

        public object prevDocLink(int order)
        {
            if (DocsIndex.TryGetValue(order - 1, out KeyValuePair<string,string> entry))
                return entry;
            return null;
        }

        public object nextDocLink(int order)
        {
            if (DocsIndex.TryGetValue(order + 1, out KeyValuePair<string,string> entry))
                return entry;
            return null;
        }

        public object prevAppsLink(int order)
        {
            if (AppsIndex.TryGetValue(order - 1, out KeyValuePair<string,string> entry))
                return entry;
            return null;
        }

        public object nextAppsLink(int order)
        {
            if (AppsIndex.TryGetValue(order + 1, out KeyValuePair<string,string> entry))
                return entry;
            return null;
        }

        public object prevCodeLink(int order)
        {
            if (CodeIndex.TryGetValue(order - 1, out KeyValuePair<string,string> entry))
                return entry;
            return null;
        }

        public object nextCodeLink(int order)
        {
            if (CodeIndex.TryGetValue(order + 1, out KeyValuePair<string,string> entry))
                return entry;
            return null;
        }

        public object prevLispLink(int order)
        {
            if (LispIndex.TryGetValue(order - 1, out KeyValuePair<string,string> entry))
                return entry;
            return null;
        }

        public object nextLispLink(int order)
        {
            if (LispIndex.TryGetValue(order + 1, out KeyValuePair<string,string> entry))
                return entry;
            return null;
        }

        public object prevUseCaseLink(int order)
        {
            if (UseCasesIndex.TryGetValue(order - 1, out KeyValuePair<string,string> entry))
                return entry;
            return null;
        }

        public object nextUseCaseLink(int order)
        {
            if (UseCasesIndex.TryGetValue(order + 1, out KeyValuePair<string,string> entry))
                return entry;
            return null;
        }

        public object prevLinqLink(int order)
        {
            if (LinqIndex.TryGetValue(order - 1, out KeyValuePair<string,string> entry))
                return entry;
            return null;
        }

        public object nextLinqLink(int order)
        {
            if (LinqIndex.TryGetValue(order + 1, out KeyValuePair<string,string> entry))
                return entry;
            return null;
        }

        List<KeyValuePair<string,string>> sortedDocLinks;
        public object docLinks() => sortedDocLinks ?? (sortedDocLinks = sortLinks(DocsIndex));

        List<KeyValuePair<string,string>> sortedAppsLinks;
        public object appsLinks() => sortedAppsLinks ?? (sortedAppsLinks = sortLinks(AppsIndex));

        List<KeyValuePair<string,string>> sortedCodeLinks;
        public object codeLinks() => sortedCodeLinks ?? (sortedCodeLinks = sortLinks(CodeIndex));
        List<KeyValuePair<string,string>> sortedLispLinks;
        public object lispLinks() => sortedLispLinks ?? (sortedLispLinks = sortLinks(LispIndex));

        List<KeyValuePair<string,string>> sortedUseCaseLinks;
        public object useCaseLinks() => sortedUseCaseLinks ?? (sortedUseCaseLinks = sortLinks(UseCasesIndex));

        List<KeyValuePair<string,string>> sortedLinqLinks;
        public object linqLinks() => sortedLinqLinks ?? (sortedLinqLinks = sortLinks(LinqIndex));

        public List<KeyValuePair<string,string>> sortLinks(Dictionary<int, KeyValuePair<string,string>> links)
        {
            var sortedKeys = links.Keys.ToList();
            sortedKeys.Sort();

            var to = new List<KeyValuePair<string,string>>();

            foreach (var key in sortedKeys)
            {
                var entry = links[key];
                to.Add(entry);
            }

            return to;
        }

        public async Task includeContentFile(ScriptScopeContext scope, string virtualPath)
        {
            var file = HostContext.VirtualFiles.GetFile(virtualPath);
            if (file == null)
                throw new FileNotFoundException($"includeContentFile '{virtualPath}' was not found");

            using (var reader = file.OpenRead())
            {
                await reader.CopyToAsync(scope.OutputStream);
            }
        }

        public List<Customer> customers() => TemplateQueryData.Customers;

        public Process[] processes => Process.GetProcesses();
        public Process[] processesByName(string name) => Process.GetProcessesByName(name);
        public Process processById(int processId) => Process.GetProcessById(processId);
        public Process currentProcess() => Process.GetCurrentProcess();

        Type GetFilterType(string name) => name switch {
            nameof(DefaultScripts) =>      typeof(DefaultScripts),
            nameof(HtmlScripts) =>         typeof(HtmlScripts),
            nameof(ProtectedScripts) =>    typeof(ProtectedScripts),
            nameof(InfoScripts) =>         typeof(InfoScripts),
            nameof(RedisScripts) =>        typeof(RedisScripts),
            nameof(DbScriptsAsync) =>      typeof(DbScriptsAsync),
            nameof(ValidateScripts) =>     typeof(ValidateScripts),
            nameof(AutoQueryScripts) =>    typeof(AutoQueryScripts),
            nameof(ServiceStackScripts) => typeof(ServiceStackScripts),
            _ => throw new NotSupportedException(name)
        };

        public IRawString methodLinkToSrc(string name)
        {
            const string prefix = "https://github.com/ServiceStack/ServiceStack/blob/master/src/ServiceStack.Common/Script/Methods/";

            var type = GetFilterType(name);
            var url = type == typeof(DefaultScripts)
                ? prefix
                : type == typeof(HtmlScripts) || type == typeof(ProtectedScripts)
                    ? $"{prefix}{type.Name}.cs"
                    : type == typeof(InfoScripts)
                    ? "https://github.com/ServiceStack/ServiceStack/blob/master/src/ServiceStack/InfoScripts.cs"
                    : type == typeof(RedisScripts)
                    ? "https://github.com/ServiceStack/ServiceStack.Redis/blob/master/src/ServiceStack.Redis/RedisScripts.cs"
                    : type == typeof(DbScriptsAsync)
                    ? "https://github.com/ServiceStack/ServiceStack.OrmLite/tree/master/src/ServiceStack.OrmLite/DbScriptsAsync.cs"
                    : type == typeof(ValidateScripts)
                    ? "https://github.com/ServiceStack/ServiceStack/blob/master/src/ServiceStack/ValidateScripts.cs"
                    : type == typeof(AutoQueryScripts)
                    ? "https://github.com/ServiceStack/ServiceStack/blob/master/src/ServiceStack.Server/AutoQueryScripts.cs"
                    : type == typeof(ServiceStackScripts)
                    ? "https://github.com/ServiceStack/ServiceStack/blob/master/src/ServiceStack/ServiceStackScripts.cs"
                    : prefix;

            return new RawString($"<a href='{url}'>{type.Name}.cs</a>");
        }

        public ScriptMethodInfo[] methodsAvailable(string name) => ScriptMethodInfo.GetMethodsAvailable(GetFilterType(name));
    }

    public class ScriptMethodInfo
    {
        public string Name { get; set; }
        public string FirstParam { get; set; }
        public string ReturnType { get; set; }
        public int ParamCount { get; set; }
        public string[] RemainingParams { get; set; }

        public static ScriptMethodInfo[] GetMethodsAvailable(Type filterType)
        {
            var filters = filterType.GetMethods(BindingFlags.Instance | BindingFlags.Public);
            var to = filters
                .OrderBy(x => x.Name)
                .ThenBy(x => x.GetParameters().Count())
                .Where(x => x.DeclaringType != typeof(ScriptMethods) && x.DeclaringType != typeof(object))
                .Where(m => !m.IsSpecialName)                
                .Select(ScriptMethodInfo.Create);

            return to.ToArray();
        }

        public static ScriptMethodInfo Create(MethodInfo mi)
        {
            var paramNames = mi.GetParameters()
                .Where(x => x.ParameterType != typeof(ScriptScopeContext))
                .Select(x => x.Name)
                .ToArray();

            var to = new ScriptMethodInfo {
                Name = mi.Name,
                FirstParam = paramNames.FirstOrDefault(),
                ParamCount = paramNames.Length,
                RemainingParams = paramNames.Length > 1 ? paramNames.Skip(1).ToArray() : new string[]{},
                ReturnType = mi.ReturnType?.Name,
            };

            return to;
        }

        public string Return => ReturnType != null && ReturnType != nameof(StopExecution) ? " -> " + ReturnType : "";

        public string Body => ParamCount == 0
            ? $"{Name}"
            : ParamCount == 1
                ? $"|> {Name}"
                : $"|> {Name}(" + string.Join(", ", RemainingParams) + $")";

        public string Display => ParamCount == 0
            ? $"{Name}{Return}"
            : ParamCount == 1
                ? $"{FirstParam} |> {Name}{Return}"
                : $"{FirstParam} |> {Name}(" + string.Join(", ", RemainingParams) + $"){Return}";
    }
}
