report 60002 "Credit Note report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Credit_Note Report';
    DefaultLayout = RDLC;
    RDLCLayout = 'CreditNote.rdl';

    dataset
    {
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";

            column(Curr; "Currency Code")
            {
            }
            column(No_; "No.")
            {
            }
            column(Due_Date; "Due Date")
            {
            }

            column(Document_Date; "Document Date")
            {
            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(Posting_Description; "Posting Description")
            {

            }
            column(Bill_to_Name; "Bill-to Name")
            {
            }
            column(Bill_to_Address; "Bill-to Address")
            {
            }
            column(Bill_to_City; "Bill-to City")
            {
            }
            column(Bill_to_County; "Bill-to County")
            {
            }
            column(Bill_to_Post_Code; "Bill-to Post Code")
            {
            }
            column(Bill_to_Country_Region_Code; "Bill-to Country/Region Code")
            {

            }
            column(VAT_Registration_No_; "VAT Registration No.")
            {
            }

            column(CompnyPic; CompnyInfo.Picture)
            {

            }
            column(CompnyName; CompnyInfo.Name)
            {

            }
            column(CompnyAddres; CompnyInfo.Address)
            {

            }
            column(CompnyAdd2; CompnyInfo."Address 2")
            {

            }
            column(CompnyCity; CompnyInfo.City)
            {

            }
            column(CompnyCountry; CompnyInfo.County)
            {

            }
            column(CompnyPostCode; CompnyInfo."Post Code")
            {

            }
            column(CompnyRegionCode; CompnyInfo."Country/Region Code")
            {

            }
            column(CompnyVAT; CompnyInfo."VAT Registration No.")
            {

            }

            dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
            {
                DataItemTableView = sorting("Document No.");
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = "Sales Cr.Memo Header";

                column(Description; Description)
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(Unit_Price; "Unit Price")
                {
                    AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(Amount; Amount)
                {
                    AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(VAT__; "VAT %")
                {

                }
                column(Amount_Including_VAT; "Amount Including VAT")
                {
                    AutoFormatExpression = "Sales Cr.Memo Header"."Currency Code";
                    AutoFormatType = 1;
                }



                trigger OnAfterGetRecord()
                begin

                    CompnyInfo.get();
                    CompnyInfo.CalcFields(Picture);

                end;


            }
        }

    }
    var
        BankAccount: Record "Bank Account";
        CompnyInfo: Record "Company Information";
        Round: Decimal;

}
