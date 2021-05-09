unit uTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfTarefa2 = class(TForm)
    btnExecutar: TButton;
    ProgressBar1: TProgressBar;
    edtEsperaThread1: TLabeledEdit;
    lblAndamentoThread1: TLabel;
    edtEsperaThread2: TLabeledEdit;
    ProgressBar2: TProgressBar;
    lblAndamentoThread2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure edtEsperaThread1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;

implementation

uses
   uThreadProgresso;

{$R *.dfm}

{ TfrmTarefa2 }

procedure TfTarefa2.btnExecutarClick(Sender: TObject);
var
   AThreadProgresso1, AThreadProgresso2: TThreadProgresso;
begin
   TButton(Sender).Enabled := False;
   try
      if (edtEsperaThread1.Text = '') or (edtEsperaThread1.Text = '0') then
         begin
            ShowMessage('Informe o tempo de espera, para a Thread1');
            FocusControl(edtEsperaThread1);
            Exit;
         end;
      if (edtEsperaThread2.Text = '') or (edtEsperaThread2.Text = '0') then
         begin
            ShowMessage('Informe o tempo de espera, para a Thread2');
            FocusControl(edtEsperaThread2);
            Exit;
         end;

      AThreadProgresso1 := TThreadProgresso.Create(True);
      AThreadProgresso1.BarraDeProgresso := ProgressBar1;
      AThreadProgresso1.Andamento := lblAndamentoThread1;
      AThreadProgresso1.TempoDeEspera := StrToInt(edtEsperaThread1.Text);
      AThreadProgresso1.Start;

      AThreadProgresso2 := TThreadProgresso.Create(True);
      AThreadProgresso2.BarraDeProgresso := ProgressBar2;
      AThreadProgresso2.Andamento := lblAndamentoThread2;
      AThreadProgresso2.TempoDeEspera := StrToInt(edtEsperaThread2.Text);
      AThreadProgresso2.Start;
   finally
      TButton(Sender).Enabled := True;
   end;
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   // Destrói o formulário ao fechar
   Action := TCloseAction.caFree;
end;

procedure TfTarefa2.FormShow(Sender: TObject);
begin
   // Exibe o formulário em tela cheia
   WindowState := TWindowState.wsMaximized;
end;

procedure TfTarefa2.edtEsperaThread1KeyPress(Sender: TObject; var Key: Char);
begin
   if not CharInSet(Key, ['0'..'9', #8]) then
      Key := #0;
end;

initialization
   RegisterClass(TfTarefa2);

finalization
   UnRegisterClass(TfTarefa2);

end.
