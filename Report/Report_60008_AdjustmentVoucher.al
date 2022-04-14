report 60008 "Adjustment Voucher Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Adjustment_Voucher report';
    DefaultLayout = RDLC;
    RDLCLayout = 'AdjustmentVaoucher.rdl';

    dataset
    {
        dataitem("Gen. Journal Line"; "Gen. Journal Line")
        {
            DataItemTableView = sorting("Line No.");
            RequestFilterFields = "Line No.";

            column(Document_No_; "Document No.")
            {

            }
            column(Document_Date; "Document Date")
            {

            }
            column(Amount; Amount)
            {

            }
            column(Payment_Reference; "Payment Reference")
            {

            }

            column(Contact_Graph_Id; "Contact Graph Id")
            {

            }
            column(Debit_Amount; "Debit Amount")
            {

            }
            column(Credit_Amount; "Credit Amount")
            {

            }
            column(Currency_Code; "Currency Code")
            {

            }

        }
    }



    var
        myInt: Integer;
}