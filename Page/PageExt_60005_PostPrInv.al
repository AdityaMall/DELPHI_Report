pageextension 60005 PostedPrInvExt extends "Posted Purchase Invoice"
{
    layout
    {
        addafter("Quote No.")
        {
            field("End Customer"; rec."End Customer")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}