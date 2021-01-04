using System;
using System.Data.SqlClient;

namespace Lab4
{
    class Program
    {
        static void executeCommands(string connectionString, string command)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(command, conn);

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
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
            }

        }

        static string takeUserInput(string _question)
        {
            Console.WriteLine(_question);
            return Console.ReadLine();
        }
        static void Main(string[] args)
        {
            string question1 = "What is the name of the database you are trying to connect?";
            string databaseName = takeUserInput(question1);
            string connString = $"Server=DESKTOP-1PR18AL;Database={databaseName};Trusted_Connection=True;";

            string sqlCommand1 = "select ENAME, JOB, HIREDATE, SAL, DEPTNO from EMP_T";
            executeCommands(connString, sqlCommand1);

            Console.WriteLine();
            Console.WriteLine("Query the ENAME and DEPTNO of employees in a given department from EMP_T table");
            string question2 = "Please enter a department number to query employees(e.g., 30): ";
            string departmentNumber = takeUserInput(question2);

            string sqlCommand2 = $"select ENAME, DEPTNO from EMP_T where DEPTNO=${departmentNumber}";
            executeCommands(connString, sqlCommand2);

        }
    }
}