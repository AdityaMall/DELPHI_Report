pageextension 60006 GLEntriesPageExt extends "General Ledger Entries"
{
    layout
    {
        addafter(Description)
        {

            /*
             field("Invoice Date"; rec."Invoice Date")
             {
                 ApplicationArea = all;
             }
             field("Invoice Amount"; rec."Invoice Amount")
             {
                 ApplicationArea = all;
             }*/
            field("Payment Mode"; rec."Payment Mode")
            {
                ApplicationArea = all;
            }
            field("Currency Code"; rec."Currency Code")
            {
                ApplicationArea = all;
            }
        }

    }

    actions
    {
        addafter("F&unctions")
        {
            action(Report1)
            {

                Caption = 'Vouchers Report';
                ApplicationArea = all;
                Image = Report;
                PromotedCategory = Report;
                Promoted = true;
                Visible = true;
                trigger OnAction()
                begin
                    GLEntry.Reset();
                    GLEntry.SetRange("Document No.", rec."Document No.");
                    GLEntry.SetRange("G/L Account No.", rec."G/L Account No.");
                    GLEntry.SetRange("Source Code", rec."Source Code");
                    //GLEntry.SetFilter("Document Type", 'Payment');

                    if GLEntry.FindFirst() then
                        if GLEntry."Source Type" = GLEntry."Source Type"::Vendor then
                            Report.Run(60004, true, false, GLEntry)
                        else
                            if GLEntry."Source Type" = GLEntry."Source Type"::Customer then
                                Report.Run(60005, true, false, GLEntry)
                            else
                                if GLEntry."Source Type" = GLEntry."Source Type"::" " then
                                    Report.Run(60007, true, false, GLEntry)
                end;
            }
        }
    }



    var
        myInt: Integer;
        GLEntry: Record "G/L Entry";
}