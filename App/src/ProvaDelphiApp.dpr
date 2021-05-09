program ProvaDelphiApp;

uses
  Vcl.Forms,
  uThreadProgresso in 'Classes\uThreadProgresso.pas',
  ProvaDelphiApp.View.MenuPrincipal in 'View\ProvaDelphiApp.View.MenuPrincipal.pas' {frmMenuPrincipal},
  uTarefa1 in 'View\uTarefa1.pas' {fTarefa1},
  uTarefa2 in 'View\uTarefa2.pas' {fTarefa2},
  uTarefa3 in 'View\uTarefa3.pas' {fTarefa3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.Run;
end.
