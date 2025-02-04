using System.Collections.Generic;

public static class Constants
{
    public const string DisplayMessageFormat = "<span style='color:red'>{0}</span>";
    public const string ComboBoxAllText = "All";
    public const string EmptyString = "";

    public static readonly List<string> IncidentsSearchParameterNames = new List<string>
    {
        "incidentID",
        "service",
        "incidentType",
        "ownedBy",
        "ownedByTeam",
        "customerName",
        "createdBy",
        "createdDateTime",
        "closedDateTime",
        "status",
        "details",
        "description",
        "approver",
        "location"
    };

    public static readonly List<string> IncidentsSearchParameterTypes = new List<string>
    {
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar"
    };

    public static readonly List<string> TasksSearchParameterNames = new List<string>
    {
        "taskID",
        "parentPublicID",
        "service",
        "title",
        "ownedByTeam",
        "ownedBy",
        "location",
        "closeCode",
        "completionDetails",
        "closedDateTime",
    };

    public static readonly List<string> TasksSearchParameterTypes = new List<string>
    {
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar"
    };

    public static readonly List<string> ChangesSearchParameterNames = new List<string>
    {
        "changeID",
        "service",
        "category",
        "subcategory",
        "type",
        "title",
        "ownedBy",
        "ownedByTeam",
        "requestedBy",
        "status",
        "approvedBy"
    };

    public static readonly List<string> ChangesSearchParameterTypes = new List<string>
    {
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar"
    };

    public static readonly List<string> PPMProjectsSearchParameterNames = new List<string>
    {
        "PPMProjectID",
        "name",
        "area",
        "portfolioName",
        "createdDateTime",
        "ownedByTeam",
        "ownedBy",
        "oneLineProjectSummary",
        "description",
        "location",
        "budgetHealth",
        "scopeHealth",
        "scheduleHealth",
        "status"
    };

    public static readonly List<string> PPMProjectsSearchParameterTypes = new List<string>
    {
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar"
    };

    public static readonly List<string> MOCsSearchParameterNames = new List<string>
    {
        "MOCID",
        "MOCType",
        "requestorLastName",
        "requestorFirstName",
        "MOCDateCreated",
        "MOCEstStartDate",
        "MOCSummary",
        "MOCDescription",
        "coordinatorLastName",
        "coordinatorFirstName",
        "MOCPriority",
        "MOCLastUpdate",
        "MOCChangeType",
        "MOCYear",
        "MOCWorkOrder",
        "MOCChangeReason",
        "MOCPropsExplain",
        "MOCPAndIDocs",
        "MOCProjCode",
        "location",
        "MOCStatus",
        "approvedBy",
        "MOCEstInServiceDate",
        "MOCCompletionDate",
        "MOCTerminationDate"
    };

    public static readonly List<string> MOCsSearchParameterTypes = new List<string>
    {
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar"
    };

    public static readonly List<string> CherwellMOCsSearchParameterNames = new List<string>
    {
        "changeID",
        "service",
        "type",
        "pipeline",
        "proposedStartDate",
        "title",
        "requestedBy",
        "ownedByTeam",
        "ownedBy",
        "description",
        "location",
        "status",
        "approvedBy",
        "scheduledEndDate"
    };

    public static readonly List<string> CherwellMOCsSearchParameterTypes = new List<string>
    {
    
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
        "varchar",
    };
}
