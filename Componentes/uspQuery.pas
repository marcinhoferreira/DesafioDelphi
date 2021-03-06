unit uspQuery;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Phys;

type
  TspQuery = class(TFDQuery)
  private
    { Private declarations }
    fspCondicoes: TStringList;
    fspColunas: TStringList;
    fspTabelas: TStringList;
    function GetspColunas: TStringList;
    function GetspCondicoes: TStringList;
    procedure SetspColunas(const Value: TStringList);
    procedure SetspCondicoes(const Value: TStringList);
    procedure SetspTabelas(const Value: TStringList);
    procedure SetsppTabelas(const Value: TStringList);
    function GetspTabelas: TStringList;
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure GeraSQL;
    property spCondicoes: TStringList Read GetspCondicoes Write SetspCondicoes;
    property spColunas: TStringList Read GetspColunas Write SetspColunas;
    property spTabelas: TStringList Read GetspTabelas Write SetspTabelas;
  end;

implementation

{ TspQuery }

constructor TspQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
   fspCondicoes := TStringList.Create;
   fspColunas := TStringList.Create;
   fspTabelas := TStringList.Create;
end;

destructor TspQuery.Destroy;
begin
   FreeAndNil(fspCondicoes);
   FreeAndNil(fspColunas);
   FreeAndNil(fspTabelas);
  inherited;
end;

procedure TspQuery.GeraSQL;
var
   ATabela,
   AColunas,
   ACondicoes,
   AInstrucaoSQL: String;
   AIndex: Integer;
begin
   Self.SQL.Clear;
   AInstrucaoSQL := '';
   if fspTabelas.Count = 0 then
      raise Exception.Create('? necess?rio informar uma tabela!')
   else
      if fspTabelas.Count > 1 then
         raise Exception.Create('N?o ? permtido mais de uma tabela!')
      else
         begin
            if fspColunas.Count = 0 then
               raise Exception.Create('? necess?rio informar, pelo menos, uma coluna!')
            else
               begin
                  ATabela := fspTabelas[0];
                  AColunas := '';
                  for AIndex := 0 to fspColunas.Count - 1 do
                      begin
                         if AColunas <> '' then
                            AColunas := AColunas + ', ';
                         AColunas := AColunas + fspColunas[AIndex];
                      end;
                  ACondicoes := '';
                  if fspCondicoes.Count > 0 then
                     begin
                        for AIndex := 0 to fspCondicoes.Count - 1 do
                           begin
                              if ACondicoes <> '' then
                                 ACondicoes := ACondicoes + ' AND ';
                              ACondicoes := ACondicoes + fspCondicoes[AIndex];
                           end;
                     end;
                  AInstrucaoSQL := AInstrucaoSQL +
                                   'SELECT ' +
                                   AColunas +
                                   ' FROM ' +
                                   ATabela;
                  if ACondicoes <> '' then
                     AInstrucaoSQL := AInstrucaoSQL +
                                      ' WHERE ' +
                                      ACondicoes;
                  Self.SQL.Add(AInstrucaoSQL);
               end;
         end;
end;

function TspQuery.GetspColunas: TStringList;
begin
   Result := fspColunas;
end;

function TspQuery.GetspCondicoes: TStringList;
begin
   Result := fspCondicoes;
end;

function TspQuery.GetspTabelas: TStringList;
begin
   Result := fspTabelas;
end;

procedure TspQuery.SetspColunas(const Value: TStringList);
begin
   fspColunas := Value;
end;

procedure TspQuery.SetspCondicoes(const Value: TStringList);
begin
   fspCondicoes := Value;
end;

procedure TspQuery.SetsppTabelas(const Value: TStringList);
begin

end;

procedure TspQuery.SetspTabelas(const Value: TStringList);
begin
   fspTabelas := Value;
end;

end.
