using System;
using System.Data.SqlClient;

namespace Lab3
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
                        Console.WriteLine($"Trying to execute command {i}...");
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

            string databaseName = takeUserInput();
            string connString = $"Server=DESKTOP-1PR18AL;Database={databaseName};Trusted_Connection=True;";

            string[] sqlCommands = {
                "insert into EMP_T (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) " +
                "values (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20)",
                "insert into EMP_T (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) " +
                "values	(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30)",
                "insert into EMP_T (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) " +
                "values (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30)"
            };
            executeCommands(connString, sqlCommands);
        }
    }
}

