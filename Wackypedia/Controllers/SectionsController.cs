using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Wackypedia.Models;

namespace Wackypedia.Controllers{
  public class SectionsController : Controller{

    [HttpGet("/articles/{articleID}/sections/new")]
    public ActionResult New(int articleID)
    {
      Article article = Article.Find(articleID);
      return View(article);
    }

    [HttpPost("/articles/{artID}/sections")]
    public ActionResult Create(int artID, string title, string imageLink, string body, string author)
    {
      Section newSection = new Section(title, imageLink, body, artID);
      newSection.Save();
      Author newAuthor = new Author(author);
      newAuthor.Save();
      newAuthor.AddArticle(Article.Find(artID));
      return RedirectToAction("Show", "Articles", new {articleID = artID});
    }

  }
}
