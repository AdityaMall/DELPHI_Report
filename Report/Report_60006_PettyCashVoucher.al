report 60006 CashVoucher
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'CashVoucher report';
    DefaultLayout = RDLC;
    RDLCLayout = 'CashVaoucher.rdl';

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            DataItemTableView = sorting("Entry No.");
            RequestFilterFields = "Document No.";
            column(Document_No_;"Document No.")
            {

            }

            column(Posting_Date; "Posting Date")
            {

            }
            column(Amount; Amount)
            {

            }
            column(Currency_Code; "Currency Code")
            {

            }
            column(Comment; Comment)
            {

            }
            column(account; account)
            {

            }

            column(Debit_Amount; "Debit Amount")
            {

            }
            column(Credit_Amount; "Credit Amount")
            {

            }
            trigger OnAfterGetRecord()
            begin
                if glAcC.Get("Bal. Account No.") then
                    account := glAcC.Name;
            end;
        }

    }



    var
        myInt: Integer;
        account: text[100];
        glAcC: Record "G/L Account";
}