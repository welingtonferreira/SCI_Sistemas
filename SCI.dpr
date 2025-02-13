program SCI;

uses
  Forms,
  uExercicio1 in 'uExercicio1.pas' {frmExercicioSCI};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmExercicioSCI, frmExercicioSCI);
  Application.Run;
end.
