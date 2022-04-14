pageextension 60000 SalesOrderPageExt extends "Sales Order"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast(processing)
        {
            action(SalesOrder_Report)
            {
                Caption = 'Sales order report';
                ApplicationArea = all;
                Image = Report;
                PromotedCategory = Report;
                Promoted = true;
                Visible = true;

                trigger OnAction()
                begin
                    SalesHeader.Reset();
                    SalesHeader.SetRange("No.", rec."No.");
                    if SalesHeader.FindFirst() then Report.Run(60000, true, false, SalesHeader);
                end;

            }
        }
    }

    var
        myInt: Integer;
        SalesHeader: Record "Sales Header";
}