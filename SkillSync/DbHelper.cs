using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SkillSync
{
    // =========================================================
    // DbHelper Class
    // Simple ADO.NET helper class to manage database operations.
    // Follows beginner-friendly Practical 12 coding style using SqlConnection & SqlCommand.
    // =========================================================
    public static class DbHelper
    {
        // Connection string pointing to local SQL Server instance
        // Can be updated to match local SSMS server name if needed (e.g. Data Source=.; Initial Catalog=Neav.SkillSync)
        private static string connectionString = @"Data Source=.;Initial Catalog=Neav.SkillSync;Integrated Security=True;TrustServerCertificate=True";

        // Helper method to get an open SqlConnection
        public static SqlConnection GetConnection()
        {
            // Create a new connection using the connection string
            SqlConnection con = new SqlConnection(connectionString);
            
            // Open the connection if closed
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            
            return con;
        }

        // Helper method to execute SELECT queries and return data as a DataTable
        public static DataTable ExecuteQuery(string sqlQuery)
        {
            DataTable dt = new DataTable();

            // Using block ensures connection is properly closed after reading data
            using (SqlConnection con = GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand(sqlQuery, con))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        // Fill the DataTable with query results
                        da.Fill(dt);
                    }
                }
            }

            return dt;
        }

        // Helper method to execute INSERT, UPDATE, DELETE queries
        // Returns the number of rows affected by the query
        public static int ExecuteNonQuery(string sqlQuery)
        {
            int rowsAffected = 0;

            using (SqlConnection con = GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand(sqlQuery, con))
                {
                    // Execute non-query operation
                    rowsAffected = cmd.ExecuteNonQuery();
                }
            }

            return rowsAffected;
        }

        // Helper method to execute scalar queries (e.g., SELECT COUNT(*) FROM Users)
        // Returns a single object/value from the database
        public static object ExecuteScalar(string sqlQuery)
        {
            object result = null;

            using (SqlConnection con = GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand(sqlQuery, con))
                {
                    // Execute scalar operation
                    result = cmd.ExecuteScalar();
                }
            }

            return result;
        }
    }
}
