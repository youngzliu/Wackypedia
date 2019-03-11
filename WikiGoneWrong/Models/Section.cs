using System;
using System.Collection.Generic;
using MySql.Data.MySqlClient;

namespace WikiGoneWrong.Models
{
  public class Section
  {
    private string MyTitle;
    private string MyImageLink;
    private string MyBody;
    private int MyID;

    public Section(string title, string imageLink, string body, int ID = 0){
      MyTitle = title;
      MyImageLink = imageLink;
      MyBody = body;
      MyID = ID;
    }

    public string GetTitle(){ return MyTitle; }
    public string GetImageLink(){ return MyImageLink; }
    public string GetBody(){ return MyBody; }
    public int GetID(){ return MyID; }

    public static List<Section> GetAll(){
      List<Section> allSections = new List<Sections>();
      MySqlConnection conn = DB.Connection();
      conn.Open();
      MySqlCommand cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"SELECT * FROM sections;";
      MySqlDataReader rdr = cmd.ExecuteReader() as MySqlDataReader;

      while(rdr.Read()){
        int sectionID = rdr.GetInt32(0);
        string title = rdr.GetString(1);
        string imageLink = rdr.GetString(2);
        string body = rdr.GetString(3); //This should be a TEXT field (MEDIUMTEXT/LONGTEXT)
        Client newClient = new Client(firstName, lastName, phoneNumber, email, stylistID, clientID);
        allClients.Add(newClient);
      }

      conn.Close();
      if (conn != null)
      {
        conn.Dispose();
      }

      return allClients;
    }

    public void SetFirstName(string firstName){ MyFirstName = firstName; }
    public void SetLastName(string lastName){ MyLastName = lastName; }
    public void SetPhoneNumber(string phoneNumber){ MyPhoneNumber = phoneNumber; }
    public void SetEmail(string email){ MyEmail = email; }
    public void SetStylistID(int stylistID){ MyStylistID = stylistID; }
    public static void ClearAll(){
      MySqlConnection conn = DB.Connection();
      conn.Open();
      var cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"DELETE FROM clients;";
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
      cmd.CommandText = @"INSERT INTO clients (firstName, lastName, phoneNumber, email, stylistID) VALUES (@firstName, @lastName, @phoneNumber, @email, @stylistID);";
      MySqlParameter firstName = new MySqlParameter();
      firstName.ParameterName = "@firstName";
      firstName.Value = this.MyFirstName;
      cmd.Parameters.Add(firstName);
      MySqlParameter lastName = new MySqlParameter();
      lastName.ParameterName = "@lastName";
      lastName.Value = this.MyLastName;
      cmd.Parameters.Add(lastName);
      MySqlParameter phoneNumber = new MySqlParameter();
      phoneNumber.ParameterName = "@phoneNumber";
      phoneNumber.Value = this.MyPhoneNumber;
      cmd.Parameters.Add(phoneNumber);
      MySqlParameter email = new MySqlParameter();
      email.ParameterName = "@email";
      email.Value = this.MyEmail;
      cmd.Parameters.Add(email);
      MySqlParameter stylistID = new MySqlParameter();
      stylistID.ParameterName = "@stylistID";
      stylistID.Value = this.MyStylistID;
      cmd.Parameters.Add(stylistID);
      cmd.ExecuteNonQuery();
      MyID = (int) cmd.LastInsertedId;

      conn.Close();
      if (conn != null)
      {
        conn.Dispose();
      }
    }

    public void Edit(string newFirstName, string newLastName, string newPhoneNumber, string newEmail){
      MySqlConnection conn = DB.Connection();
      conn.Open();
      var cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"UPDATE clients SET firstName = @firstName, lastName = @lastName, phoneNumber = @phoneNumber, email = @email WHERE ID = @searchId;";
      MySqlParameter searchId = new MySqlParameter();
      searchId.ParameterName = "@searchId";
      searchId.Value = MyID;
      cmd.Parameters.Add(searchId);
      MySqlParameter firstName = new MySqlParameter();
      firstName.ParameterName = "@firstName";
      firstName.Value = newFirstName;
      cmd.Parameters.Add(firstName);
      MySqlParameter lastName = new MySqlParameter();
      lastName.ParameterName = "@lastName";
      lastName.Value = newLastName;
      cmd.Parameters.Add(lastName);
      MySqlParameter phoneNumber = new MySqlParameter();
      phoneNumber.ParameterName = "@phoneNumber";
      phoneNumber.Value = newPhoneNumber;
      cmd.Parameters.Add(phoneNumber);
      MySqlParameter email = new MySqlParameter();
      email.ParameterName = "@email";
      email.Value = newEmail;
      cmd.Parameters.Add(email);
      cmd.ExecuteNonQuery();
      MyFirstName = newFirstName;
      MyLastName = newLastName;
      MyPhoneNumber = newPhoneNumber;
      MyEmail = newEmail;
      conn.Close();
      if (conn != null)
      {
        conn.Dispose();
      }
    }

    public override bool Equals(System.Object otherItem){
      if (!(otherItem is Client))
      {
        return false;
      }
      else
      {
        Client newClient = (Client) otherItem;
        bool clientEquality = (this.GetFirstName() == newClient.GetFirstName() && this.GetLastName() == newClient.GetLastName() && this.GetPhoneNumber() == newClient.GetPhoneNumber() && this.GetEmail() == newClient.GetEmail() && this.GetID() == newClient.GetID()  && this.GetStylistID() == newClient.GetStylistID());
        return (clientEquality);
      }
    }

    public static Client Find(int id){
      MySqlConnection conn = DB.Connection();
      conn.Open();
      var cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"SELECT * FROM clients WHERE ID = @thisID;";
      MySqlParameter thisID = new MySqlParameter();
      thisID.ParameterName = "@thisID";
      thisID.Value = id;
      cmd.Parameters.Add(thisID);
      var rdr = cmd.ExecuteReader() as MySqlDataReader;
      int clientID = 0;
      string firstName = "";
      string lastName = "";
      string phoneNumber = "";
      string email = "";
      int stylistID = 0;
      while (rdr.Read())
      {
        clientID = rdr.GetInt32(0);
        firstName = rdr.GetString(1);
        lastName = rdr.GetString(2);
        phoneNumber = rdr.GetString(3);
        email = rdr.GetString(4);
        stylistID = rdr.GetInt32(5);
      }
      Client foundClient = new Client(firstName, lastName, phoneNumber, email, stylistID, clientID);

      conn.Close();
      if (conn != null)
      {
        conn.Dispose();
      }
      return foundClient;
    }

  }
}
