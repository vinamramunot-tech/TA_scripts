using System;
using System.Data.SqlClient;

namespace Lab2
{
    class Program
    {
        static void executeCommands(string connectionString, string[] commands)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    for (int i = 0; i < commands.Length; i++)
                    {
                        SqlCommand cmd = new SqlCommand(commands[i], conn);

                        if (cmd.ExecuteNonQuery() == 0)
                        {
                            Console.WriteLine("It didn't worked!");
                        }
                        else
                        {
                            Console.WriteLine("It worked!");
                        }
                    }
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

            string[] sqlCommands = {
         "drop table if exists EMP_T",
         "create table EMP_T (EMPNO INT CHECK (EMPNO > 1000 AND EMPNO < 9999) NOT NULL, ENAME VARCHAR(10), JOB VARCHAR(9), MGR DECIMAL(6, 2), HIREDATE DATE, SAL DECIMAL(9, 2), COMM DECIMAL(9, 2), DEPTNO INT CHECK (DEPTNO > 0 AND DEPTNO < 9999))"};
            executeCommands(connString, sqlCommands);
        }
    }
}

