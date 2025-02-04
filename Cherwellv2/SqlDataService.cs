using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

public class SqlDataService : IDataBaseHelper, IDisposable
{
    private bool disposedValue = false;
    // IDisposable
    protected virtual void Dispose(bool disposing)
    {
        if (!this.disposedValue)
        {
            if (disposing)
            {
            }
        }
        this.disposedValue = true;
    }


    private int mCmdCTimeout = 900;

    private string sqlConString;
    public string SQLConnectionString
    {
        get
        {
            return sqlConString;
        }
        set
        {
            sqlConString = value;
        }
    }

    // this will serve as the connection
    private SqlConnection sqlConnection = new SqlConnection();





    public SqlDataService(string conString)
    {

        // this will allow us to pass in a connection string 
        sqlConString = conString;

        // assign our connection with a connection string
        sqlConnection.ConnectionString = sqlConString;
    }


    public System.Data.DataSet ExecuteDataset(string ProcedureNameToExecute)
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand(ProcedureNameToExecute, sqlConnection);

        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandTimeout = mCmdCTimeout;

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        try
        {
            da.Fill(ds);
            return ds;
        }
        catch (SqlException ex)
        {
            LogError(System.Reflection.MethodInfo.GetCurrentMethod().DeclaringType.Name, System.Reflection.MethodInfo.GetCurrentMethod().Name, ex, "ExecuteDataset - 2 - SqlException");
            return ReturnCustomErrorDataset(ex);
        }
        catch (Exception ex)
        {
            LogError(System.Reflection.MethodInfo.GetCurrentMethod().DeclaringType.Name, System.Reflection.MethodInfo.GetCurrentMethod().Name, ex, "ExecuteDataset - 2");
            return ReturnCustomErrorDataset(ex);
        }
        finally
        {
            DataSet nullDataset = null;
            DataTable dataTable = null;
            VariableCleanup(ref cmd, ref da, ref ds, ref nullDataset, ref dataTable);
        }
    }

    public DataSet ExecuteDataset(string procName, string paramName, string paramValue, string paramType)
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand(procName, sqlConnection);
        SqlParameter pI;

        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandTimeout = mCmdCTimeout;
        SqlDataAdapter da = new SqlDataAdapter(cmd);


        pI = new SqlParameter(paramName, GetParamType(paramType));
        pI.Value = paramValue;
        cmd.Parameters.Add(pI);

        try
        {
            OpenDBConnection();

            da.Fill(ds);
            return ds;
        }


        catch (SqlException ex)
        {
            LogError(System.Reflection.MethodInfo.GetCurrentMethod().DeclaringType.Name, System.Reflection.MethodInfo.GetCurrentMethod().Name, ex, "ExecuteNonQuery - 3 - SqlException");
            return null;
        }
        catch (Exception ex)
        {
            LogError(System.Reflection.MethodInfo.GetCurrentMethod().DeclaringType.Name, System.Reflection.MethodInfo.GetCurrentMethod().Name, ex, "ExecuteDataset - 1");
            return ReturnCustomErrorDataset(ex);
        }
        finally
        {
            SqlDataAdapter nullSqlDataAdapter = null;
            DataSet nullDataset = null;
            DataTable dataTable = null;
            VariableCleanup(ref cmd, ref nullSqlDataAdapter, ref nullDataset, ref nullDataset, ref dataTable);
        }
    }
    public DataSet ExecuteDataset(string procName, string paramNameI, string paramValueI, string paramTypeI, string paramNameII, string paramValueII, string paramTypeII)
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand(procName, sqlConnection);
        SqlParameter pI;
        SqlParameter pII;

        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandTimeout = mCmdCTimeout;
        SqlDataAdapter da = new SqlDataAdapter(cmd);


        pI = new SqlParameter(paramNameI, GetParamType(paramTypeI));
        pI.Value = paramValueI;
        cmd.Parameters.Add(pI);

        pII = new SqlParameter(paramNameII, paramTypeII);
        pII.Value = paramValueII;
        cmd.Parameters.Add(pII);

        try
        {
            OpenDBConnection();

            da.Fill(ds);
            return ds;
        }


        catch (SqlException ex)
        {
            LogError(System.Reflection.MethodInfo.GetCurrentMethod().DeclaringType.Name, System.Reflection.MethodInfo.GetCurrentMethod().Name, ex, "ExecuteNonQuery - 3 - SqlException");
            return null;
        }
        catch (Exception ex)
        {
            LogError(System.Reflection.MethodInfo.GetCurrentMethod().DeclaringType.Name, System.Reflection.MethodInfo.GetCurrentMethod().Name, ex, "ExecuteDataset - 1");
            return ReturnCustomErrorDataset(ex);
        }
        finally
        {
            SqlDataAdapter nullSqlDataAdapter = null;
            DataSet nullDataset = null;
            DataTable dataTable = null;
            VariableCleanup(ref cmd, ref nullSqlDataAdapter, ref nullDataset, ref nullDataset, ref dataTable);
        }
    }

    public DataSet ExecuteDataset(string procName, List<string> paramNames, List<string> paramValues, List<string> paramTypes)
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand(procName, sqlConnection);
        SqlParameter pI;
        SqlParameter pII;

        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandTimeout = mCmdCTimeout;
        SqlDataAdapter da = new SqlDataAdapter(cmd);

        for(int i = 0; i < paramNames.Count; i++)
        {
            pI = new SqlParameter(paramNames[i], GetParamType(paramTypes[i]));
            pI.Value = paramValues[i];
            cmd.Parameters.Add(pI);
        }

        try
        {
            OpenDBConnection();

            da.Fill(ds);
            return ds;
        }


        catch (SqlException ex)
        {
            LogError(System.Reflection.MethodInfo.GetCurrentMethod().DeclaringType.Name, System.Reflection.MethodInfo.GetCurrentMethod().Name, ex, "ExecuteNonQuery - 3 - SqlException");
            return null;
        }
        catch (Exception ex)
        {
            LogError(System.Reflection.MethodInfo.GetCurrentMethod().DeclaringType.Name, System.Reflection.MethodInfo.GetCurrentMethod().Name, ex, "ExecuteDataset - 1");
            return ReturnCustomErrorDataset(ex);
        }
        finally
        {
            SqlDataAdapter nullSqlDataAdapter = null;
            DataSet nullDataset = null;
            DataTable dataTable = null;
            VariableCleanup(ref cmd, ref nullSqlDataAdapter, ref nullDataset, ref nullDataset, ref dataTable);
        }
    }

    private DataSet ReturnCustomErrorDataset(Exception ex)
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataRow dr;

        dt.Columns.Add("ERROR_NO");
        dt.Columns.Add("ERROR_MESSAGE");

        dr = dt.NewRow();

        switch (ex.GetType().ToString())
        {
            case "System.OverflowException":
                {
                    dr[0] = "128";
                    dr[1] = ex.Message;
                    break;
                }

            default:
                {
                    dr[0] = "256";
                    dr[1] = ex.Message;
                    break;
                }
        }

        dt.Rows.Add(dr);
        ds.Tables.Add(dt);

        return ds;
    }

    private SqlDbType? GetParamType(string softType)
    {
        if(softType == SqlDbType.Char.ToString())
        {
            return SqlDbType.Char;
        }
        else if (softType == SqlDbType.VarChar.ToString())
        {
            return SqlDbType.VarChar;
        }
        else if (softType == SqlDbType.Int.ToString())
        {
            return SqlDbType.Int;
        }
        else if (softType == SqlDbType.TinyInt.ToString())
        {
            return SqlDbType.TinyInt;
        }
        else if (softType == SqlDbType.DateTime.ToString())
        {
            return SqlDbType.DateTime;
        }
        else
        {
            return null;
        }
    }

    public void Dispose()
    {
        if (sqlConnection != null)
        {
            if (sqlConnection.State == ConnectionState.Open)
            {
                sqlConnection.Close();
                sqlConnection.Dispose();
                sqlConnection = null;
            }
            else
                sqlConnection = null;
        }
    }

    private void LogError(string controlName, string routineName, Exception ex, string customMessage)
    {
    }

    private void VariableCleanup(ref SqlCommand cmd, ref SqlDataAdapter da, ref DataSet ds, ref DataSet dsReturn, ref DataTable dt)
    {
        if (cmd != null)
        {
            cmd.Dispose();
            cmd = null;
        }

        if (da != null)
        {
            da.Dispose();
            da = null;
        }

        if (ds != null)
        {
            ds.Dispose();
            ds = null;
        }

        if (dsReturn != null)
        {
            dsReturn.Dispose();
            dsReturn = null;
        }

        if (dt != null)
        {
            dt.Dispose();
            dt = null;
        }

        CloseDBConnection();
    }
    private void OpenDBConnection()
    {
        try
        {
            if (sqlConnection.State != ConnectionState.Open)
                sqlConnection.Open();
        }
        catch (SqlException ex)
        {
            try
            {
                if (sqlConnection.ConnectionString == string.Empty)
                {
                    if (sqlConString != string.Empty)
                        sqlConnection.ConnectionString = sqlConString;
                    else
                    {
                    }
                    sqlConnection.Open();
                }
            }
            catch (SqlException ex1)
            {
                throw ex1;
            }
            catch (Exception ex2)
            {
                throw ex2;
            }
        }
        catch (Exception ex)
        {
            try
            {
                if (sqlConnection.ConnectionString == string.Empty)
                {
                    if (sqlConString != string.Empty)
                        sqlConnection.ConnectionString = sqlConString;
                    else
                    {
                    }
                    sqlConnection.Open();
                }
            }
            catch (SqlException ex1)
            {
                throw ex1;
            }
            catch (Exception ex2)
            {
                throw ex2;
            }
        }
    }

    private void CloseDBConnection()
    {
        try
        {
            if (sqlConnection.State == ConnectionState.Open)
                sqlConnection.Close();
        }
        catch (SqlException ex)
        {
        }
        // do nothing
        catch (Exception ex)
        {
        }
    }
}
