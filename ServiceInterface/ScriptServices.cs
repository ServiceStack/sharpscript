using System.Collections.Generic;
using ServiceStack;
using ServiceStack.Script;
using ServiceStack.IO;
using System.Threading.Tasks;
using System;
using ServiceStack.OrmLite;
using ServiceStack.Data;

namespace SharpScript
{
    [Route("/pages/eval")]
    public class EvaluateScripts : IReturn<string>
    {
        public Dictionary<string,string> Files { get; set; }
        public Dictionary<string,string> Args { get; set; }

        public string Page { get; set; }
    }

    [Route("/template/eval")]
    public class EvaluateScript
    {
        public string Template { get; set; }
    }

    [Route("/expression/eval")]
    public class EvalExpression : IReturn<EvalExpressionResponse>
    {
        public string Expression { get; set; }
    }

    public class EvalExpressionResponse
    {
        public object Result { get; set; }
        public string Tree { get; set; }
        public ResponseStatus ResponseStatus { get; set; }
    }

    [ReturnExceptionsInJson]
    public class ScriptServices : Service
    {
        public async Task<string> Any(EvaluateScripts request)
        {
            var context = new ScriptContext {
                ScriptMethods = {
                    new ProtectedScripts(),
                },
                ExcludeFiltersNamed = { "fileWrite","fileAppend","fileDelete","dirDelete" }
            }.Init();

            foreach (var entry in request.Files.Safe())
            {
                context.VirtualFiles.WriteFile(entry.Key, entry.Value);
            }

            var pageResult = new PageResult(context.GetPage(request.Page ?? "page"));

            foreach (var entry in request.Args.Safe())
            {
                pageResult.Args[entry.Key] = entry.Value;
            }

            return await pageResult.RenderToStringAsync(); // render to string so [ReturnExceptionsInJson] can detect Exceptions and return JSON
        }

        public async Task<string> Any(EvaluateScript request)
        {
            var context = new ScriptContext {
                DebugMode = false,
                ScriptLanguages = { ScriptLisp.Language },
                ScriptMethods = {
                    new DbScriptsAsync(),
                    new AutoQueryScripts(),
                    new ServiceStackScripts(),
                    new CustomScriptMethods(),
                },
                Plugins = {
                    new ServiceStackScriptBlocks(),
                    new MarkdownScriptPlugin(),
                }
            };
            //Register any dependencies filters need:
            context.Container.AddSingleton(() => base.GetResolver().TryResolve<IDbConnectionFactory>());
            context.Init();
            var pageResult = new PageResult(context.OneTimePage(request.Template)) 
            {
                Args = base.Request.GetScriptRequestParams(importRequestParams:true)
            };
            return await pageResult.RenderToStringAsync(); // render to string so [ReturnExceptionsInJson] can detect Exceptions and return JSON
        }

        public object Any(EvalExpression request)
        {
            if (string.IsNullOrWhiteSpace(request.Expression))
                return new EvalExpressionResponse();

            var args = new Dictionary<string,object>();
            foreach (String name in Request.QueryString.AllKeys)
            {
                if (name.EqualsIgnoreCase("expression"))
                    continue;

                var argExpr = Request.QueryString[name];
                var argValue = JS.eval(argExpr);
                args[name] = argValue;
            }

            var scope = JS.CreateScope(args: args);
            var expr = JS.expression(request.Expression.Trim());

            var response = new EvalExpressionResponse {
                Result = ScriptLanguage.UnwrapValue(expr.Evaluate(scope)),
                Tree = expr.ToJsAstString(),
            };
            return response;
        }
    }
    
}