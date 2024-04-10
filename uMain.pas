unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, ShellAPI,
  dprocess, IconFontsImage, System.ImageList, Vcl.ImgList, Vcl.ComCtrls,
  System.JSON, System.Generics.Collections,
  System.IOUtils;

type
  TfrmPrincipal = class(TForm)
    pnlPrincipal: TPanel;
    btnConectar: TButton;
    edtIPBOX: TEdit;
    mmoLog: TMemo;
    btnReiniciarBox: TButton;
    gpBoxFuncoes: TGroupBox;
    btnTirarPrint: TButton;
    bntLimparDados: TButton;
    pnlTopo: TPanel;
    gpBoxControles: TGroupBox;
    GroupBox2: TGroupBox;
    pnlMeio: TPanel;
    pnlFuncoes: TPanel;
    pnlControles: TPanel;
    StatusBar1: TStatusBar;
    pnlInferior: TPanel;
    Timer1: TTimer;
    btnDesconectar: TButton;
    cbbPacotes: TComboBox;
    btnInicio: TButton;
    btnInput: TButton;
    edtTexto: TEdit;
    btnProximo: TButton;
    btnIr: TButton;
    btnVolumeMais: TButton;
    btnVolumesMenos: TButton;
    Button1: TButton;
    procedure btnConectarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnReiniciarBoxClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDesconectarClick(Sender: TObject);
    procedure btnTirarPrintClick(Sender: TObject);
    procedure bntLimparDadosClick(Sender: TObject);
    procedure btnCimaClick(Sender: TObject);
    procedure btnDireitaClick(Sender: TObject);
    procedure btnBaixoClick(Sender: TObject);
    procedure btnEsquedaClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure bntVoltarClick(Sender: TObject);
    procedure btnInicioClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnInputClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnIrClick(Sender: TObject);
    procedure btnVolumeMaisClick(Sender: TObject);
    procedure btnVolumesMenosClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edtIPBOXChange(Sender: TObject);
  private
    { Private declarations }
    procedure PreencherComboBoxComArquivoJSON(const FileName: string);
    function ExtractPacoteFromComboBox(const ComboBoxText: string): string;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnDesconectarClick(Sender: TObject);
var
  output: AnsiString;
begin
  RuncOmmand('C:\platform-tools\adb.exe', ['disconnect'], output);
  mmoLog.Lines.Add(Trim(output));

  btnConectar.Enabled := Enabled;
  btnDesconectar.Enabled := not Enabled;
  pnlMeio.visible := False;
  edtIPBOX.Text := '';
end;

procedure TfrmPrincipal.btnDireitaClick(Sender: TObject);
var
  output: ansistring;
begin
  RuncOmmand('C:\platform-tools\adb.exe', ['shell', 'input', 'keyevent',
    '22'], output);
  mmoLog.Lines.Add(Trim(output));
  mmoLog.Lines.Add('Comando executado com sucesso !');
end;

procedure TfrmPrincipal.btnEsquedaClick(Sender: TObject);
var
  output: ansistring;
begin
  RuncOmmand('C:\platform-tools\adb.exe', ['shell', 'input', 'keyevent',
    '21'], output);
  mmoLog.Lines.Add(Trim(output));
  mmoLog.Lines.Add('Comando executado com sucesso !');
end;

procedure TfrmPrincipal.btnInicioClick(Sender: TObject);
var
  output: ansistring;
begin
  RuncOmmand('C:\platform-tools\adb.exe', ['shell', 'input', 'keyevent',
    '3'], output);
  mmoLog.Lines.Add(Trim(output));
  mmoLog.Lines.Add('Comando executado com sucesso !');
end;

procedure TfrmPrincipal.btnInputClick(Sender: TObject);
var
  output: ansistring;
begin
  if edtTexto.Text = '' then
  begin
    ShowMessage('Digite um texto para ser enviado!');
    edtTexto.SetFocus;
    Exit;
  end;

  RuncOmmand('C:\platform-tools\adb.exe', ['shell', 'input', 'text',
    edtTexto.Text], output);
  mmoLog.Lines.Add('Texto enviado com sucesso !');

  // Limpar o edit
  edtTexto.Text := '';
end;

procedure TfrmPrincipal.btnIrClick(Sender: TObject);
var
  output: ansistring;
begin
  RuncOmmand('C:\platform-tools\adb.exe', ['shell', 'input', 'keyevent',
    '66'], output);
  mmoLog.Lines.Add(Trim(output));
  mmoLog.Lines.Add('Comando executado com sucesso !');
end;

procedure TfrmPrincipal.btnOKClick(Sender: TObject);
var
  output: ansistring;
