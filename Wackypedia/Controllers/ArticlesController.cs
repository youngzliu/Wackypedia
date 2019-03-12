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

		[HttpPost("/articles")]
		public ActionResult Create(string articleDescription)
		{
			Article newArticle = new Article(articleDescription);
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
			matchingArticles.Add(new Article("Guess Who?!!"));
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
			model.Add("sections", articleSections)
			model.Add("authors", articleAuthors);
			return View("Index", model);
		}
	}
}