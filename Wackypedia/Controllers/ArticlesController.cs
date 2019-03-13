using System.Collections.Generic;
using System.Text.RegularExpressions;
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

        // article home page
        [HttpGet("/articles/show")]
        public ActionResult ShowArticle()
        {
            string content =
                "==Section 1==\r\n" +
                "This is the content of section 1\r\n\r\n" +
                 "==Section 2==\r\n" +
                 "This is the content of section 2\r\n\r\n" +
                 "== Section 3 ==\r\n" +
                 "This is the content of section 3\r\n\r\n" +
                 "==      Section 4            ==\r\n" +
                 "This is the content of section 4\r\n\r\n" +
                 "== Section 5  == This is the content of section 5";

            Article article = new Article(
                "This is an article title",
                content,
                id: 1);

            var sections = article.GetSections();
            Dictionary<string, object> model = new Dictionary<string, object>();
            model.Add("article", article);

            return View("Article-Show", model);
        }

        // article home page
        [HttpPost("/articles/{id}/save")]
        public ActionResult TestSave(int id, string editedContent)
        {
            // Save Article, read new article and show
            // Article article = Article.Find(id);
            // article.SetContent(editedContent);
            // article.Save();
						Dictionary<string, object> model = new Dictionary<string, object>();
						Article article = new Article(
                "This is an article title",
                editedContent, 1);
            model.Add("article", article);
            return View("Article-show", model);
        }

    [HttpGet("/articles/new")]
		public ActionResult New()
		{
			return View("Article-New");
		}

		[HttpPost("/articles")]
		public ActionResult Create(string articleDescription)
		{
			Article newArticle = new Article("AnyOldTitle", articleDescription);
			newArticle.Save();
			List<Article> allArticles = Article.GetAll();
			return View("Index", allArticles);
		}


		[HttpPost("/articles/search")]
		public ActionResult Search(string searchString)
		{
			// Get articles matching search string.  Place model in the
			// 'Index' view.
			List<Article> matchingArticles = new List<Article>();
			matchingArticles.Add(new Article("AnyOldTitle", "Guess Who?!!"));
			return View("Index", matchingArticles);
		}

		[HttpGet("/articles/{id}")]
		public ActionResult Show(int id)
		{
			Dictionary<string, object> model = new Dictionary<string, object>();
			Article selectedArticle = Article.Find(id);
			List<Section> articleSections = selectedArticle.GetSections();
			List<Author> articleAuthors = selectedArticle.GetAuthor();
			model.Add("stylist", selectedArticle);
            model.Add("sections", articleSections);
			model.Add("authors", articleAuthors);
			return View("Index", model);
		}
	}
}
