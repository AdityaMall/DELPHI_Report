pageextension 60002 PostedSalesCrMemoPageExt extends "Posted Sales Credit Memo"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast(processing)
        {
            action(_Report)
            {
                Caption = 'Tax Credit Note';
                ApplicationArea = all;
                Image = Report;
                PromotedCategory = Report;
                Promoted = true;
                Visible = true;

                trigger OnAction()
                begin
                    SIH.Reset();
                    SIH.SetRange("No.", rec."No.");
                    if SIH.FindFirst() then Report.Run(60002, true, false, SIH);
                end;

            }
        }
    }

    var
        myInt: Integer;
        SIH: Record "Sales Cr.Memo Header";
}