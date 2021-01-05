using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace SQL_HW.Data
{
    class Create
    {
        private string connectionString = "";
        public Create(string _connString)
        {
            connectionString = _connString;
        }

        public void insertProduct()
        {
            int productId = 0;
            int productLineId = 0;
            string productDesc = "";
            string productFinish = "";
            double productStandardPrice = 0.0;

            Console.Write("Input Product ID: ");
            productId = Convert.ToInt32(Console.ReadLine());
            Console.Write("Input Product Line ID: ");
            productLineId = Convert.ToInt32(Console.ReadLine());
            Console.Write("Input Product Description: ");
            productDesc = Console.ReadLine();
            Console.Write("Input Product Finish: ");
            productFinish = Console.ReadLine();
            Console.Write("Input Product Standard Price: ");
            productStandardPrice = Convert.ToDouble(Console.ReadLine());

            string command = $"INSERT INTO PRODUCT_T VALUES({productId}, {productLineId}, {productDesc}, {productFinish}, {productStandardPrice})";

            try
            {
                using (SqlConnection client = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(command, client);
                    client.Open();
                    if(cmd.ExecuteNonQuery() > 0)
                    {
                        Console.WriteLine("Insertion was successfull!");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
            }
        }
        
    }
}
