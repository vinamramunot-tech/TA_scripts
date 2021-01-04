using System;
using System.Data.SqlClient;

namespace Lab1
{
    class Program
    {

        static bool checkIfDatabaseExists(SqlConnection _connection)
        {
            string query = "SELECT * FROM sys.databases";

            SqlCommand cmd = new SqlCommand(query, _connection);

            //indicate that the database is connected
            Console.WriteLine("The server is connected! Lets move on!");

            //execute the SQLCommand
            SqlDataReader dr = cmd.ExecuteReader();

            //check if there are records
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    //display retrieved record (first column only/string value)
                    if (dr.GetString(0) == "Test")
                    {
                        Console.WriteLine("Test Database successfully created and visible!");
                        dr.Close();
                        return true;
                    }
                }
            }
            else
            {
                Console.WriteLine("No databases found.");
                dr.Close();
            }
            return false;
        }

        static void tryDatabaseConnection(string connectionString)
        {

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    if (checkIfDatabaseExists(conn))
                    {
                        Console.WriteLine("Awesome you have completed the task!");
                    }
                    else
                    {
                        Console.WriteLine("Unfortunately you have not complete the task!");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
            }

        }

        static string takeUserInput()
        {
            Console.WriteLine("What is the name of the database you are trying to connect?");
            return Console.ReadLine();
        }
        static void Main(string[] args)
        {

            string inputResult = takeUserInput();
            string connString = $"Server=DESKTOP-1PR18AL;Database={inputResult};Trusted_Connection=True;";

            tryDatabaseConnection(connString);

        }
    }
}

