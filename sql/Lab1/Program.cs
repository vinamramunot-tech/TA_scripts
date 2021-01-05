using System;
using System.Data.SqlClient;

namespace Lab1
{
    class Program
    {
        static void tryDatabaseConnection(string connectionString)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
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

