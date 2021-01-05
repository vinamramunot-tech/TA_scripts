using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace SQL_HW.Data
{
    class Update
    {
        private string connectionString = "";
        public Update(string _connString)
        {
            connectionString = _connString;
        }

        public void updateProductPrice()
        {
            int productId = 0;
            double productStandardPrice = 0.0;

            Console.Write("Input Product ID: ");
            productId = Convert.ToInt32(Console.ReadLine());
            Console.Write("Input Product Standard Price: ");
            productStandardPrice = Convert.ToDouble(Console.ReadLine());

            string command = $"UPDATE PRODUCT_T SET PRODUCTSTANDARDPRICE = {productId} WHERE PRODUCTID = {productStandardPrice}";

            try
            {
                using (SqlConnection client = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(command, client);
                    client.Open();
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        Console.WriteLine("Update was successfull!");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
            }
        }

        public void commitChanges()
        {
            try
            {
                using (SqlConnection client = new SqlConnection(connectionString))
                {
                    client.Open();
                    SqlCommand cmd = client.CreateCommand();
                    SqlTransaction transaction = client.BeginTransaction();
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        Console.WriteLine("Commit was successfull!");
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
