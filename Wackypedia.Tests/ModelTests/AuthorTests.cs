using Microsoft.VisualStudio.TestTools.UnitTesting;
using Wackypedia.Models;
using System;
using System.Collections.Generic;

namespace Wackypedia.Tests
{

  [TestClass]
  public class AuthorTests : IDisposable
  {
    public void Dispose(){
      Author.ClearAll();
      Article.ClearAll();
    }

    public AuthorTests(){
      DBConfiguration.ConnectionString = "server=localhost;user id=root;password=root;port=8889;database=wackpedia_test;";
    }

    [TestMethod]
    public void AuthorConstructor_CreatesInstanceOfAuthor_Author(){
      Author newAuthor = new Author("Bob");
      Assert.AreEqual(typeof(Author), newAuthor.GetType());
    }

    [TestMethod]
    public void GetName_ReturnsName_String(){
      string name = "Bob";
      Author newAuthor = new Author("Bob");
      string result = newAuthor.GetName();
      Assert.AreEqual(name, result);
    }

    [TestMethod]
    public void GetID_ReturnsID_Int(){
      int id = 5;
      Author newAuthor = new Author("Bob", id);
      int result = newAuthor.GetID();
      Assert.AreEqual(id, result);
    }

    [TestMethod]
    public void SetName_SetsName_String(){
      Author author = new Author("Bob");

      string newName = "Anne";
      author.SetName(newName);
      string result = specialty.GetName();

      Assert.AreEqual(newName, result);
    }

    [TestMethod]
    public void AddArticle_AddsArticleToAuthor_ArticleList()
    {
      Author testAuthor = new Author("Bob");
      testAuthor.Save();
      Article testArticle = new Article("Bob", "bob");
      testArticle.Save();

      testAuthor.AddArticle(testArticle);
      List<Article> result = testSpecialty.GetArticles();
      List<Article> testList = new List<Article>{testArticle};

      CollectionAssert.AreEqual(testList, result);
    }

    [TestMethod]
    public void GetAll_ReturnsAuthors_AuthorsList()
    {
      Author newAuthor = new Author("Anne");
      Author newAuthor2 = new Author("Bob");
      newAuthor.Save();
      newAuthor.Save();
      List<Author> newList = new List<Author> { newAuthor, newAuthor2 };

      List<Author> result = Author.GetAll();

      CollectionAssert.AreEqual(newList, result);
    }

    [TestMethod]
    public void Find_ReturnsCorrectAuthorFromDatabase_Author()
    {
      Author newAuthor = new Author("Anne");
      newAuthor.Save();

      Author result = Author.Find(newAuthor.GetID());

      Assert.AreEqual(newAuthor, result);
    }

    [TestMethod]
    public void Equals_ReturnsTrueIfAuthorsAreSame_Author()
    {
      Author newAuthor = new Author("Anne");
      Author newAuthor2 = new Author("Kara");

      Assert.AreEqual(newAuthor, newAuthor2);
    }
  }
}
