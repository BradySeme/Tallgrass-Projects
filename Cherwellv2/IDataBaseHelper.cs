using System.Collections.Generic;
using System.Data;

public interface IDataBaseHelper
{
    DataSet ExecuteDataset(string ProcedureNameToExecute);

    DataSet ExecuteDataset(string procName, string paramName, string paramValue, string paramType);

    DataSet ExecuteDataset(string procName, string paramNameI, string paramValueI, string paramTypeI, string paramNameII, string paramValueII, string paramTypeII);
    DataSet ExecuteDataset(string procName, List<string> paramNames, List<string> paramValues, List<string> paramType);

}