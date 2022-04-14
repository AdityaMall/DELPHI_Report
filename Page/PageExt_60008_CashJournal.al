pageextension 60008 CashJournalPageExt extends "Cash Receipt Journal"
{
    layout
    {
      /*  addafter(Description)
        {
            field("Invoice Number"; rec."Invoice Number")
            {
                 ApplicationArea=all;
            }
            field("Invoice Date"; rec."Invoice Date")
            {
                 ApplicationArea=all;
            }
            field("Invoice Amount"; rec."Invoice Amount")
            {
                 ApplicationArea=all;
            }
        }*/
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}