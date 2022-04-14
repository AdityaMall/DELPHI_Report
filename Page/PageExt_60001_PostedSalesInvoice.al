pageextension 60001 PostedSalesInvoiceExt extends "Posted Sales Invoice"
{
    layout
    {
        addafter("External Document No.")
        {
            field("Bank Account"; rec."Bank Account")
            {
                ApplicationArea = all;
                Editable = true;
            }
          
        }
    }

    actions
    {
        addlast(processing)
        {
            action(SalesOrder_Report)
            {
                Caption = 'TAX Invoice Report';
                ApplicationArea = all;
                Image = Report;
                PromotedCategory = Report;
                Promoted = true;
                Visible = true;

                trigger OnAction()
                begin
                    SIH.Reset();
                    SIH.SetRange("No.", rec."No.");
                    if SIH.FindFirst() then Report.Run(60001, true, false, SIH);
                end;

            }
        }
    }

    var
        myInt: Integer;
        SIH: Record "Sales invoice Header";
}