report 60000 "Sales Order Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'SalesOrder Report';
    DefaultLayout = RDLC;
    RDLCLayout = 'SalesOrder.rdl';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            column(No_; "No.")
            {

            }
            column(Your_Reference; "Your Reference")
            {

            }
            column(Order_Date; "Order Date")
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
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemTableView = sorting("Document No.");
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = "Sales Header";
                column(Description; Description)
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_Price; "Unit Price")
                {
                    AutoFormatExpression = "Sales Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(VAT__; "VAT %")
                {

                }
                column(Amount; Amount)
                {
                    AutoFormatExpression = "Sales Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(Amount_Including_VAT; "Amount Including VAT")
                {
                    AutoFormatExpression = "Sales Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(Currency_Code; "Currency Code")
                {

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
        CompnyInfo: Record "Company Information";
}