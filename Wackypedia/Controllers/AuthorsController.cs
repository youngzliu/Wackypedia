using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Wackypedia.Models;

namespace Wackypedia.Controllers
{
  public class AuthorsController : Controller
  {
    [HttpGet("/authors/{authorID}")]
    public ActionResult Show(int authorID)
    {
      Dictionary<string, object> model = new Dictionary<string, object>();
      Author selectedAuthor = Author.Find(authorID);
      List<Article> authorArticles = selectedAuthor.GetArticles();
      model.Add("author", selectedAuthor);
      model.Add("articles", authorArticles);
      return View(model);
    }
  }
}
