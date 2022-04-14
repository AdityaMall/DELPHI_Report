tableextension 60002 PurchaseHedExt extends "Purchase Header"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "End Customer"; text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation=Customer."No.";
        }

    }
    var
        myInt: Integer;
}
