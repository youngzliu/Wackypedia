using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using MySql.Data.MySqlClient;

namespace Wackypedia.Models
{
    public class Article
    {
        private string _title;
        private string _content;
        private int _id;


        public Article(string title, string content, int id = 0 )
        {
            _title = title;
            _content = content;
            _id = id;
        }

        public string GetTitle() { return _title; }
        public string GetContent() { return _content;  }
        public int GetId() { return _id; }

        public void SetContent(string content)
        {
            _content = content;
        }

        public void SetTitle(string title)
        {
            _title = title;
        }

        public List<Section> GetSections()
        {
            // In this logic, sections are divided using a
            // '==' character similar to the way wikis are.
            // We can divide the content into 'sections' by
            // parsing on the word that begin and end with the '=='
            // section markup.
            //
            // Example
            // ==Section 1==
            // Section 1 text here
            //
            // ==Section 2==
            // Section 2 text here
            //
            // becomes
            // <h3>Section 1</h3>
            // <textarea>This is the content of section 1</textarea>
            //
            // <h3>Section 2</h3>
            // <textarea>This is the content of section 2</textarea>
            //
            // <h3>Section 3</h3>
            // <textarea>This is the content of section 3</textarea


            // [\x20-\x7e] means all printable ASCII characters
            List<Section> sections = new List<Section>();
            Regex sectionHeaderExpression = new Regex(@"==([\x20-\x3c\x3e-\x7e]+)==", RegexOptions.IgnoreCase);
            Regex sectionContentExpression = new Regex(@"==[\x20-\x3c\x3e-\x7e]+==", RegexOptions.IgnoreCase);
            MatchCollection sectionMatches = sectionHeaderExpression.Matches(this._content);

            if (sectionMatches.Count > 0)
            {
                string[] sectionContentValues = sectionContentExpression.Split(this._content)
                    .Where(content => !string.IsNullOrEmpty(content))
                    .ToArray();

                if (sectionContentValues?.Any() == true)
                {
                    for (int matchIndex = 0; matchIndex < sectionMatches.Count; matchIndex++)
                    {
                        string sectionTitle = sectionMatches[matchIndex].Groups[1].Value;
                        string sectionContent = sectionContentValues[matchIndex];
                        sections.Add(new Section(sectionTitle.Trim(), sectionContent.Trim()));
                    }
                }
            }

            return sections;
        }

        //public List<Section> GetSections()
        //{
        //    List<Section> allArticleSections = new List<Section>();
        //    MySqlConnection conn = DB.Connection();
        //    conn.Open();
        //    var cmd = conn.CreateCommand() as MySqlCommand;
        //    cmd.CommandText = @"SELECT * FROM sections WHERE articleID = @articleID;";
        //    MySqlParameter articleID = new MySqlParameter();
        //    articleID.ParameterName = "@articleID";
        //    articleID.Value = this._id;
        //    cmd.Parameters.Add(articleID);
        //    var rdr = cmd.ExecuteReader() as MySqlDataReader;
        //    while (rdr.Read())
        //    {
        //        int sectionID = rdr.GetInt32(0);
        //        string title = rdr.GetString(1);
        //        string imageLink = rdr.GetString(2);
        //        string body = rdr.GetString(3); //This should be a TEXT field (MEDIUMTEXT/LONGTEXT)
        //        Section newSection = new Section(title, imageLink, body, this._id, sectionID);
        //        allArticleSections.Add(newSection);
        //    }
        //    conn.Close();
        //    if (conn != null)
        //    {
        //        conn.Dispose();
        //    }
        //    return allArticleSections;
        //}

        public static List<Article> GetAll()
        {
            List<Article> allArticles = new List<Article>();
            MySqlConnection conn = DB.Connection();
            conn.Open();
            MySqlCommand cmd = conn.CreateCommand() as MySqlCommand;
            cmd.CommandText = @"SELECT * FROM articles;";
            MySqlDataReader rdr = cmd.ExecuteReader() as MySqlDataReader;

            while (rdr.Read())
            {
                int articleID = rdr.GetInt32(0);
                string title = rdr.GetString(1);
                string content = rdr.GetString(2);
                Article newArticle = new Article(title, content, articleID);
                allArticles.Add(newArticle);
            }

            conn.Close();
            if (conn != null)
            {
                conn.Dispose();
            }

            return allArticles;
        }

