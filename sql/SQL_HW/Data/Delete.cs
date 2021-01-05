using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace SQL_HW.Data
{
    class Delete
    {
        private string connectionString = "";
        public Delete(string _connString)
        {
            connectionString = _connString;
        }

        public void deleteProduct()
        {
            int productId = 0;

            Console.Write("Input Product ID: ");
            productId = Convert.ToInt32(Console.ReadLine());

            string command = $"DELETE FROM PRODUCT_T WHERE PRODUCTID = {productId}";

            try
            {
                using (SqlConnection client = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(command, client);
                    client.Open();
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        Console.WriteLine("Delete was successfull!");
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
