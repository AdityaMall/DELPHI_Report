report 60005 ReceiptVoucher
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Receipt Voucher Report';
    DefaultLayout = RDLC;
    RDLCLayout = 'Receipt Voucher.rdl';

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            DataItemTableView = sorting("Entry No.");
            RequestFilterFields = "Document No.";
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
            column(Posting_Date; "Posting Date")
            {

            }
            column(Description; Description)
            {

            }
            column(PaymentModeDis; PaymentModeDis)
            {

            }
            column(currCode; "Currency Code")
            {

            }
            column(SourceName; SourceName)
            {

            }
            column(Address; Address)
            {

            }
            column(city; city)
            {

            }
            column(country; country)
            {

            }
            column(Postcode; Postcode)
            {

            }
            column(TRN; TRN)
            {
            }
            column(Document_No_; "Document No.")
            {

            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemTableView = sorting("Customer No.") WHERE("Document Type" = FILTER(Invoice));
                DataItemLink = "Closed by Entry No." = field("Entry No.");
                DataItemLinkReference = "G/L Entry";
                column(custDocument_No_; "Document No.")
                {

                }
                column(Document_Date; "Document Date")
                {

                }
                column(Amount; Amount)
                {

                }
            }
            trigger OnAfterGetRecord()
            begin
                CompnyInfo.get();
                CompnyInfo.CalcFields(Picture);

                if paymentMethodCode.Get("Payment Mode") then
                    PaymentModeDis := paymentMethodCode.Description;

                if "G/L Entry"."Source Type" = "G/L Entry"."Source Type"::Customer then
                    IF Customer.GET("Source No.") THEN begin
                        SourceName := Customer.Name;
                        Address := Customer.Address;
                        Postcode := Customer."Post Code";
                        country := Customer.County;
                        TRN := Customer."VAT Registration No.";
                        //  currCode := Customer."Currency Code";
                        city := Customer.City;
                        regionCode := Customer."Country/Region Code";
                    end;
            end;

        }
    }
    var
        CompnyInfo: Record "Company Information";
        SourceName: Text;
        Address: text[200];
        Postcode: Code[50];
        country: text[100];
        city: text[100];
        regionCode: code[30];
        TRN: Text[100];
        Customer: Record Customer;
        Vendor: Record Vendor;
        paymentMethodCode: Record "Payment Method";
        //currCode: Code[50];
        PaymentModeDis: text[100];


}