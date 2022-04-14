tableextension 60003 PurchaseInvHedExt extends "Purch. Inv. Header"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "End Customer"; text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }

    }
    var
        myInt: Integer;
}