begin
  RuncOmmand('C:\platform-tools\adb.exe', ['shell', 'input', 'keyevent',
    '23'], output);
  mmoLog.Lines.Add(Trim(output));
  mmoLog.Lines.Add('Comando executado com sucesso !');
end;

procedure TfrmPrincipal.btnReiniciarBoxClick(Sender: TObject);
var
  output: ansistring;
begin
  RuncOmmand('C:\platform-tools\adb.exe', ['reboot'], output);
  // aguardar 15 segundos para reiniciar
  mmoLog.Lines.Add(Trim(output));
  Sleep(15000);

  btnConectar.Enabled := Enabled;
  btnDesconectar.Enabled := not Enabled;
  pnlMeio.visible := False;
  edtIPBOX.Text := '';
end;

procedure TfrmPrincipal.btnTirarPrintClick(Sender: TObject);
var
  output: ansistring;
  byteArray: TBytes;
begin
  RuncOmmand('C:\platform-tools\adb.exe', ['exec-out', 'screencap',
    '-p'], output);

  // Converter a AnsiString para TBytes
  SetLength(byteArray, Length(output));
  Move(output[1], byteArray[0], Length(output));

  // Salvar o print na pasta do projeto
  TFile.WriteAllBytes('print.png', byteArray);

  mmoLog.Lines.Add('Print salvo no diretório: ' + GetCurrentDir);

  // Criar MessageDlg personalizado
  if MessageBox(Handle, 'Deseja abrir o print?', 'Abrir Print', MB_YESNO) = IDYES
  then
    ShellExecute(Handle, 'open', 'print.png', nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmPrincipal.btnVolumeMaisClick(Sender: TObject);
var
  output: ansistring;
begin
  RuncOmmand('C:\platform-tools\adb.exe', ['shell', 'input', 'keyevent',
    '24'], output);
  mmoLog.Lines.Add(Trim(output));
  mmoLog.Lines.Add('Comando executado com sucesso !');
end;

procedure TfrmPrincipal.btnVolumesMenosClick(Sender: TObject);
var
  output: ansistring;
begin
  RuncOmmand('C:\platform-tools\adb.exe', ['shell', 'input', 'keyevent',
    '25'], output);
  mmoLog.Lines.Add(Trim(output));
  mmoLog.Lines.Add('Comando executado com sucesso !');
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  output: ansistring;
begin
  RuncOmmand('C:\platform-tools\adb.exe', ['shell', 'input', 'keyevent',
    '164'], output);
  mmoLog.Lines.Add(Trim(output));
  mmoLog.Lines.Add('Comando executado com sucesso !');
end;

procedure TfrmPrincipal.edtIPBOXChange(Sender: TObject);
var
  i: Integer;
  valid: Boolean;
begin
  valid := True;
  for i := 1 to Length(edtIPBOX.Text) do
  begin
    if not (edtIPBOX.Text[i] in ['0' .. '9', '.']) then
    begin
      valid := False;
      Break;
    end;
  end;

  if not valid then
    edtIPBOX.Text := Copy(edtIPBOX.Text, 1, Length(edtIPBOX.Text) - 1);
end;

procedure TfrmPrincipal.btnProximoClick(Sender: TObject);
var
  output: ansistring;
begin
  RuncOmmand('C:\platform-tools\adb.exe', ['shell', 'input', 'keyevent',
    '61'], output);
  mmoLog.Lines.Add(Trim(output));
  mmoLog.Lines.Add('Comando executado com sucesso !');
end;

function TfrmPrincipal.ExtractPacoteFromComboBox(const ComboBoxText
  : string): string;
var
  StartPos, EndPos: Integer;
begin
  // Extrair o valor do pacote entre parênteses
  StartPos := Pos('(', ComboBoxText);
  EndPos := Pos(')', ComboBoxText);

  if (StartPos > 0) and (EndPos > StartPos) then
    Result := Trim(Copy(ComboBoxText, StartPos + 1, EndPos - StartPos - 1))
  else
    Result := '';
end;

procedure TfrmPrincipal.bntLimparDadosClick(Sender: TObject);
var
  output: ansistring;
  PacoteSelecionado: string;
begin
  // Obter o valor do pacote da seleção do ComboBox
  PacoteSelecionado := ExtractPacoteFromComboBox(cbbPacotes.Text);

  if PacoteSelecionado = '' then
  begin
    ShowMessage('Selecione um pacote para limpar os dados!');
    cbbPacotes.SetFocus;
    Exit;
  end;

  // Deseja limpar os dados do pacote selecionado?
  if MessageBox(Handle, 'Deseja limpar os dados do pacote selecionado?',
    'Limpar Dados', MB_YESNO) = IDNO then
    Exit;

  // Comando ADB para limpar os dados do pacote
  if RuncOmmand('C:\platform-tools\adb.exe', ['shell', 'pm', 'clear',
    PacoteSelecionado], output) then
  begin
    mmoLog.Lines.Add('Dados do pacote ' + PacoteSelecionado +
      ' limpos com sucesso.');
    // limpar combo box
    cbbPacotes.ItemIndex := -1;
  end
  else
    mmoLog.Lines.Add('Erro ao limpar os dados do pacote ' + PacoteSelecionado +
      ': ' + Trim(output));
end;

procedure TfrmPrincipal.bntVoltarClick(Sender: TObject);
var
  output: ansistring;
begin
  RuncOmmand('C:\platform-tools\adb.exe', ['shell', 'input', 'keyevent',
    '4'], output);
  mmoLog.Lines.Add(Trim(output));
  mmoLog.Lines.Add('Comando executado com sucesso !');
end;

procedure TfrmPrincipal.btnBaixoClick(Sender: TObject);
var
  output: ansistring;
begin
  RuncOmmand('C:\platform-tools\adb.exe', ['shell', 'input', 'keyevent',
    '20'], output);
  mmoLog.Lines.Add(Trim(output));
  mmoLog.Lines.Add('Comando executado com sucesso !');
end;

procedure TfrmPrincipal.btnCimaClick(Sender: TObject);
var
  output: ansistring;
begin
  RuncOmmand('C:\platform-tools\adb.exe', ['shell', 'input', 'keyevent',
    '19'], output);
  mmoLog.Lines.Add(Trim(output));
  mmoLog.Lines.Add('Comando executado com sucesso !');
end;

procedure TfrmPrincipal.btnConectarClick(Sender: TObject);
var
  output: ansistring;
begin
  mmoLog.Lines.Clear;
  mmoLog.Font.Size := 14;
  mmoLog.Alignment := taLeftJustify;
  // passando o IP digitado no edit
  RuncOmmand('C:\platform-tools\adb.exe',
    ['connect', edtIPBOX.Text + ':5555'], output);
  mmoLog.Lines.Add(Trim(output));

  // verificar se no output possui somente o texto "connected to + ip"
  if Pos('connected to', output) > 0 then
  begin
    // ativar o pnlMeio
    pnlMeio.visible := True;
    btnConectar.Enabled := not Enabled;
    btnDesconectar.Enabled := Enabled;
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
var
  output: ansistring;
begin
  RuncOmmand('C:\platform-tools\adb.exe', ['disconnect'], output);
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  cbbPacotes.Items.Clear;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  btnDesconectar.Enabled := not Enabled;
  mmoLog.Font.Size := 50;
  // centralizar o texto do memo
  mmoLog.Alignment := taCenter;
  mmoLog.Lines.Add(Trim('Aguardando conexão...'));

  PreencherComboBoxComArquivoJSON(ExtractFilePath(Application.ExeName) +
    'pacotes.json');
end;

procedure TfrmPrincipal.PreencherComboBoxComArquivoJSON(const FileName: string);
var
  JSONObject: TJSONObject;
  PackagesArray: TJSONArray;
  I: Integer;
  PackageObject: TJSONObject;
  PackageName, PackageID: string;
begin
  // Verifica se o arquivo existe
  if FileExists(FileName) then
  begin
    // Lê o conteúdo do arquivo para uma string
    JSONObject := TJSONObject.ParseJSONValue(TFile.ReadAllText(FileName))
      as TJSONObject;

    try
      // Limpa a lista de itens do ComboBox
      cbbPacotes.Items.Clear;

      // Verifica se o JSON contém a chave "packages"
      if JSONObject.TryGetValue<TJSONArray>('packages', PackagesArray) then
      begin
        // Preenche o ComboBox com os itens do array JSON
        for I := 0 to PackagesArray.Count - 1 do
        begin
          // Obtém o objeto JSON para cada pacote
          PackageObject := PackagesArray.Items[I] as TJSONObject;

          // Verifica se o objeto contém as chaves "nome" e "pacote"
          if PackageObject.TryGetValue<string>('nome', PackageName) and
            PackageObject.TryGetValue<string>('pacote', PackageID) then
          begin
            // Adiciona o valor ao ComboBox usando o formato "nome (pacote)"
            cbbPacotes.Items.Add(Format('%s (%s)', [PackageName, PackageID]));
          end
          else
          begin
            ShowMessage('Objeto de pacote inválido no arquivo JSON.');
            Exit;
          end;
        end;
      end
      else
        ShowMessage('O arquivo pacotes.json não contém a chave "packages".');
    finally
      // Libera a memória alocada para o objeto JSON
      JSONObject.Free;
    end;
  end
  else
    ShowMessage('O arquivo pacotes.json não foi encontrado.');
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Data: ' + DateToStr(Date) + ' Hora: ' +
    TimeToStr(Time);
end;

end.
