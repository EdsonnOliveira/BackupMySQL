unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.AppEvnts, Vcl.Menus,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, FireDAC.Phys.MySQLDef,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.UI, IniFiles, System.Zip,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, DateUtils, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPrincipal = class(TForm)
    TrayIcon1: TTrayIcon;
    ApplicationEvents1: TApplicationEvents;
    PopupMenu1: TPopupMenu;
    ForarBackup1: TMenuItem;
    Fechar1: TMenuItem;
    txtTitulo: TLabel;
    imgLogo: TImage;
    btnForcarBackup: TButton;
    DriverLink: TFDPhysMySQLDriverLink;
    Cursor: TFDGUIxWaitCursor;
    FDConnection: TFDConnection;
    tBanco: TTimer;
    tBKP: TTimer;
    tZIP: TTimer;
    tApagar: TTimer;
    tRegistros: TTimer;
    FDNFCe: TFDQuery;
    FDNFCeIdNFCe: TFDAutoIncField;
    FDNFCeIDNFCePDV: TIntegerField;
    FDNFCeCaixa: TIntegerField;
    FDNFCeIdFilial: TIntegerField;
    FDNFCeIdFechamento: TIntegerField;
    FDNFCeIdCliente: TIntegerField;
    FDNFCeIdPreVenda: TIntegerField;
    FDNFCeIDRecriacao: TIntegerField;
    FDNFCeIdUsuarioCriacao: TIntegerField;
    FDNFCeIdUsuarioCancelamento: TIntegerField;
    FDNFCeIdVendedor: TIntegerField;
    FDNFCeSerie: TIntegerField;
    FDNFCeNFCe: TStringField;
    FDNFCeNomeCliente: TStringField;
    FDNFCeCNPJCliente: TStringField;
    FDNFCeValorServico: TBCDField;
    FDNFCeValorDesconto: TBCDField;
    FDNFCeValorTroco: TBCDField;
    FDNFCeValorBruto: TBCDField;
    FDNFCeValorLiquido: TBCDField;
    FDNFCeVolume: TIntegerField;
    FDNFCeDataCriacao: TDateField;
    FDNFCeDataEmissao: TDateField;
    FDNFCeDataCancelamento: TDateField;
    FDNFCeHoraCriacao: TTimeField;
    FDNFCeHoraEmissao: TTimeField;
    FDNFCeHoraCancelamento: TTimeField;
    FDNFCeCFOP: TStringField;
    FDNFCeBaseICMS: TBCDField;
    FDNFCeICMS: TBCDField;
    FDNFCeBaseICMSSubst: TBCDField;
    FDNFCeICMSSubst: TBCDField;
    FDNFCeBaseISS: TBCDField;
    FDNFCeISS: TBCDField;
    FDNFCeIPI: TBCDField;
    FDNFCePIS: TBCDField;
    FDNFCePISISS: TBCDField;
    FDNFCeCOFINS: TBCDField;
    FDNFCeCOFINSISS: TBCDField;
    FDNFCeTribNacional: TBCDField;
    FDNFCeTribImportados: TBCDField;
    FDNFCeTribEstadual: TBCDField;
    FDNFCeTribMunicipal: TBCDField;
    FDNFCeChave: TStringField;
    FDNFCeProtocolo: TStringField;
    FDNFCeErro: TStringField;
    FDNFCeTipo: TIntegerField;
    FDNFCeXML: TMemoField;
    FDNFCeSituacao: TIntegerField;
    FDNFCeItem: TFDQuery;
    FDNFCePagamento: TFDQuery;
    FDNFCePagamentoIdPagamento: TFDAutoIncField;
    FDNFCePagamentoIDPagamentoPDV: TIntegerField;
    FDNFCePagamentoIdNFCe: TIntegerField;
    FDNFCePagamentoCaixa: TIntegerField;
    FDNFCePagamentoIdFechamento: TIntegerField;
    FDNFCePagamentoIdMeioPagamento: TIntegerField;
    FDNFCePagamentoCodigo: TIntegerField;
    FDNFCePagamentoSEQ: TIntegerField;
    FDNFCePagamentoNomeMeio: TStringField;
    FDNFCePagamentoValorPago: TBCDField;
    FDNFCePagamentoValorTotal: TBCDField;
    FDNFCePagamentoCNPJ: TStringField;
    FDNFCePagamentoBandeira: TStringField;
    FDNFCePagamentoAutorizacao: TStringField;
    FDNFCePagamentoConvenio: TIntegerField;
    FDLancamentos: TFDQuery;
    FDLancamentosIDLancamento: TFDAutoIncField;
    FDLancamentosIDLancamentoPDV: TIntegerField;
    FDLancamentosIDFilial: TIntegerField;
    FDLancamentosIDClasse: TIntegerField;
    FDLancamentosIDVenda: TIntegerField;
    FDLancamentosSerie: TIntegerField;
    FDLancamentosCaixa: TIntegerField;
    FDLancamentosVenda: TIntegerField;
    FDLancamentosIDPedido: TIntegerField;
    FDLancamentosIDTerminal: TIntegerField;
    FDLancamentosIDCliente: TIntegerField;
    FDLancamentosIDVendedor: TIntegerField;
    FDLancamentosIDUsuarioCriacao: TIntegerField;
    FDLancamentosIDUsuarioBaixa: TIntegerField;
    FDLancamentosIDUsuarioCancelamento: TIntegerField;
    FDLancamentosCNPJCliente: TStringField;
    FDLancamentosNomeCliente: TStringField;
    FDLancamentosValorTroco: TSingleField;
    FDLancamentosValorDesconto: TSingleField;
    FDLancamentosValorBruto: TSingleField;
    FDLancamentosValorLiquido: TSingleField;
    FDLancamentosDataCriacao: TDateField;
    FDLancamentosDataEmissao: TDateField;
    FDLancamentosDataCancelamento: TDateField;
    FDLancamentosDataVencimento: TDateField;
    FDLancamentosDataBaixa: TDateField;
    FDLancamentosHoraCriacao: TTimeField;
    FDLancamentosHoraEmissao: TTimeField;
    FDLancamentosHoraCancelamento: TTimeField;
    FDLancamentosHoraVencimento: TTimeField;
    FDLancamentosHoraBaixa: TTimeField;
    FDLancamentosTipo: TIntegerField;
    FDLancamentosOrigem: TIntegerField;
    FDLancamentosSituacao: TIntegerField;
    FDLancPagamento: TFDQuery;
    FDLancPagamentoIdPagamento: TFDAutoIncField;
    FDLancPagamentoIDPagamentoPDV: TIntegerField;
    FDLancPagamentoCaixa: TIntegerField;
    FDLancPagamentoIdLancamento: TIntegerField;
    FDLancPagamentoIdMeioPagamento: TIntegerField;
    FDLancPagamentoIdCondicaoPagamento: TIntegerField;
    FDLancPagamentoSEQ: TIntegerField;
    FDLancPagamentoNomeMeio: TStringField;
    FDLancPagamentoNomeCondicao: TStringField;
    FDLancPagamentoValor: TBCDField;
    FDLancPagamentoJuros: TSingleField;
    FDLancPagamentoParcelas: TIntegerField;
    FDLancPagamentoConvenio: TIntegerField;
    FDLancPagamentoSituacao: TIntegerField;
    FDLancPagParcela: TFDQuery;
    FDLancPagParcelaIDParcela: TFDAutoIncField;
    FDLancPagParcelaIDParcelaPDV: TIntegerField;
    FDLancPagParcelaCaixa: TIntegerField;
    FDLancPagParcelaIDPagamento: TIntegerField;
    FDLancPagParcelaNumero: TIntegerField;
    FDLancPagParcelaValor: TBCDField;
    FDLancPagParcelaConvenio: TIntegerField;
    FDLancPagParcelaValorPago: TBCDField;
    FDLancPagParcelaValorResta: TBCDField;
    FDLancPagParcelaJuros: TSingleField;
    FDLancPagParcelaDataVencimento: TDateField;
    FDLancPagParcelaSituacao: TIntegerField;
    FDBackup: TFDQuery;
    FDBackupIDBackup: TFDAutoIncField;
    FDBackupCaminho: TStringField;
    FDBackupHora: TTimeField;
    DBGrid1: TDBGrid;
    dsBackup: TDataSource;
    btnAbrirDiretorio: TButton;
    FDNFCeItemIdItem: TFDAutoIncField;
    FDNFCeItemIDItemPDV: TIntegerField;
    FDNFCeItemIdNFCe: TIntegerField;
    FDNFCeItemCaixa: TIntegerField;
    FDNFCeItemIdProduto: TIntegerField;
    FDNFCeItemSEQ: TIntegerField;
    FDNFCeItemCodigo: TIntegerField;
    FDNFCeItemNome: TStringField;
    FDNFCeItemCFOP: TStringField;
    FDNFCeItemNCM: TStringField;
    FDNFCeItemServico: TStringField;
    FDNFCeItemUM: TStringField;
    FDNFCeItemQuantidade: TFMTBCDField;
    FDNFCeItemValorDesconto: TBCDField;
    FDNFCeItemValorBruto: TBCDField;
    FDNFCeItemValorLiquido: TBCDField;
    FDNFCeItemTipo: TIntegerField;
    FDNFCeItemTipoTributacao: TIntegerField;
    FDNFCeItemOrigem: TStringField;
    FDNFCeItemICMS: TBCDField;
    FDNFCeItemBaseICMS: TBCDField;
    FDNFCeItemPorcICMS: TBCDField;
    FDNFCeItemCSTICMS: TStringField;
    FDNFCeItemPorcRedICMS: TBCDField;
    FDNFCeItemPorcST: TBCDField;
    FDNFCeItemISS: TBCDField;
    FDNFCeItemBaseISS: TBCDField;
    FDNFCeItemPorcISS: TBCDField;
    FDNFCeItemIPI: TBCDField;
    FDNFCeItemBaseIPI: TBCDField;
    FDNFCeItemPorcIPI: TBCDField;
    FDNFCeItemPIS: TStringField;
    FDNFCeItemAliqPIS: TBCDField;
    FDNFCeItemValorPIS: TBCDField;
    FDNFCeItemCOFINS: TStringField;
    FDNFCeItemAliqCOFINS: TBCDField;
    FDNFCeItemValorCOFINS: TBCDField;
    FDNFCeItemMVA: TBCDField;
    FDNFCeItemTribNacional: TBCDField;
    FDNFCeItemTribImportados: TBCDField;
    FDNFCeItemTribEstadual: TBCDField;
    FDNFCeItemTribMunicipal: TBCDField;
    FDNFCeItemAtacado: TIntegerField;
    FDNFCeItemSimilar: TIntegerField;
    FDNFCeItemObservacoes: TStringField;
    FDNFCeItemSituacao: TIntegerField;
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure tBancoTimer(Sender: TObject);
    procedure btnForcarBackupClick(Sender: TObject);
    procedure tBKPTimer(Sender: TObject);
    procedure ForarBackup1Click(Sender: TObject);
    procedure tZIPTimer(Sender: TObject);
    procedure tApagarTimer(Sender: TObject);
    procedure tRegistrosTimer(Sender: TObject);
    procedure btnAbrirDiretorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Log(Caminho, Nome, Msg : String) : String;

    procedure CarregarBanco;
    procedure Backup;
  end;

