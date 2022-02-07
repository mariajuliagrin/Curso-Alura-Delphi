unit unitContatos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Vcl.StdCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    txtID: TEdit;
    txtEmail: TEdit;
    txtNome: TEdit;
    txtTelefone: TEdit;
    txtObs: TMemo;
    FDConnection1: TFDConnection;
    tbContatos: TFDTable;
    DataSource1: TDataSource;
    btNovo: TButton;
    btSalvar: TButton;
    btProximo: TButton;
    btAnterior: TButton;
    btEdit: TButton;
    btDelete: TButton;
    btCancelar: TButton;
    txtProcura: TEdit;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    foto: TImage;
    SpeedButton2: TSpeedButton;
    OpenDialog1: TOpenDialog;
    procedure carrega;
    procedure limpa;
    procedure bloqueia;
    procedure FormCreate(Sender: TObject);

    procedure btProximoClick(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure tbContatosBeforePost(DataSet: TDataSet);
    procedure btDeleteClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
var
  estado : integer;
procedure TForm2.bloqueia;
begin

  txtNome.Enabled := not txtNome.Enabled;
  txtTelefone.Enabled := not txtTelefone.Enabled;
  txtEmail.Enabled := not txtEmail.Enabled;
  txtObs.Enabled := not txtObs.Enabled;
end;
procedure TForm2.limpa;
begin
  txtId.Text := '';
  txtNome.Text := '';
  txtTelefone.Text := '';
  txtEmail.Text := '';
  txtObs.Text := '';
  txtNome.SetFocus;
end;
procedure TForm2.SpeedButton1Click(Sender: TObject);
begin


  if not tbContatos.FindKey([txtProcura.Text]) then
    begin
       ShowMessage('Não encontrado!');
    end
  else
    carrega;

end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
      openDialog1.Execute;
      foto.Picture.LoadFromFile(openDialog1.FileName);
      tbContatos.Edit;
      tbcontatos.FieldByName('foto').Value :=  openDialog1.FileName;
      tbContatos.Post;
      end;

procedure TForm2.tbContatosBeforePost(DataSet: TDataSet);
begin
      tbContatos.FieldByName('nome').Value := txtNome.Text;
      tbContatos.FieldByName('telefone').Value := txtTelefone.Text;
      tbContatos.FieldByName('email').Value := txtEmail.Text;
      tbContatos.FieldByName('observacoes').Value := txtObs.Text;
end;

procedure TForm2.btAnteriorClick(Sender: TObject);
begin
  tbContatos.Prior;
  carrega;
end;

procedure TForm2.btCancelarClick(Sender: TObject);
begin
limpa;
if estado = 1 then
  begin
    tbContatos.Prior;
  end;
carrega;
bloqueia;
estado :=0;
end;

procedure TForm2.btDeleteClick(Sender: TObject);
begin
tbContatos.Delete;
carrega;
end;

procedure TForm2.btEditClick(Sender: TObject);
begin
bloqueia;
        tbContatos.Edit;
end;

procedure TForm2.btNovoClick(Sender: TObject);
begin
     tbContatos.Insert;
     bloqueia  ;
     limpa;
     estado :=1;
end;

procedure TForm2.btProximoClick(Sender: TObject);
begin
 tbContatos.Next;
 carrega;
end;

procedure TForm2.btSalvarClick(Sender: TObject);
begin
tbContatos.Post;
bloqueia;
ShowMessage('Dados gravados com sucesso!');

end;

procedure TForm2.carrega;
begin
  txtId.Text := tbContatos.FieldByName('id').Value;
  txtNome.Text := tbContatos.FieldByName('nome').Value;
  txtTelefone.Text := tbContatos.FieldByName('telefone').Value;
  txtEmail.Text := tbContatos.FieldByName('email').Value;
  if tbContatos.FieldByName('observacoes').Value = NULL then
    txtObs.Text := ''
  else
    txtObs.Text := tbContatos.FieldByName('observacoes').Value;

  if tbContatos.FieldByName('foto').Value <> Null then
   begin
     if fileexists(tbContatos.FieldByName('foto').Value) then
      begin
          foto.Picture.LoadFromFile(tbContatos.FieldByName('foto').Value);

      end;
   end
   else
      foto.Picture:=nil;



  end;
procedure TForm2.DBGrid1DblClick(Sender: TObject);
begin
   carrega;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 carrega;
end;

end.
