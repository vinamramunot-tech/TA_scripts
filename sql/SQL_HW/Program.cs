using System;
using SQL_HW.Services;

namespace SQL_HW
{
    class Program
    {
        static void Main(string[] args)
        {
            CommandOptions cmd = new CommandOptions();
            int inputOptionNumber = 0;

            do
            {
                cmd.showCommands();
                Console.Write("\n>>");
                inputOptionNumber = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine();
                cmd.switchAndSelectCommand(inputOptionNumber);           
            } while (inputOptionNumber != 10);

        } 
    }
}
 