var
  frmPrincipal: TfrmPrincipal;
  TempoBanco : Integer;
  CaminhoZIP, CaminhoBKP : String;

  {$REGION 'Ini'}
    iGERALApagarRegistros : String;
  {$ENDREGION}

implementation

{$R *.dfm}

{$REGION 'Form'}
procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FDConnection.Connected := False;

  Self.Hide();
  Self.WindowState := wsMinimized;
  TempoBanco := 0;
end;

function TfrmPrincipal.Log(Caminho, Nome, Msg: String): String;
var
  Txt : TextFile;
  Log : TStringList;
  NomeDataLog : String;
begin
  try
    try
      if not DirectoryExists(Caminho) then
        ForceDirectories(Caminho);

     NomeDataLog := FormatDateTime('dd/mm/yyyy', Date);
     NomeDataLog := StringReplace(NomeDataLog, '/', '', [rfReplaceAll, rfIgnoreCase]);
     NomeDataLog := Nome;
     if not FileExists(Caminho+NomeDataLog) then
      begin
        AssignFile(Txt,Caminho+NomeDataLog);
        Rewrite(Txt);
        Write(Txt, FormatDateTime('dd/mm/yyyy', Date) + ' - ' +NomeDataLog);
        CloseFile(Txt);
      end;
     Log := TStringList.Create;
     Log.LoadFromFile(Caminho+NomeDataLog);
     Log.Add(FormatDateTime('dd/mm/yyyy', Date) + ' - ' + FormatDateTime('hh:mm:ss:zzz', Time)+ ' : ' + Msg);
     Log.SaveToFile(Caminho+NomeDataLog);
    except
      AssignFile(Txt,Caminho+NomeDataLog);
      Rewrite(Txt);
      Write(Txt,msg);
      CloseFile(Txt);
    end;
  finally
    FreeAndNil(log);
  end;
