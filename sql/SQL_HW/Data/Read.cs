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

        public void queryOrderFrequency()
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

        public void queryCustomerInfo()
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

        public void queryCustomerOrderInfo()
        {
            Console.Write("Customer Id number: ");
            int customerId = Convert.ToInt32(Console.ReadLine());

            string command = $"SELECT OrderID  FROM Order_T OT JOIN Customer_T CT on OT.CustomerID = CT.CustomerID WHERE CT.CustomerID = {customerId}";
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

        public void queryOrderItems()
        {
            Console.Write("Order Id number: ");
            int orderId = Convert.ToInt32(Console.ReadLine());

            string command = $"SELECT p.ProductDescription FROM Product_T p join OrderLine_T OLT on p.ProductID = OLT.ProductID where OrderID = {orderId}";
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

        public void queryAllProducts()
        {

            string command = "SELECT * FROM Product_T";
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
