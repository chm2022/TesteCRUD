unit Ufuncoes;

interface

uses
  Vcl.ComCtrls, ACBrCEP, SysUtils, Vcl.Forms,Vcl.dialogs,
  Vcl.Grids, Vcl.DBGrids, Winapi.Windows, FireDAC.Comp.Client,  Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Graphics, DateUtils, Vcl.DBCtrls, Vcl.FileCtrl,Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtDlgs, Data.DB, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, System.Types, System.Classes,
  System.Variants, IdHashMessageDigest,
  SWHDBEdit,
  SWHEdit,
  SWHComboBox,
  SWHDBComboBox,
  SWHDBLookupComboBox,
  SWHMaskEdit,
  CMEdit,
  umensagens;


  Function Mensagem ( Titulo, Mensagem, TipoMensagem :String ): boolean;
  function Somente_numeros( AString: String): String;
  function Codifica(Action, Src: String): String;
  function ValidaCampos(Campos: array of TComponent; NumCampos: Integer): Boolean;
  procedure AjustaDrawColumnCell( Sender: TObject; const Rect: TRect;DataCol: Integer;
                                  Column: TColumn; State: TGridDrawState);
  procedure AjustaTamanhoLinha( dbg: TDBGrid; Tamanho: Integer);
  procedure PintarTituloColunaGrid( Sender: TObject; Coluna : TColumn );
  function GetId(Campo, Tabela : String) : Integer;
  function ValidaData( const Data: String ): String;
  function TiraAcentos(const Texto: ANSIString): ANSIString;

type

  TDBGridPadrao = class(TCustomGrid);

implementation

uses UDM;

function Somente_numeros(AString: String): String;
var
  I : Integer;
  Limpos : String;
begin
  Limpos := '';
  for I := 1 to Length(AString) do
  begin
    if Pos(Copy(AString, I, 1), '0123456789') <> 0 then
      Limpos := Limpos + Copy(AString, i, 1);
  end;
  Result := Limpos;
end;

function Remove_caracteres( AString: String): String;
var
  I : Integer;
  Limpos : String;
begin
  Limpos := '';
  for I := 1 to Length(AString) do
  begin
    if Pos ( Copy( AString, I, 1 ), '"!%$#@&¨*().,;:/<>[]{}=+-_\|') = 0 then
      Limpos := Limpos + Copy(AString, i, 1);
  end;
  Result := Limpos;
end;

Function Mensagem ( Titulo, Mensagem, TipoMensagem :String ): boolean;
begin
  Result := False;
  try
    frm_mensagens           := Tfrm_mensagens.Create(nil);
    frm_mensagens.sTitulo   := Titulo;
    frm_mensagens.sMensagem := Mensagem;
    frm_mensagens.sTipo     := TipoMensagem;
    frm_mensagens.ShowModal;
  finally
    Result := frm_mensagens.bRespostaMensagem;
    frm_mensagens.DisposeOf;
  end;
end;

function Codifica(Action, Src: String): String;
  Label Fim;
var
  KeyLen : Integer;
  KeyPos : Integer;
  OffSet : Integer;
  Dest, Key : String;
  SrcPos : Integer;
  SrcAsc : Integer;
  TmpSrcAsc : Integer;
  Range : Integer;
