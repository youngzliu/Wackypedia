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
      Article article = Article.Find(artID);
      newSection.Save();
      Author existingAuthor = Author.Find(author);
			if(existingAuthor != null){
				existingAuthor.AddArticle(article);
			}
			else{
				Author newAuthor = new Author(author);
				newAuthor.Save();
				newAuthor.AddArticle(article);
			}
      return RedirectToAction("Show", "Articles", new {articleID = artID});
    }

    [HttpGet("/articles/{articleID}/sections/{sectionID}/edit")]
    public ActionResult Edit(int articleID, int sectionID)
    {
      Dictionary<string, object> model = new Dictionary<string, object>();
      Article article = Article.Find(articleID);
      model.Add("article", article);
      Section section = Section.Find(sectionID);
      model.Add("section", section);
      return View(model);
    }

    [HttpPost("/articles/{artID}/sections/{sectionID}")]
    public ActionResult Update(int artID, int sectionID, string title, string imageLink, string body, string author)
    {
      Section section = Section.Find(sectionID);
      Article article = Article.Find(artID);
      section.Edit(title, imageLink, body);
      Author existingAuthor = Author.Find(author);
      if(existingAuthor != null){
        existingAuthor.AddArticle(article);
      }
      else{
        Author newAuthor = new Author(author);
        newAuthor.Save();
        newAuthor.AddArticle(article);
      }
      // Author au = new Author(author);
      // au.Save();
      // au.AddArticle(Article.Find(artID));
      return RedirectToAction("Show", "Articles", new {articleID = artID});
    }

  }
}
