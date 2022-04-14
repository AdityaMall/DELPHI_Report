tableextension 60005 GLEntryTableExt extends "G/L Entry"
{
    fields
    {
        /* field(50000; "Applies-to ID"; code[30])
         {

         }
         /* field(50001; "Invoice Date"; Date)
          {

          }

          /* field(50002; "Invoice Amount"; Decimal)
           {

           }*/
        field(50003; "Payment Mode"; code[30])
        {

        }
        field(50004; "Currency Code"; Code[30])
        {

        }
    }
    var
        myInt: Integer;

}
codeunit 60000 Gnenjnlline
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', false, false)]
    local procedure OnAfterCopyGLEntryFromGenJnlLine(var GLEntry: Record "G/L Entry"; var GenJournalLine: Record "Gen. Journal Line");
    begin
        GLEntry."Payment Mode" := GenJournalLine."Payment Method Code";
        GLEntry."Currency Code" := GenJournalLine."Currency Code";
        // GLEntry."Applies-to ID" := GenJournalLine."Document No."
        // GLEntry."Invoice Date" := GenJournalLine.
        // GLEntry."Invoice Amount" := GenJournalLine.Amount;
    end;

    var
        myInt: Integer;
}