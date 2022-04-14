pageextension 60003 POPageExt extends "Purchase Order"
{
    layout
    {
        addafter(Status)
        {
            field("End Customer"; rec."End Customer")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        addlast(processing)
        {
            action(PO_Report)
            {
                Caption = 'Purchase order report';
                ApplicationArea = all;
                Image = Report;
                PromotedCategory = Report;
                Promoted = true;
                Visible = true;

                trigger OnAction()
                begin
                    pHeader.Reset();
                    PHeader.SetRange("No.", rec."No.");
                    if pHeader.FindFirst() then Report.Run(60003, true, false, PHeader);
                end;

            }
        }
    }

    var
        myInt: Integer;
        PHeader: Record "Purchase Header";
}