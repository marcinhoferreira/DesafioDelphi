unit uThreadProgresso;

interface

uses
   SysUtils, Classes, ComCtrls, StdCtrls;

type
   TThreadProgresso = class(TThread)
   private
      { Private declarations }
      fBarraDeProgresso: TProgressBar;
      fAndamento: TLabel;
      fTempoDeEspera: Integer;
   protected
      { Protected declarations }
      procedure Execute; override;
   public
      { Public declarations }
      constructor Create(CreateSuspended: Boolean);
      destructor Destroy; override;
      property BarraDeProgresso: TProgressBar Read fBarraDeProgresso Write fBarraDeProgresso;
      property Andamento: TLabel Read fAndamento Write fAndamento;
      property TempoDeEspera: Integer Read fTempoDeEspera Write fTempoDeEspera;
   end;

implementation

{ TThreadProgresso }

constructor TThreadProgresso.Create(CreateSuspended: Boolean);
begin
   inherited Create(CreateSuspended);
   fBarraDeProgresso := TProgressBar.Create(nil);
   fAndamento := TLabel.Create(nil);
end;

destructor TThreadProgresso.Destroy;
begin
   FreeAndNil(fBarraDeProgresso);
   FreeAndNil(fAndamento);
  inherited;
end;

procedure TThreadProgresso.Execute;
var
   I: Integer;
begin
  inherited;
   for I := 0 to 100 do
      begin
         fBarraDeProgresso.Position := I;
         fAndamento.Caption := IntToStr(I);
         Sleep(TempoDeEspera);
      end;
end;

end.