end;

procedure TfrmPrincipal.CarregarBanco;
var
  Ini : TIniFile;
  Usuario, IP : String;
begin
  Ini := TIniFile.Create('C:\Cupom System\APP\Backup\Backup.ini');

  if Ini.ReadString('CONN LOCAL','USUARIO','') = Trim('') then
    Ini.WriteString('CONN LOCAL','USUARIO','root');

  if Ini.ReadString('CONN LOCAL','IP','') = Trim('') then
    Ini.WriteString('CONN LOCAL','IP','localhost');

  Usuario := Ini.ReadString('CONN LOCAL','USUARIO','');
  IP      := Ini.ReadString('CONN LOCAL','IP','');

  iGERALApagarRegistros := Ini.ReadString('GERAL','ApagarRegistros','');

  try
    FDConnection.Connected := False;
    FDConnection.Params.UserName := Usuario;
    FDConnection.Params.Add('SERVER='+IP);
    FDConnection.Connected := True;
  except on e: exception do
      Log('C:\Cupom System\APP\Backup\Log\', 'Conexao.log', 'Não foi possível verificar a conexão: '+ e.Message);
  end;

  FDBackup.Close;
  FDBackup.SQL.Text := 'SELECT * FROM app_backup ORDER BY IDBackup ASC';
  FDBackup.Open;

  if FDBackup.IsEmpty = True then
  begin
    FDBackup.Insert;
      FDBackupCaminho.AsString := 'C:\Cupom System\APP\Backup\Backups\';
      FDBackupHora.AsString    := '14:02:00';
    FDBackup.Post;
  end;

  CaminhoBKP := FDBackupCaminho.AsString;

  if iGERALApagarRegistros = '1' then
    tRegistros.Enabled := True;

  tBKP.Enabled := True;
end;

{$ENDREGION}

{$REGION 'Timer'}
procedure TfrmPrincipal.tBancoTimer(Sender: TObject);
begin
  if TempoBanco = 25 then
  begin
    CarregarBanco;
    tBanco.Enabled := False;
  end
  else
    Inc(TempoBanco);
end;

procedure TfrmPrincipal.tBKPTimer(Sender: TObject);
var
  HorarioAtual : String;
begin
  FDBackup.First;
  while not FDBackup.Eof do
  begin
    HorarioAtual := FormatDateTime('hh:mm:ss', Time);

    CaminhoBKP := FDBackupCaminho.AsString;
    if HorarioAtual = FDBackupHora.AsString then
      Backup;

    FDBackup.Next;
  end;
end;

procedure TfrmPrincipal.tRegistrosTimer(Sender: TObject);
var
  Data : String;
begin
  tRegistros.Enabled := False;

  Data := DateToStr(IncMonth(Date, (1 * (-3))));
  Data := DateToStr(EndOfTheMonth(StrToDate(Data)));
  Data := FormatDateTime('yyyy-mm-dd', StrToDate(Data));

  Application.ProcessMessages;

  {$REGION 'NFCe'}
    FDNFCe.Close;
    FDNFCe.SQL.Text := 'SELECT * FROM nfce WHERE DataCriacao<='+QuotedStr(Data)+' AND Situacao<>5';
    FDNFCe.Open;

    while not FDNFCe.Eof do
    begin
      FDNFCeItem.Close;
      FDNFCeItem.SQL.Text := 'SELECT * FROM nfce_item WHERE IDNFCe='+QuotedStr(FDNFCeIDNFCe.AsString)+' AND Caixa='+QuotedStr(FDNFCeCaixa.AsString);
      FDNFCeItem.Open;

      while not FDNFCeItem.Eof do
      begin
        FDNFCeItem.Delete;
        FDNFCeItem.Next;
      end;

      FDNFCePagamento.Close;
      FDNFCePagamento.SQL.Text := 'SELECT * FROM nfce_pagamento WHERE IDNFCe='+QuotedStr(FDNFCeIdNFCe.AsString)+' AND Caixa='+QuotedStr(FDNFCeCaixa.AsString);
      FDNFCePagamento.Open;

      while not FDNFCePagamento.Eof do
      begin
        FDNFCePagamento.Delete;
        FDNFCePagamento.Next;
      end;

      FDNFCe.Delete;
      FDNFCe.Next;
    end;

    {$REGION 'Itens'}
      Data := DateToStr(IncMonth(Date, (1 * (-1))));
      Data := DateToStr(EndOfTheMonth(StrToDate(Data)));
      Data := FormatDateTime('yyyy-mm-dd', StrToDate(Data));

      FDNFCe.Close;
      FDNFCe.SQL.Text := 'SELECT * FROM nfce WHERE DataCriacao<='+QuotedStr(Data)+' AND Situacao<>5';
      FDNFCe.Open;

      while not FDNFCe.Eof do
      begin
        FDNFCeItem.Close;
        FDNFCeItem.SQL.Text := 'SELECT * FROM nfce_item WHERE IDNFCe='+QuotedStr(FDNFCeIDNFCe.AsString)+' AND Caixa='+QuotedStr(FDNFCeCaixa.AsString);
        FDNFCeItem.Open;

        while not FDNFCeItem.Eof do
        begin
          FDNFCeItem.Delete;
          FDNFCeItem.Next;
        end;

        FDNFCe.Next;
      end;
    {$ENDREGION}
  {$ENDREGION}

  Application.ProcessMessages;

  {$REGION 'Lançamentos'}
    FDLancamentos.Close;
    FDLancamentos.SQL.Text := 'SELECT * FROM lancamentos WHERE DataCriacao<='+QuotedStr(Data);
    FDLancamentos.Open;

    while not FDLancamentos.Eof do
    begin
      FDLancPagamento.Close;
      FDLancPagamento.SQL.Text := 'SELECT * FROM lancamentos_pagamento WHERE IDLancamento='+QuotedStr(FDLancamentosIDLancamento.AsString)+' AND Caixa='+QuotedStr(FDLancamentosCaixa.AsString);
      FDLancPagamento.Open;

      while not FDLancPagamento.Eof do
      begin
        FDLancPagParcela.Close;
        FDLancPagParcela.SQL.Text := 'SELECT * FROM lancamentos_pagamento_parcela WHERE IDPagamento='+QuotedStr(FDLancPagamentoIdPagamento.AsString);
        FDLancPagParcela.Open;

        while not FDLancPagParcela.Eof do
        begin
          FDLancPagParcela.Delete;
          FDLancPagParcela.Next;
        end;

        FDLancPagamento.Delete;
        FDLancPagamento.Next;
      end;

      FDLancamentos.Delete;
      FDLancamentos.Next;
    end;
  {$ENDREGION}

  tRegistros.Enabled := True;
end;

procedure TfrmPrincipal.tZIPTimer(Sender: TObject);
var
  Zip : TZipFile;
begin
  if FileExists(CaminhoZIP+'.sql') then
  begin
    try
      Zip := TZipFile.Create;
      Zip.Open(CaminhoZIP+'.zip', zmWrite);
      Zip.Add(CaminhoZIP+'.sql');
    finally
      Zip.Free;
      tZIP.Enabled := False;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Botões'}
procedure TfrmPrincipal.btnAbrirDiretorioClick(Sender: TObject);
var
  Caminho : String;
begin
  Caminho := 'Explorer "'+FDBackupCaminho.AsString+'"';
  WinExec(pAnsiChar(AnsiString(Caminho)), SW_SHOWNORMAL);
end;

procedure TfrmPrincipal.btnForcarBackupClick(Sender: TObject);
begin
  CarregarBanco;

  FDBackup.First;
  CaminhoBKP := FDBackupCaminho.AsString;

  Backup;
end;

procedure TfrmPrincipal.Backup;
var
  BAT : TStringList;
  Caminho, CaminhoBAT, Script : String;
begin
  try
    Caminho := CaminhoBKP;

    ForceDirectories(Caminho);
    Caminho := FDBackupCaminho.AsString + FormatDateTime('dd-mm-yy (hhmmss)', Date + Time);
    Caminho := Caminho;
    CaminhoZIP := Caminho;

    Script := QuotedStr('C:\Cupom System\Lib\mysqldump.exe') + ' -u root -pCupom@System123 --databases cs > ' +
              QuotedStr(Caminho+'.sql');

    Script := StringReplace(Script, '''', '"', [rfReplaceAll]);

    BAT := TStringList.Create;
      BAT.Add(Script);
      BAT.Add('pause');
    BAT.SaveToFile('C:\Cupom System\APP\Backup\Backup.bat');

    CaminhoBAT := QuotedStr('C:\Cupom System\APP\Backup\Backup.bat');
    CaminhoBAT := StringReplace(CaminhoBAT, '''', '"', [rfReplaceAll]);

    WinExec(pAnsiChar(AnsiString(CaminhoBAT)), SW_HIDE);
  finally
    FreeAndNil(BAT);
//    tApagar.Enabled := True;
  end;
end;

procedure TfrmPrincipal.tApagarTimer(Sender: TObject);
begin
  DeleteFile('C:\Cupom System\APP\Backup\Backup.bat');
  tApagar.Enabled := False;
end;

procedure TfrmPrincipal.ForarBackup1Click(Sender: TObject);
begin
  btnForcarBackupClick(Sender);
end;

procedure TfrmPrincipal.Fechar1Click(Sender: TObject);
begin
  Close;
end;
{$ENDREGION}

{$REGION 'Eventos'}
procedure TfrmPrincipal.ApplicationEvents1Minimize(Sender: TObject);
begin
  Self.Hide();
  Self.WindowState  := wsMinimized;
  TrayIcon1.Visible := True;
end;

procedure TfrmPrincipal.TrayIcon1Click(Sender: TObject);
begin
  Self.Show();
  Self.WindowState  := wsNormal;
  TrayIcon1.Visible := False;
end;
{$ENDREGION}

end.
