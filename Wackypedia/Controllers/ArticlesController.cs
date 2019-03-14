using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Wackypedia.Models;

namespace Wackypedia.Controllers
{
	public class ArticlesController : Controller
	{
		[HttpGet("/articles")]
		public ActionResult Index(){
			List<Article> allArticles = Article.GetAll();
			return View(allArticles);
		}

		[HttpGet("/articles/new")]
	  public ActionResult New() { return View(); }

		[HttpPost("/articles")]
    public ActionResult Create(string title, string author){
      Article article = new Article(title);
      article.Save();
			Author newAuthor = new Author(author);
			newAuthor.Save();
			newAuthor.AddArticle(article);
      return RedirectToAction("Show", new {articleID = article.GetID()});
    }

		[HttpGet("/articles/{articleID}")]
    public ActionResult Show(int articleID)
    {
      Dictionary<string, object> model = new Dictionary<string, object>();
      Article selectedArticle = Article.Find(articleID);
      List<Section> articleSections = selectedArticle.GetSections();
      List<Author> articleAuthors = selectedArticle.GetAuthors();
      model.Add("article", selectedArticle);
      model.Add("sections", articleSections);
      model.Add("authors", articleAuthors);
      return View(model);
    }
	}
}