begin
  if (Src = '') Then
    begin
      Result:= '';
      Goto Fim;
    end;
  Key:='YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
    begin
      Randomize;
      OffSet := Random(Range);
      Dest := Format('%1.2x',[OffSet]);
      for SrcPos := 1 to Length(Src) do
        begin
          Application.ProcessMessages;
          SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
          if KeyPos < KeyLen then
            KeyPos := KeyPos + 1
          else
            KeyPos := 1;
          SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
          Dest := Dest + Format('%1.2x',[SrcAsc]);
          OffSet := SrcAsc;
        end;
    end
  else
    if (Action = UpperCase('D')) then
      begin
        OffSet := StrToInt('$'+ copy(Src,1,2));
        SrcPos := 3;
        repeat
          SrcAsc := StrToInt('$'+ copy(Src,SrcPos,2));
          if (KeyPos < KeyLen) Then
            KeyPos := KeyPos + 1
          else
            KeyPos := 1;
          TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
          if TmpSrcAsc <= OffSet then
            TmpSrcAsc := 255 + TmpSrcAsc - OffSet
          else
            TmpSrcAsc := TmpSrcAsc - OffSet;
          Dest := Dest + Chr(TmpSrcAsc);
          OffSet := SrcAsc;
          SrcPos := SrcPos + 2;
        until (SrcPos >= Length(Src));
      end;
  Result:= Dest;
 Fim:
end;

function ValidaCampos(Campos: array of TComponent; NumCampos: Integer): Boolean;
var
   i : Integer;
begin
  Result := True;
  //---
  for i := 0 to NumCampos -1 do
  begin
    //---
    if (Campos[i] is TEdit) then
      begin
        //---
        if (Campos[i] as TEdit).Text = EmptyStr then
          begin
           (Campos[i] as TEdit).SetFocus;
           (Campos[i] as TEdit).Color := $00D2CDFE;
            mensagem('AVISO DE CAMPO OBRIGATÓRIO',
                     'O campo ' +  ( (Campos[i] as TEdit).Hint) + ' é Obrigatório',
                     'INFORMACAO' );
            Result := False;

            Exit;
          end
        else
         (Campos[i] as TEdit).Color := clwhite;
      end;
      //--------------------------------------------------------------------
      if (Campos[i] is TMaskEdit) then
        begin
         if (Campos[i] as TMaskEdit).Text = '  /  /    ' then
           begin
             (Campos[i] as TMaskEdit).SetFocus;
             (Campos[i] as TMaskEdit).Color := $00D2CDFE;
              mensagem('AVISO DE CAMPO OBRIGATÓRIO',
                       'O campo ' +  ( (Campos[i] as TEdit).Hint) + ' é Obrigatório',
                       'INFORMACAO' );
             Result := False;
             Exit;
           end
         else
           (Campos[i] as TMaskEdit).Color := clwhite;
        end;
      //--------------------------------------------------------------------
      if (Campos[i] is TDBLookupCombobox) then
        begin
         if (Campos[i] as TDBLookupCombobox).Text = '' then
           begin
             (Campos[i] as TDBLookupCombobox).SetFocus;
             (Campos[i] as TDBLookupCombobox).Color := $00D2CDFE;
             mensagem('AVISO DE CAMPO OBRIGATÓRIO',
                      'O campo ' +  ( (Campos[i] as TEdit).Hint) + ' é Obrigatório',
                      'INFORMACAO' );
             Result := False;
             Exit;
           end
         else
           (Campos[i] as TDBLookupCombobox).Color := clwhite;
        end;
      //--------------------------------------------------------------------
      if (Campos[i] is TCombobox) then
        begin
          if (Campos[i] as TCombobox).Text = '' then
            begin
              (Campos[i] as TCombobox).SetFocus;
              (Campos[i] as TCombobox).Color := $00D2CDFE;
               mensagem('AVISO DE CAMPO OBRIGATÓRIO',
                       'O campo ' +  ( (Campos[i] as TEdit).Hint) + ' é Obrigatório',
                       'INFORMACAO' );
               Result := False;

               Exit;
            end
          else
           (Campos[i] as TCombobox).Color := clwhite;
        end;
      //--------------------------------------------------------------------
   end;
end;

