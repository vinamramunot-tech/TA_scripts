using System;
using SQL_HW.Data;
using System.Data.SqlClient;

namespace SQL_HW.Services
{
    public class CommandOptions
    {
        public string databaseConnectionString = "";
        Create createDB;
        Read readDB;
        Update updateDB;
        Delete deleteDB;

        public CommandOptions(string _databaseConnectionString)
        {
            databaseConnectionString = _databaseConnectionString;
            createDB = new Create(databaseConnectionString);
            readDB = new Read(databaseConnectionString);
            updateDB = new Update();
            deleteDB = new Delete();
        }
        public void showCommands()
        {
            string[] menuStrings = { "1) Query the order frequency of products",
                "2) Query a customer",
                "3) Query all the orders of a customer",
                "4) Query all the order items of an order",
                "5) Query all products",
                "6) Insert a new product",
                "7) Update a product price",
                "8) Delete a product",
                "9) Save(Commit)",
                "10) Exit" };

            foreach (string i in menuStrings)
            {
                Console.WriteLine($"{i}");
            }
        }

        public void switchAndSelectCommand(int _input)
        {
            switch (_input)
            {
                case 1:
                    readDB.queryOrderFrequency();
                    break;
                case 2:
                    readDB.queryCustomerInfo();
                    break;
                case 3:
                    readDB.queryCustomerOrderInfo();
                    break;
                case 4:
                    readDB.queryOrderItems();
                    break;
                case 5:
                    readDB.queryAllProducts();
                    break;
                case 6:
                    createDB.insertProduct();
                    break;
                case 7:
                    updateDB.updateProductPrice();
                    break;
                case 8:
                    deleteDB.deleteProduct();
                    break;
                case 9:
                    
                    break;
                case 10:
                    Console.WriteLine("This is 10!");
                    break;
                default:
                    Console.WriteLine("Error: Please select a number between [1, 10]");
                    Console.WriteLine();
                    break;
            }

        }

    }
}
