using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using ServiceStack;

namespace SharpScript
{
    public class QueryGitHubRepos : QueryData<GithubRepo>
    {
        public string UserName { get; set; }
    }

    [Route("/github/{UserName}")]
    public class GetGithubRepos : IReturn<List<GithubRepo>>
    {
        public string UserName { get; set; }
    }

    public class GithubRepo
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Homepage { get; set; }
        public string Language { get; set; }
        public int Watchers_Count { get; set; }
        public int Stargazes_Count { get; set; }
        public int Forks_Count { get; set; }
        public int Open_Issues_Count { get; set; }
        public int Size { get; set; }
        public string Full_Name { get; set; }
        public DateTime Created_at { get; set; }
        public DateTime? Pushed_At { get; set; }
        public DateTime? Updated_At { get; set; }

        public bool Has_issues { get; set; }
        public bool Has_Downloads { get; set; }
        public bool Has_Wiki { get; set; }
        public bool Has_Pages { get; set; }
        public bool Fork { get; set; }

        public GithubUser Owner { get; set; }
        public string Svn_Url { get; set; }
        public string Mirror_Url { get; set; }
        public string Url { get; set; }
        public string Ssh_Url { get; set; }
        public string Html_Url { get; set; }
        public string Clone_Url { get; set; }
        public string Git_Url { get; set; }
        public bool Private { get; set; }
    }

    public class GithubUser
    {
        public int Id { get; set; }
        public string Login { get; set; }
        public string Avatar_Url { get; set; }
        public string Url { get; set; }
        public int? Followers { get; set; }
        public int? Following { get; set; }
        public string Type { get; set; }
        public int? Public_Gists { get; set; }
        public string Location { get; set; }
        public string Company { get; set; }
        public string Html_Url { get; set; }
        public int? Public_Repos { get; set; }
        public DateTime? Created_At { get; set; }
        public string Blog { get; set; }
        public string Email { get; set; }
        public string Name { get; set; }
        public bool? Hireable { get; set; }
        public string Gravatar_Id { get; set; }
        public string Bio { get; set; }
    }

    public class GithubOrg
    {
        public int Id { get; set; }
        public string Avatar_Url { get; set; }
        public string Url { get; set; }
        public string Login { get; set; }
    }

    public class GithubByUser
    {
        public string Name { get; set; }
        public string Email { get; set; }
        public DateTime Date { get; set; }
    }

    public class AutoDataQueryServices : Service
    {
        public object Any(GetGithubRepos request)
        {
            var map = new Dictionary<int, GithubRepo>();
            GetUserRepos(request.UserName).Each(x => map[x.Id] = x);
            GetOrgRepos(request.UserName).Each(x => map[x.Id] = x);
            GetUserOrgs(request.UserName).Each(org =>
                GetOrgRepos(org.Login)
                    .Each(repo => map[repo.Id] = repo));

            return map.Values.ToList();
        }

        public List<GithubOrg> GetUserOrgs(string githubUsername) => 
            GetJson<List<GithubOrg>>($"users/{githubUsername}/orgs");
        public List<GithubRepo> GetUserRepos(string githubUsername) => 
            GetJson<List<GithubRepo>>($"users/{githubUsername}/repos");
        public List<GithubRepo> GetOrgRepos(string githubOrgName) => 
            GetJson<List<GithubRepo>>($"orgs/{githubOrgName}/repos");
        
        public T GetJson<T>(string route) 
        {
            try {
                return "https://api.github.com".CombineWith(route)
                    .GetJsonFromUrl(requestFilter: req => req.With(c => c.UserAgent = nameof(AutoDataQueryServices)))
                    .FromJson<T>();
            } catch(Exception) { return default(T); }
        }
    }
}