procedure AjustaDrawColumnCell( Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  //zebrando o dbgrid
  if Odd( ( Sender as TDbgrid ).DataSource.DataSet.RecNo) then
    ( Sender as TDbgrid ).Canvas.Brush.Color :=  $00FBFBFB
  else
    ( Sender as TDbgrid ).Canvas.Brush.Color := clwhite;
 //mudando a cor da seleção
  if ( gdSelected in State ) then
  begin
    ( Sender as TDbgrid ).Canvas.Brush.Color := $00FFE8CC;
    ( Sender as TDbgrid ).Canvas.Font.Color  := clBlack;
    ( Sender as TDbgrid ).Canvas.Font.Style  := [fsBold];
  end;
  ( Sender as TDbgrid ).Canvas.FillRect(Rect);
  ( Sender as TDbgrid ).DefaultDrawColumnCell( Rect, DataCol, Column, State);
  //-- Alinhar campos do Grid
   case datacol of
      0 : ( Sender as TDbgrid ).Canvas.TextRect( Rect, Rect.Left + 40, Rect.Top + 18, Column.Field.DisplayText );
      //1,2,3: ( Sender as TDbgrid ).Canvas.TextRect( Rect, Rect.Left + 10, Rect.Top + 10, Column.Field.DisplayText );
    else
      // Mantem posicao para o restante da colunas do grid
      ( Sender as TDbgrid ).Canvas.TextRect( Rect, Rect.Left + 8, Rect.Top + 18, Column.Field.DisplayText);
   end;
end;

procedure AjustaTamanhoLinha (dbg: TDBGrid; Tamanho: Integer);
begin
  TDBGridPadrao(dbg).DefaultRowHeight := tamanho;
  TDBGridPadrao(dbg).ClientHeight     := ( tamanho * TDBGridPadrao(dbg).RowCount ) + tamanho;
  TDBGridPadrao(dbg).RowHeights[0] := tamanho;
end;

function GetId(Campo, Tabela : String) : Integer;
var
  qry : TFDQuery;
begin
  Qry := TFDQuery.Create(Nil);
  //---
  try
    Qry.Connection := DM.Conn;
    Qry.Close;
    Qry.SQL.Clear;
    qry.Sql.Add('SELECT MAX ('+Campo+') FROM '+Tabela);
    qry.Open;
    //---
    Result := qry.Fields[0].AsInteger + 1;
  finally
     FreeAndNil(Qry);
   end;
end;

procedure PintarTituloColunaGrid( Sender: TObject; Coluna : TColumn );
var
  i:Integer;
begin
  for I := 0 to ( Sender as TDbgrid ).Columns.Count - 1  do
  begin
    if ( Sender as TDbgrid ).Columns[i].FieldName = Coluna.FieldName then
    begin
      ( Sender as TDbgrid ).Columns[i].Title.Font.Color := clRed;
      ( Sender as TDbgrid ).Columns[i].Title.Font.Style := [fsBold];
    end else
    begin
      ( Sender as TDbgrid ).Columns[i].Title.Font.Color := $00626262;
      ( Sender as TDbgrid ).Columns[i].Title.Font.Style := [];
    end;
  end;
end;

function ValidaData( const Data: String ): String;
begin
  Result:= '';
  try
    if Data = '  /  /    ' then
       exit;
    Result := DateToStr( Strtodate(  Data ) );
  except
    mensagem('Data Inválida',
             'Data Digitada Inválida',
             'ERRO' );
    Abort;
  end;
end;

function TiraAcentos(const Texto: ANSIString): ANSIString;
const
  Acentos   = 'áéíóúÁÉÍÓÚàèìòùÀÈÌÒÙäëïöüÄËÏÖÜãõÃÕâêîôûÂÊÎÔÛçÇñÑ';
  Normais   = 'aeiouAEIOUaeiouAEIOUaeiouAEIOUaoAOaeiouAEIOUcCnN';
var
  a: Integer;
begin
  Result := '';
  for a := 1 to Length(Texto) do
    if Pos(Texto[a], Acentos) > 0 then
      Result := Result + Normais[Pos(Texto[a], Acentos)]
    else
      Result := Result + Texto[a];
end;

end.
