pageextension 60004 salesinvoice extends "Sales invoice"
{
    layout
    {
        addafter("External Document No.")
        {
            field("Bank Account"; Rec."Bank Account")
            {
                ApplicationArea = all;
            }
        }

    }
    var
        myInt: Integer;
        SIH: Record "Sales invoice Header";
}
