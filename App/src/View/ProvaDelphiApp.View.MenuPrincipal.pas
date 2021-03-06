unit ProvaDelphiApp.View.MenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Menus;

type
  TfrmMenuPrincipal = class(TForm)
    mnuMenuPrincipal: TMainMenu;
    r1: TMenuItem;
    arefa11: TMenuItem;
    arefa21: TMenuItem;
    arefa31: TMenuItem;
    procedure arefa11Click(Sender: TObject);
    procedure arefa21Click(Sender: TObject);
    procedure arefa31Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AbreFormulario(AFormClass: TFormClass);
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

uses
   uTarefa1,
   uTarefa2,
   uTarefa3;

{$R *.dfm}

{ TfrmMenuPrincipal }

{
   AbreFormulario - Cria e exibe o formulário
   Argumentos:
      AFormClass - Nome da classe do formulário a ser criado
}
procedure TfrmMenuPrincipal.AbreFormulario(AFormClass: TFormClass);
var
   AFormulario: TForm;
begin
   Application.CreateForm(AFormClass, AFormulario);
end;

procedure TfrmMenuPrincipal.arefa11Click(Sender: TObject);
begin
   AbreFormulario(TfTarefa1);
end;

procedure TfrmMenuPrincipal.arefa21Click(Sender: TObject);
begin
   AbreFormulario(TfTarefa2);
end;

procedure TfrmMenuPrincipal.arefa31Click(Sender: TObject);
begin
   AbreFormulario(TfTarefa3);
end;

end.
