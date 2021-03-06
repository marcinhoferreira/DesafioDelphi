unit uTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uspQuery;

type
  TfTarefa1 = class(TForm)
    lblTituloColunas: TLabel;
    mmoColunas: TMemo;
    lblTituloTabelas: TLabel;
    mmoTabelas: TMemo;
    lblTituloCondicoes: TLabel;
    mmoCondicoes: TMemo;
    lblTituloSQLGerado: TLabel;
    mmoSQLGerado: TMemo;
    btnGeraSQL: TButton;
    spQuery1: TspQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnGeraSQLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

{ TfTarefa1 }

procedure TfTarefa1.btnGeraSQLClick(Sender: TObject);
begin
   // Carrega as colunas
   with spQuery1 do
      begin
         spColunas.Clear;
         spColunas.AddStrings(mmoColunas.Lines);
      end;
   // Carrega as tabelas
   with spQuery1 do
      begin
         spTabelas.Clear;
         spTabelas.AddStrings(mmoTabelas.Lines);
      end;
   // Carrega as condi??es
   with spQuery1 do
      begin
         spCondicoes.Clear;
         spCondicoes.AddStrings(mmoCondicoes.Lines);
      end;
   // Executa o m?todo para gerar a instru??o SQL
   spQuery1.GeraSQL;
   // Carrega a instru??o SQL gerada, no componente TMemo
   mmoSQLGerado.Lines.Clear;
   mmoSQLGerado.lines.AddStrings(spQuery1.SQL);
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   // Destr?i o formul?rio ao fechar
   Action := TCloseAction.caFree;
end;

procedure TfTarefa1.FormShow(Sender: TObject);
begin
   // Exibe o formul?rio em tela cheia
   WindowState := TWindowState.wsMaximized;
end;

initialization
   RegisterClass(TfTarefa1);

finalization
   UnRegisterClass(TfTarefa1);

end.
