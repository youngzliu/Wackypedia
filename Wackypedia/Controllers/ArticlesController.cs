using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Wackypedia.Models;

namespace Wackypedia.Controllers
{
    public class ArticlesController : Controller
    {
        // article home page
        [HttpGet("/articles")] 
        public ActionResult Index()
        {
            List<Article> allArticles = Article.GetAll();
            return View(allArticles);
        }

        [HttpGet("/articles/new")]
        public ActionResult New()
        {
            return View();
        }


        [HttpPost("/articles/search")]
        public ActionResult Search(string searchString)
        {
            // Get articles matching search string.  Place model in the
            // 'Index' view.
            List<Article> matchingArticles = new List<Article>();
            matchingArticles.Add(new Article("Guess Who?!!"));
            return View("Index", matchingArticles);
        }

        [HttpGet("/articles/{id}")]
        public ActionResult ShowArticle(int id)
        {
            Article matchingArticle = new Article("Guess Who?!!");
            return View("Article", matchingArticle);
        }


    }
}