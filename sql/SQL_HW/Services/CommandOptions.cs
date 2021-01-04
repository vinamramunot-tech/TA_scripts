using System;
using SQL_HW.Data;

namespace SQL_HW.Services
{
    public class CommandOptions
    {

        Create createDB = new Create();
        Read readDB = new Read();
        Update updateDB = new Update();
        Delete deleteDB = new Delete();

        public CommandOptions()
        {

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
                    Console.WriteLine("This is 1!");
                    break;
                case 2:
                    Console.WriteLine("This is 2!");
                    break;
                case 3:
                    Console.WriteLine("This is 3!");
                    break;
                case 4:
                    Console.WriteLine("This is 4!");
                    break;
                case 5:
                    Console.WriteLine("This is 5!");
                    break;
                case 6:
                    Console.WriteLine("This is 6!");
                    break;
                case 7:
                    Console.WriteLine("This is 7!");
                    break;
                case 8:
                    Console.WriteLine("This is 8!");
                    break;
                case 9:
                    Console.WriteLine("This is 9!");
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
