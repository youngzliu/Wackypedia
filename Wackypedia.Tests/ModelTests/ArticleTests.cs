using System.Collections.Generic;
using System.Linq;
using Wackypedia.Models;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Wackypedia.Tests
{
    [TestClass]
    public class ArticleTests
    {
        [ClassInitialize]
        public static void InitializeTests(TestContext context)
        {
            DBConfiguration.ConnectionString = "server=localhost;user id=root;password=root;port=8889;database=wackypedia_test;";
        }

        [TestMethod]
        public void GetTitle_ReturnsTheExpectedArticleTitle()
        {
            //Arrange
            Article article = new Article("Article1");

            //Act
            string newTitle = article.GetTitle();

            //Assert
            Assert.IsInstanceOfType(newTitle, typeof(string));
        }

        [TestMethod]
        public void GetId_ReturnsTheExpectedArticleId()
        {
            //Arrange
            Article article = new Article("Article2", 1);

            //Act
            int articleId = article.GetID();

            //Assert
            Assert.AreEqual(1, articleId);
        }
        
        [TestMethod]
        public void ClearAll_RemovesAllArticlesFromTheDatabase()
        {
            //Act
            Article.ClearAll();
            List<Article> allArticles = Article.GetAll();

            //Assert
            Assert.IsTrue(allArticles.Count == 0);
        }

        [TestMethod]
        public void GetAll_ReturnsAllArticlesInTheDatabase()
        {
            //Arrange
            Article anyArticle = new Article("Article3");

            //Act
            anyArticle.Save();

            //Act
            List<Article> allArticles = Article.GetAll();

            //Assert
            Assert.IsTrue(allArticles.Count >= 1);
        }

        [TestMethod]
        public void Save_CreatesANewArticleInTheDatabase()
        {
            //Arrange
            string articleTitle = "Article4";
            Article article = new Article(articleTitle);

            //Act
            article.Save();
            List<Article> result = Article.GetAll();

            //Assert
            Assert.IsTrue(result.Count > 0);
            Assert.IsTrue(result.Any(r => r.GetTitle() == articleTitle));
        }

        [TestMethod]
        public void FindById_ReturnsTheExpectedArticle()
        {
            //Arrange
            string articleTitle = "Article5";
            Article expectedArticle = new Article(articleTitle);

            //Act
            expectedArticle.Save();
            Article actualArticle = Article.Find(expectedArticle.GetID());

            // Assert
            Assert.IsNotNull(actualArticle);
        }

        [TestMethod]
        public void Delete_PermanentlyRemovesTheArticleFromTheDatabase()
        {
            //Arrange
            string articleTitle = "Article6";
            Article expectedArticle = new Article(articleTitle);

            //Act
            expectedArticle.Save();
            Article actualArticle = Article.Find(expectedArticle.GetID());

            actualArticle.Delete(expectedArticle.GetID());

            // Assert
            Article deletedArticle = Article.Find(expectedArticle.GetID());
            Assert.IsNull(deletedArticle);
        }
    }
}
