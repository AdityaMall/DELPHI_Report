tableextension 60000 SalesInvoiceHeaderTableExt extends "Sales Invoice Header"
{
    fields
    {
        field(50000; "Bank Account"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";
        }
      
    }

    var
        myInt: Integer;
}