        public void AddAuthor(Author newAuthor)
        {
            MySqlConnection conn = DB.Connection();
            conn.Open();
            var cmd = conn.CreateCommand() as MySqlCommand;
            cmd.CommandText = @"INSERT INTO articles_authors (article_ID, author_ID) VALUES (@articleID, @authorID);";
            MySqlParameter articleID = new MySqlParameter();
            articleID.ParameterName = "@articleID";
            articleID.Value = _id;
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
        public static void ClearAll()
        {
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
            // Section.ClearAll();
        }

        public void Delete()
        {
            MySqlConnection conn = DB.Connection();
            conn.Open();
            var cmd = conn.CreateCommand() as MySqlCommand;
            cmd.CommandText = @"DELETE FROM articles WHERE ID = @thisID; DELETE FROM sections WHERE articleID = @thisID; DELETE from articles_authors WHERE article_ID = @thisID;";
            MySqlParameter thisID = new MySqlParameter();
            thisID.ParameterName = "@thisID";
            thisID.Value = this._id;
            cmd.Parameters.Add(thisID);
            cmd.ExecuteNonQuery();
            conn.Close();
            if (conn != null)
            {
                conn.Dispose();
            }
        }

        public void Save()
        {
            MySqlConnection conn = DB.Connection();
            conn.Open();
            var cmd = conn.CreateCommand() as MySqlCommand;
            cmd.CommandText = @"INSERT INTO articles (title) VALUES (@title);";
            MySqlParameter title = new MySqlParameter();
            title.ParameterName = "@title";
            title.Value = this._title;
            cmd.Parameters.Add(title);
            cmd.ExecuteNonQuery();
            _id = (int)cmd.LastInsertedId;

            conn.Close();
            if (conn != null)
            {
                conn.Dispose();
            }
        }

        public List<Author> GetAuthor()
        {
            List<Author> allAuthors = new List<Author> { };
            MySqlConnection conn = DB.Connection();
            conn.Open();
            MySqlCommand cmd = conn.CreateCommand() as MySqlCommand;
            cmd.CommandText = @"SELECT authors.* FROM articles JOIN articles_authors ON (articles.ID = articles_authors.article_ID) JOIN authors ON (articles_authors.author_ID = authors.ID) WHERE articles.ID = (@articleID);";
            MySqlParameter articleID = new MySqlParameter();
            articleID.ParameterName = "@articleID";
            articleID.Value = _id;
            cmd.Parameters.Add(articleID);
            MySqlDataReader rdr = cmd.ExecuteReader() as MySqlDataReader;
            while (rdr.Read())
            {
                int authorID = rdr.GetInt32(0);
                string name = rdr.GetString(1);
                Author newAuthor = new Author(name, authorID);
                allAuthors.Add(newAuthor);
            }
            conn.Close();
            if (conn != null)
            {
                conn.Dispose();
            }
            return allAuthors;
        }

        public void Edit(string newTitle)
        {
            MySqlConnection conn = DB.Connection();
            conn.Open();
            var cmd = conn.CreateCommand() as MySqlCommand;
            cmd.CommandText = @"UPDATE stylists SET title = @title WHERE ID = @searchID;";
            MySqlParameter searchID = new MySqlParameter();
            searchID.ParameterName = "@searchID";
            searchID.Value = _id;
            cmd.Parameters.Add(searchID);
            MySqlParameter title = new MySqlParameter();
            title.ParameterName = "@title";
            title.Value = newTitle;
            cmd.Parameters.Add(title);
            cmd.ExecuteNonQuery();
            _title = newTitle;
            conn.Close();
            if (conn != null)
            {
                conn.Dispose();
            }
        }

        public override bool Equals(System.Object otherArticle)
        {
            if (!(otherArticle is Article))
            {
                return false;
            }
            else
            {
                Article newArticle = (Article)otherArticle;
                bool articleEquality = (this.GetTitle() == newArticle.GetTitle() && this.GetId() == newArticle.GetId());
                return (articleEquality);
            }
        }

        public static Article Find(int id)
        {
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
            string content = "";
            while (rdr.Read())
            {
                articleID = rdr.GetInt32(0);
                title = rdr.GetString(1);
                content = rdr.GetString(2);
            }
            Article foundArticle = new Article(title, content, articleID);

            conn.Close();
            if (conn != null)
            {
                conn.Dispose();
            }
            return foundArticle;
        }

        public override int GetHashCode()
        {
            return GetId().GetHashCode();
        }


    }
}
