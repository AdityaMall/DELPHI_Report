tableextension 60001 salesheader extends "Sales header"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Bank Account"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";
        }

    }
    var
        myInt: Integer;
}
