unit uTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

type
  TfTarefa3 = class(TForm)
    grdProjetos: TDBGrid;
    edtTotal: TLabeledEdit;
    btnTotal: TButton;
    edtTotalDivisoes: TLabeledEdit;
    btnTotalDivisoes: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnTotalClick(Sender: TObject);
    procedure btnTotalDivisoesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure PopulaDataSet(const ARegistros: Word);
    procedure SomaTotal;
    procedure TotalDivisoes;
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;
  cdsProjetos: TClientDataSet;
  dsProjetos: TDataSource;

implementation

uses
   Math;

{$R *.dfm}

{ TfrmTarefa3 }

procedure TfTarefa3.btnTotalClick(Sender: TObject);
begin
   TButton(Sender).Enabled := False;
   try
      SomaTotal;
   finally
      TButton(Sender).Enabled := True;
   end;
end;

procedure TfTarefa3.btnTotalDivisoesClick(Sender: TObject);
begin
   TButton(Sender).Enabled := False;
   try
      TotalDivisoes;
   finally
      TButton(Sender).Enabled := True;
   end;
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := TCloseAction.caFree;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
   cdsProjetos := TClientDataSet.Create(Self);
   cdsProjetos.FieldDefs.Clear;
   cdsProjetos.FieldDefs.Add('idProjeto', ftInteger, 0, True);
   cdsProjetos.FieldDefs.Add('NomeProjeto', ftString, 70, True);
   cdsProjetos.FieldDefs.Add('Valor', ftFloat, 0, False);
   cdsProjetos.CreateDataSet;
   // Formata o campo para exibi??o em formato monet?rio
   TFloatField(cdsProjetos.FieldByName('Valor')).DisplayFormat := 'R$ ,0.00';
   dsProjetos := TDataSource.Create(Self);
   dsProjetos.DataSet := cdsProjetos;
   grdProjetos.DataSource := dsProjetos;
end;

procedure TfTarefa3.FormDestroy(Sender: TObject);
begin
   grdProjetos.DataSource := nil;
   dsProjetos.DataSet := nil;
   FreeAndNil(cdsProjetos);
   FreeAndNil(dsProjetos);
end;

procedure TfTarefa3.FormShow(Sender: TObject);
begin
   PopulaDataSet(10);
   // Exibe o formul?rio em tela cheia
   WindowState := TWindowState.wsMaximized;
end;

procedure TfTarefa3.PopulaDataSet(const ARegistros: Word);
var
   AContador: Integer;
begin
   cdsProjetos.EmptyDataSet;
   AContador := 1;
   while AContador <= ARegistros do
      begin
         cdsProjetos.Append;
         cdsProjetos.FieldByName('idProjeto').AsInteger := AContador;
         cdsProjetos.FieldByName('NomeProjeto').AsString := 'Projeto ' + IntToStr(AContador);
         cdsProjetos.FieldByName('Valor').AsFloat := AContador * 10;
         cdsProjetos.Post;
         Inc(AContador, 1);
      end;
   cdsProjetos.First;
end;

procedure TfTarefa3.SomaTotal;
var
   ABookMark: TBookMark;
   ASoma: Double;
begin
   cdsProjetos.DisableControls;
   ABookMark := cdsProjetos.GetBookMark;
   ASoma := 0;
   cdsProjetos.First;
   while not cdsProjetos.Eof do
      begin
         ASoma := ASoma + cdsProjetos.FieldByName('Valor').AsFloat;
         cdsProjetos.Next;
      end;
   cdsProjetos.GotoBookmark(ABookMark);
   cdsProjetos.FreeBookMark(ABookMark);
   cdsProjetos.EnableControls;
   edtTotal.Text := FormatFloat(',0.00', ASoma);
end;

procedure TfTarefa3.TotalDivisoes;
var
   ABookMark: TBookMark;
   AValorAnterior,
   ASoma: Double;
begin
   cdsProjetos.DisableControls;
   ABookMark := cdsProjetos.GetBookMark;
   cdsProjetos.First;
   AValorAnterior := cdsProjetos.FieldByName('Valor').AsFloat;
   ASoma := 0;
   while not cdsProjetos.Eof do
      begin
         cdsProjetos.Next;
         if not cdsProjetos.Eof then
            begin
               ASoma := ASoma + cdsProjetos.FieldByName('Valor').AsFloat / AValorAnterior;
               AValorAnterior := cdsProjetos.FieldByName('Valor').AsFloat;
            end;
      end;
   cdsProjetos.GotoBookmark(ABookMark);
   cdsProjetos.FreeBookMark(ABookMark);
   cdsProjetos.EnableControls;
   edtTotalDivisoes.Text := FormatFloat(',0.00', ASoma);
end;

initialization
   RegisterClass(TfTarefa3);

finalization
   UnRegisterClass(TfTarefa3);

end
.
