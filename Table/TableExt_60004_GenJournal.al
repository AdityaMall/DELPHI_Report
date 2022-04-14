tableextension 60004 GenJournalLineTableExt extends "Gen. Journal Line"
{
    fields
    {
        field(50000; "Invoice Number"; code[30])
        {
            
        }
        field(50001; "Invoice Date"; Date)
        {
            
        }
        field(50002; "Invoice Amount"; Decimal)
        {
           
        }
    }

    var
        myInt: Integer;
}