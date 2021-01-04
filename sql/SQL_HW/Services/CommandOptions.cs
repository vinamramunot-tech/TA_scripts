using System;
namespace SQL_HW.Services
{
    public class CommandOptions
    {
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


    }
}
