using System;
using MySql.Data.MySqlClient;
using WikiGoneWrong;

namespace WikiGoneWrong.Models
{
  public class DB
  {
    public static MySqlConnection Connection()
    {
      MySqlConnection conn = new MySqlConnection(DBConfiguration.ConnectionString);
      return conn;
    }
  }
}
