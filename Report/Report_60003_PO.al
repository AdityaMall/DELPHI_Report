report 60003 "Purchase Order Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'PO Report';
    DefaultLayout = RDLC;
    RDLCLayout = 'PO.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            column(No_; "No.")
            {
            }
            column(Document_Date; "Document Date")
            {

            }
            column(End_Customer; "End Customer")
            {

            }
            column(cust; cust.Name)
            {

            }

            column(Buy_from_Vendor_No_; "Buy-from Vendor No.")
            {
            }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            {
            }
            column(Buy_from_Address; "Buy-from Address")
            {

            }
            column(Buy_from_City; "Buy-from City")
            {

            }
            column(Buy_from_County; "Buy-from County")
            {

            }
            column(Buy_from_Post_Code; "Buy-from Post Code")
            {

            }
            column(Buy_from_Country_Region_Code; "Buy-from Country/Region Code")
            {

            }
            column(VAT_Registration_No_; "VAT Registration No.")
            {

            }

            column(Payment_Reference; "Payment Reference")
            {

            }
            column(Payment_Terms_Code; "Payment Terms Code")
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
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemTableView = sorting("Document No.");
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = "Purchase Header";
                column(Description; Description)
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_Cost; "Unit Cost")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(VAT__; "VAT %")
                {

                }
                column(Amount; Amount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(Amount_Including_VAT; "Amount Including VAT")
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(Currency_Code; "Currency Code")
                {

                }
                trigger OnAfterGetRecord()
                begin
                    CompnyInfo.get();
                    CompnyInfo.CalcFields(Picture);
                    cust.get("Purchase Header"."End Customer");
                end;
            }
        }

    }


    var
        myInt: Integer;
        CompnyInfo: Record "Company Information";

        cust: Record Customer;
}