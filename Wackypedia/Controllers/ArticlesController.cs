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
	}
}
