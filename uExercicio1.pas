unit uExercicio1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

  {exercicio6}
  //----------------
  type
  TQuadrado = class
  private
    FLado: Double;
  public
    constructor Create(Lado: Double);
    procedure Desenhar;
    destructor Destroy; override;
  end;

  TCirculo = class
  private
    FRaio: Double;
  public
    constructor Create(Raio: Double);
    procedure Desenhar;
    destructor Destroy; override;
  end;
  //----------------

type
  TfrmExercicioSCI = class(TForm)
    btnExercicio1: TButton;
    btnExercicio2: TButton;
    btnExercicio3: TButton;
    btnExercicio4: TButton;
    btnExercicio5: TButton;
    btnExercicio6: TButton;
    procedure btnExercicio1Click(Sender: TObject);
    procedure btnExercicio2Click(Sender: TObject);
    procedure btnExercicio3Click(Sender: TObject);
    procedure btnExercicio4Click(Sender: TObject);
    procedure btnExercicio5Click(Sender: TObject);
    procedure btnExercicio6Click(Sender: TObject);
  private
    procedure CaloriasBiscoitos;
    procedure PercentualHomensMulheres;
    procedure VendaOvos;
    procedure ConversaoDeTempo;
    procedure AumentoSalarioPorCargo;
    procedure Exercicio6;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExercicioSCI: TfrmExercicioSCI;

implementation

{$R *.dfm}

{exercicio6}
constructor TQuadrado.Create(Lado: Double);
begin
  FLado := Lado;
end;

procedure TQuadrado.Desenhar;
begin
  ShowMessage('Desenhando um quadrado com lado: ' + FloatToStr(FLado));
end;

destructor TQuadrado.Destroy;
begin
  ShowMessage('Quadrado destruído.');
  inherited;
end;

constructor TCirculo.Create(Raio: Double);
begin
  FRaio := Raio;
end;

procedure TCirculo.Desenhar;
begin
  ShowMessage('Desenhando um círculo com raio: ' + FloatToStr(FRaio));
end;

destructor TCirculo.Destroy;
begin
  ShowMessage('Círculo destruído.');
  inherited;
end;

procedure TfrmExercicioSCI.Exercicio6;
var
  Quadrado: TQuadrado;
  Circulo: TCirculo;
begin
  Quadrado := TQuadrado.Create(5.0);
  Quadrado.Desenhar;
  FreeAndNil(Quadrado);

  Circulo := TCirculo.Create(3.0);
  Circulo.Desenhar;
  FreeAndNil(Circulo);
end;

//------------------------//

procedure TfrmExercicioSCI.btnExercicio1Click(Sender: TObject);
begin
  CaloriasBiscoitos;
end;

procedure TfrmExercicioSCI.btnExercicio2Click(Sender: TObject);
begin
  PercentualHomensMulheres;
end;

procedure TfrmExercicioSCI.btnExercicio3Click(Sender: TObject);
begin
  VendaOvos;
end;

procedure TfrmExercicioSCI.btnExercicio4Click(Sender: TObject);
begin
  ConversaoDeTempo;
end;

procedure TfrmExercicioSCI.btnExercicio5Click(Sender: TObject);
begin
  AumentoSalarioPorCargo;
end;

procedure TfrmExercicioSCI.btnExercicio6Click(Sender: TObject);
begin
  Exercicio6;
end;

procedure TfrmExercicioSCI.CaloriasBiscoitos;
var
  iBiscoitosConsumidos: Integer;
  fCaloriasPorBiscoito, fCaloriasConsumidas: Double;
  sEntrada: string;
begin
  try
    fCaloriasPorBiscoito := (300 * 10) / 40; // 300 calorias por porção, 10 porções em 40 biscoitos

    sEntrada := InputBox('Calorias Consumidas', 'Digite o número de biscoitos consumidos:', '0');
    if TryStrToInt(sEntrada, iBiscoitosConsumidos) then
    begin
      fCaloriasConsumidas := iBiscoitosConsumidos * fCaloriasPorBiscoito;
      ShowMessage('Você consumiu aproximadamente '
                  + FormatFloat('0.##', fCaloriasConsumidas) + ' calorias.');
    end
    else
    begin
      ShowMessage('Por favor, insira um número válido.');
      Exit;
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TfrmExercicioSCI.PercentualHomensMulheres;
var
  iNnumHomens, iNumMulheres, iTotal: Integer;
  fPercHomens, fPercMulheres: Double;
  sEntradaHomens, sEntradaMulheres: String;
