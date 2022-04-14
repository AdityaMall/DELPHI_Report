pageextension 60007 GenJournalLinePageExt extends "Payment Journal"
{
    layout
    {
        addafter(Description)
        {
            /*  field("Invoice Number"; rec."Invoice Number")
              {
                  ApplicationArea = all;
              }
              field("Invoice Date"; rec."Invoice Date")
              {
                  ApplicationArea = all;
              }
              field("Invoice Amount"; rec."Invoice Amount")
              {
                  ApplicationArea = all;
              }
          }
          modify(AppliesToDocNo)
          {
              trigger OnAfterValidate()
              begin
                  if Rec."Account Type" = rec."Account Type"::Customer then begin
                      salesinvoiceheader.Reset();
                      salesinvoiceheader.SetRange("No.", rec."Applies-to Doc. No.");
                      if salesinvoiceheader.FindFirst() then begin
                          salesinvoiceheader.CalcFields("Amount Including VAT");
                          rec."Invoice Amount" := salesinvoiceheader."Amount Including VAT";
                      end;
                  end;
              end;

          }*/
        }
    }
    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
        salesinvoiceheader: Record "Sales Invoice Header";
        PurchaseInvoiceHeader: Record "Purch. Inv. Header";
}