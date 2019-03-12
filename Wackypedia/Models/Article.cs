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

    public string GetTitle(){ return MyTitle; }
    public int GetID(){ return MyID; }

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

    public static void ClearAll(){
      MySqlConnection conn = DB.Connection();
      conn.Open();
      var cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"DELETE FROM articles;";
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

    //public override bool Equals(System.Object otherArticle){
    //  if (!(otherArticle is Stylist))
    //  {
    //    return false;
    //  }
    //  else
    //  {
    //    Article newArticle = (Article) otherArticle;
    //            bool articleEquality = (this.GetTitle() == newArticle.GetTitle() && this.GetID() == newArticle.GetID());
    //    return (articleEquality);
    //  }
    //}

    //public static Stylist Find(int ID){
    //  MySqlConnection conn = DB.Connection();
    //  conn.Open();
    //  var cmd = conn.CreateCommand() as MySqlCommand;
    //  cmd.CommandText = @"SELECT * FROM articles WHERE ID = @thisID;";
    //  MySqlParameter thisID = new MySqlParameter();
    //  thisID.ParameterName = "@thisID";
    //  thisID.Value = ID;
    //  cmd.Parameters.Add(thisID);
    //  var rdr = cmd.ExecuteReader() as MySqlDataReader;
    //  int articleID = 0;
    //  string title = "";
    //  while (rdr.Read())
    //  {
    //    articleID = rdr.GetInt32(0);
    //    title = rdr.GetString(1);
    //  }
    //  Article foundArticle = new Article(title, articleID);

    //  conn.Close();
    //  if (conn != null)
    //  {
    //    conn.Dispose();
    //  }
    //  return foundArticle;
    //}
  }
}