begin
  try
    sEntradaHomens := InputBox('Cadastro de Alunos', 'Informe o número de homens na classe:', '0');
    if not TryStrToInt(sEntradaHomens, iNnumHomens) then
    begin
      ShowMessage('Por favor, insira um número válido para o número de homens.');
      Exit;
    end;

    sEntradaMulheres := InputBox('Cadastro de Alunos', 'Informe o número de mulheres na classe:', '0');
    if not TryStrToInt(sEntradaMulheres, iNumMulheres) then
    begin
      ShowMessage('Por favor, insira um número válido para o número de mulheres.');
      Exit;
    end;

    iTotal := iNnumHomens + iNumMulheres;
    if iTotal = 0 then
    begin
      ShowMessage('O total de alunos não pode ser zero.');
      Exit;
    end;

    fPercHomens := (iNnumHomens / iTotal) * 100;
    fPercMulheres := (iNumMulheres / iTotal) * 100;

    ShowMessage('Percentual de Homens: ' + FormatFloat('0.##', fPercHomens) + '%'
                + sLineBreak
                + 'Percentual de Mulheres: ' + FormatFloat('0.##', fPercMulheres) + '%');
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TfrmExercicioSCI.VendaOvos;
var
  iNumOvos, iDuzias, iOvosAvulsos: Integer;
  fPrecoDuzia, fPrecoUnidade, fValorTotal: Double;
  sEntrada: String;
begin
  try
    fPrecoDuzia := 3.25;
    fPrecoUnidade := 0.45;

    sEntrada := InputBox('Venda de Ovos', 'Informe o número de ovos vendidos:', '0');
    if not TryStrToInt(sEntrada, iNumOvos) then
    begin
      ShowMessage('Por favor, insira um número válido.');
      Exit;
    end;

    iDuzias := iNumOvos div 12;
    iOvosAvulsos := iNumOvos mod 12;
    fValorTotal := (iDuzias * fPrecoDuzia) + (iOvosAvulsos * fPrecoUnidade);

    ShowMessage('Detalhamento da compra:'
                + sLineBreak
                + IntToStr(iDuzias) + ' dúzia a R$ ' + FormatFloat('0.00', fPrecoDuzia) + ' por dúzia = R$ ' + FormatFloat('0.00', iDuzias * fPrecoDuzia)
                + sLineBreak
                + IntToStr(iOvosAvulsos) + ' ovo(s) avulso(s) a R$ ' + FormatFloat('0.00', fPrecoUnidade) + ' por unidade = R$ ' + FormatFloat('0.00', iOvosAvulsos * fPrecoUnidade)
                + sLineBreak
                + 'Total: R$ ' + FormatFloat('0.00', fValorTotal));
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TfrmExercicioSCI.ConversaoDeTempo;
var
  iSegundos: Integer;
  fMinutos, fHoras, fDias: Double;
  sEntrada: String;
begin
  try
    sEntrada := InputBox('Conversão de Tempo', 'Digite a quantidade de segundos:', '0');
    if not TryStrToInt(sEntrada, iSegundos) then
    begin
      ShowMessage('Por favor, insira um número válido.');
      Exit;
    end;

    fMinutos := iSegundos / 60;    // 1 minuto = 60 segundos
    fHoras := iSegundos / 3600;
    //fDias := iSegundos / 86400;
    fDias := iSegundos div 86400;

    if iSegundos >= 86400 then
    begin
      ShowMessage('A quantidade de segundos equivale a aproximadamente ' + FormatFloat('0.##', fDias) + ' dias.');
    end
    else
    begin
      if iSegundos >= 3600 then
        ShowMessage('A quantidade de segundos equivale a aproximadamente ' + FormatFloat('0.##', fHoras) + ' horas.')
      else
      begin
        if iSegundos >= 60 then
          ShowMessage('A quantidade de segundos equivale a aproximadamente ' + FormatFloat('0.##', fMinutos) + ' minutos.')
        else
          ShowMessage('A quantidade de segundos é menor que um minuto.');
      end;
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TfrmExercicioSCI.AumentoSalarioPorCargo;
var
  fSalarioAntigo, fSalarioNovo, fDiferenca: Double;
  iCodigoCargo: Integer;
  sCargo: String;
  iAumentoPercentual: Double;
begin
  try
    fSalarioAntigo := StrToFloat(InputBox('Aumento Salarial', 'Informe o salário atual do funcionário:', '0'));
    iCodigoCargo := StrToInt(InputBox('Aumento Salarial', 'Informe o código do cargo do funcionário:'
                                     + sLineBreak
                                     + '101 - Gerente'
                                     + sLineBreak
                                     + '102 - Engenheiro'
                                     + sLineBreak
                                     + '103 - Técnico'
                                     + sLineBreak
                                     + 'Outros - 40% de aumento', '0'));
    case iCodigoCargo of
      101:
        begin
          sCargo := 'Gerente';
          iAumentoPercentual := 0.10; // 10%
        end;
      102:
        begin
          sCargo := 'Engenheiro';
          iAumentoPercentual := 0.20; // 20%
        end;
      103:
        begin
          sCargo := 'Técnico';
          iAumentoPercentual := 0.30; // 30%
        end;
    else
      begin
        sCargo := 'Outro';
        iAumentoPercentual := 0.40; // 40%
      end;
    end;
    fSalarioNovo := fSalarioAntigo * (1 + iAumentoPercentual);
    fDiferenca := fSalarioNovo - fSalarioAntigo;

    ShowMessage('Cargo: ' + sCargo
                + sLineBreak
                + 'Salário antigo: R$ ' + FormatFloat('0.00', fSalarioAntigo)
                + sLineBreak
                + 'Novo salário: R$ ' + FormatFloat('0.00', fSalarioNovo)
                + sLineBreak
                + 'Diferença: R$ ' + FormatFloat('0.00', fDiferenca));
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

end.
