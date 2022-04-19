report 60004 PaymentVoucher
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Payment Voucher Report';
    DefaultLayout = RDLC;
    RDLCLayout = 'Payment Voucher.rdl';

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
            column(Document_No_; "Document No.")
            {

            }
            column(Description; Description)
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(PaymentModeDis; PaymentModeDis)
            {

            }
            column(PaidThrogh; PaidThrogh)
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

            dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {
               
                DataItemTableView = sorting("Vendor No.") WHERE("Document Type" = FILTER(Invoice));
                DataItemLink = "Closed by Entry No." = field("Entry No.");
                DataItemLinkReference = "G/L Entry";
                column(Invoice_Number; "Document No.")
                {

                }
                column(invoice_date; "Document Date")
                {

                }
                column(Amount; Amount)
                {

                }
                column(Document_Type; "Document Type")
                {

                }



            }

            trigger OnAfterGetRecord()
            begin
                CompnyInfo.get();
                CompnyInfo.CalcFields(Picture);

                if paymentMethodCode.Get("Payment Mode") then
                    PaymentModeDis := paymentMethodCode.Description;


                if "G/L Entry"."Document No." = "G/L Entry"."Document No." then
                    if "G/L Entry"."Bal. Account Type" = "G/L Entry"."Bal. Account Type"::"Bank Account" then begin
                        bank.get("Bal. Account No.");
                        PaidThrogh := bank.Name;

                    end;

                if "G/L Entry"."Source Type" = "G/L Entry"."Source Type"::Vendor then begin
                    if Vendor.GET("Source No.") then begin
                        SourceName := Vendor.Name;
                        Address := Vendor.Address;
                        Postcode := Vendor."Post Code";
                        country := Vendor.County;
                        TRN := Vendor."VAT Registration No.";
                        //  currCode := Vendor."Currency Code";
                        city := Vendor.City;
                        regionCode := Vendor."Country/Region Code";

                    end;
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

        PaymentModeDis: text[100];
        PaidThrogh: text[100];
        paymentMethodCode: Record "Payment Method";
        PaymentAmount: Decimal;
        paymentGen: Record "Gen. Journal Line";
        bank: Record "Bank Account";




}