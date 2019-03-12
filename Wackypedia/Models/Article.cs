using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace Wackypedia.Models
{
    public class Article
  {
    private string MyTitle;
    private int MyID;

    public Article(string title, int ID = 0){
      MyTitle = title;
      MyID = ID;
    }

    public string GetTitle()
    { 
      return MyTitle; 
    }
    public int GetID()
    { 
      return MyID; 
    }

    public List<Section> GetSections(){
      List<Section> allArticleSections = new List<Section>();
      MySqlConnection conn = DB.Connection();
      conn.Open();
      var cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"SELECT * FROM sections WHERE articleID = @articleID;";
      MySqlParameter articleID = new MySqlParameter();
      articleID.ParameterName = "@articleID";
      articleID.Value = this.MyID;
      cmd.Parameters.Add(articleID);
      var rdr = cmd.ExecuteReader() as MySqlDataReader;
      while(rdr.Read())
      {
        int sectionID = rdr.GetInt32(0);
        string title = rdr.GetString(1);
        string imageLink = rdr.GetString(2);
        string body = rdr.GetString(3); //This should be a TEXT field (MEDIUMTEXT/LONGTEXT)
        Section newSection = new Section(title, imageLink, body, this.MyID, sectionID);
        allArticleSections.Add(newSection);
      }
      conn.Close();
      if (conn != null)
      {
        conn.Dispose();
      }
      return allArticleSections;
    }

    public static List<Article> GetAll() {
      List<Article> allArticles = new List<Article>();
      MySqlConnection conn = DB.Connection();
      conn.Open();
      MySqlCommand cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"SELECT * FROM articles;";
      MySqlDataReader rdr = cmd.ExecuteReader() as MySqlDataReader;

      while(rdr.Read()){
        int articleID = rdr.GetInt32(0);
        string title = rdr.GetString(1);
        Article newArticle = new Article(title, articleID);
        allArticles.Add(newArticle);
      }

      conn.Close();
      if (conn != null)
      {
        conn.Dispose();
      }

      return allArticles;
    }

    public void SetTitle(string title){ MyTitle = title; }

    public void AddAuthor(Author newAuthor)
    {
      MySqlConnection conn = DB.Connection();
      conn.Open();
      var cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"INSERT INTO articles_authors (article_ID, author_ID) VALUES (@articleID, @authorID);";
      MySqlParameter articleID = new MySqlParameter();
      articleID.ParameterName = "@articleID";
      articleID.Value = MyID;
      cmd.Parameters.Add(articleID);
      MySqlParameter authorID = new MySqlParameter();
      authorID.ParameterName = "@authorID";
      authorID.Value = newAuthor.GetID();
      cmd.Parameters.Add(authorID);
      cmd.ExecuteNonQuery();
      conn.Close();
      if (conn != null)
      {
        conn.Dispose();
      }
    }

    //This method will DELETE EVERYTHING. ALL models.
    public static void ClearAll(){
      MySqlConnection conn = DB.Connection();
      conn.Open();
      var cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"DELETE FROM articles; DELETE FROM articles_authors";
      cmd.ExecuteNonQuery();
      conn.Close();
      if (conn != null)
      {
        conn.Dispose();
      }
      Section.ClearAll();
    }

    public void Delete(){
      MySqlConnection conn = DB.Connection();
      conn.Open();
      var cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"DELETE FROM articles WHERE ID = @thisID; DELETE FROM sections WHERE articleID = @thisID; DELETE from articles_authors WHERE article_ID = @thisID;";
      MySqlParameter thisID = new MySqlParameter();
      thisID.ParameterName = "@thisID";
      thisID.Value = this.MyID;
      cmd.Parameters.Add(thisID);
      cmd.ExecuteNonQuery();
      conn.Close();
      if (conn != null)
      {
        conn.Dispose();
      }
    }

    public void Save(){
      MySqlConnection conn = DB.Connection();
      conn.Open();
      var cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"INSERT INTO articles (title) VALUES (@title);";
      MySqlParameter title = new MySqlParameter();
      title.ParameterName = "@title";
      title.Value = this.MyTitle;
      cmd.Parameters.Add(title);
      cmd.ExecuteNonQuery();
      MyID = (int) cmd.LastInsertedId;

      conn.Close();
      if (conn != null)
      {
        conn.Dispose();
      }
    }

    public List<Author> GetAuthor(){
      List<Author> allAuthors = new List<Author>{};
      MySqlConnection conn = DB.Connection();
      conn.Open();
      MySqlCommand cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"SELECT authors.* FROM articles JOIN articles_authors ON (articles.ID = articles_authors.article_ID) JOIN authors ON (articles_authors.author_ID = authors.ID) WHERE articles.ID = (@articleID);";
      MySqlParameter articleID = new MySqlParameter();
      articleID.ParameterName = "@articleID";
      articleID.Value = MyID;
      cmd.Parameters.Add(articleID);
      MySqlDataReader rdr = cmd.ExecuteReader() as MySqlDataReader;
      while(rdr.Read())
      {
        int authorID = rdr.GetInt32(0);
        string name = rdr.GetString(1);
        Author newAuthor = new Author(name, authorID);
        allAuthors.Add(newAuthor);
      }
      conn.Close();
      if(conn!=null)
      {
        conn.Dispose();
      }
      return allAuthors;
    }

    public void Edit(string newTitle){
      MySqlConnection conn = DB.Connection();
      conn.Open();
      var cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"UPDATE stylists SET title = @title WHERE ID = @searchID;";
      MySqlParameter searchID = new MySqlParameter();
      searchID.ParameterName = "@searchID";
      searchID.Value = MyID;
      cmd.Parameters.Add(searchID);
      MySqlParameter title = new MySqlParameter();
      title.ParameterName = "@title";
      title.Value = newTitle;
      cmd.Parameters.Add(title);
      cmd.ExecuteNonQuery();
      MyTitle = newTitle;
      conn.Close();
      if (conn != null)
      {
        conn.Dispose();
      }
    }

    public override bool Equals(System.Object otherArticle){
      if (!(otherArticle is Article))
      {
        return false;
      }
      else
      {
        Article newArticle = (Article) otherArticle;
        bool articleEquality = (this.GetTitle() == newArticle.GetTitle() && this.GetID() == newArticle.GetID());
        return (articleEquality);
      }
    }

    public static Article Find(int id){
      MySqlConnection conn = DB.Connection();
      conn.Open();
      var cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"SELECT * FROM articles WHERE ID = @thisID;";
      MySqlParameter thisID = new MySqlParameter();
      thisID.ParameterName = "@thisID";
      thisID.Value = id;
      cmd.Parameters.Add(thisID);
      var rdr = cmd.ExecuteReader() as MySqlDataReader;
      int articleID = 0;
      string title = "";
      while (rdr.Read())
      {
        articleID = rdr.GetInt32(0);
        title = rdr.GetString(1);
      }
      Article foundArticle = new Article(title, articleID);

      conn.Close();
      if (conn != null)
      {
        conn.Dispose();
      }
      return foundArticle;
    }

        public override int GetHashCode()
        {
            return GetID().GetHashCode();
        }


    }
}
