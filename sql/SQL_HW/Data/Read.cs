using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace SQL_HW.Data
{
    class Read
    {
        private string connectionString = "";
        public Read(string _connString)
        {
            connectionString = _connString;
        }
        
        public void showOrderFrequency()
        {
            string command = "SELECT p.ProductID, p.ProductDescription, p.productFinish, COUNT(OLT.ORDEREDQUANTITY) AS ORDERFREQUENCY FROM Product_T p JOIN OrderLine_T OLT on p.ProductID = OLT.ProductID GROUP BY p.PRODUCTID, p.PRODUCTDESCRIPTION, p.PRODUCTFINISH ORDER BY ORDERFREQUENCY DESC";

            try
            {
                using (SqlConnection client = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(command, client);

                    client.Open();

                    using (SqlDataReader rd = cmd.ExecuteReader())
                    {
                        while (rd.Read())
                        {
                            int i = 0;
                            while (i < rd.FieldCount)
                            {
                                Console.Write($"{rd[i]} ");
                                i++;
                            }
                            Console.WriteLine();
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
            }
            
        }

        public void showCustomerInfo()
        {
            Console.Write("Customer Id number: ");
            int customerId = Convert.ToInt32(Console.ReadLine());

            string command = $"SELECT * FROM Customer_T WHERE CustomerID = {customerId}";
            try
            {
                using (SqlConnection client = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(command, client);

                    client.Open();

                    using (SqlDataReader rd = cmd.ExecuteReader())
                    {
                        while (rd.Read())
                        {
                            int i = 0;
                            while (i < rd.FieldCount)
                            {
                                Console.Write($"{rd[i]} ");
                                i++;
                            }
                            Console.WriteLine();
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
            }
        }
    }
}
