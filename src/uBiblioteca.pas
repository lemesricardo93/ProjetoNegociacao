unit uBiblioteca;

interface
uses
SysUtils, Forms, StdCtrls, Dialogs, Controls, IB, IBDatabase, DB, IBQuery,
  IBSQL, Mask,  Windows, ComCtrls, ExtCtrls, Grids, ExtDlgs,
    Math, IniFiles, Registry,  TLHelp32,
  StrUtils, Classes, ShellApi, System.IOUtils;

type
  TBiblioteca = class

  public
    function cnpj(s: string): boolean;
    function cpf(num: string): boolean;
    function EliminaCaracter(stext: string): string;
    function FormataCNPJ(cnpj: string): string;
  end;

implementation

{ TBiblioteca }

function TBiblioteca.cnpj(s: string): boolean;
var
  soma, dg1, dg2: integer;
  x: shortint;
  aux: string[1];
  aux_cnpj: string[14];
begin
  if (s = '') or (s = '  .   .   /    -  ') then
  begin
    result := true;
    exit;
  end;
  x := 1;
  aux_cnpj := '';
  while x < 19 do
  begin
    aux := copy(s, x, 1);
    if ((aux <> '.') and (aux <> '/') and (aux <> '-')) then
      aux_cnpj := aux_cnpj + aux;
    x := x + 1;
  end;
  s := aux_cnpj;
  soma := 0;
  inc(soma, (strtointdef(s[1], 0) * 5));
  inc(soma, (strtointdef(s[2], 0) * 4));
  inc(soma, (strtointdef(s[3], 0) * 3));
  inc(soma, (strtointdef(s[4], 0) * 2));
  inc(soma, (strtointdef(s[5], 0) * 9));
  inc(soma, (strtointdef(s[6], 0) * 8));
  inc(soma, (strtointdef(s[7], 0) * 7));
  inc(soma, (strtointdef(s[8], 0) * 6));
  inc(soma, (strtointdef(s[9], 0) * 5));
  inc(soma, (strtointdef(s[10], 0) * 4));
  inc(soma, (strtointdef(s[11], 0) * 3));
  inc(soma, (strtointdef(s[12], 0) * 2));

  dg1 := soma - ((soma div 11) * 11);

  if dg1 <= 1 then
    dg1 := 0
  else
    dg1 := 11 - dg1;

  soma := 0;
  soma := soma + strtointdef(s[1], 0) * 6;
  soma := soma + strtointdef(s[2], 0) * 5;
  soma := soma + strtointdef(s[3], 0) * 4;
  soma := soma + strtointdef(s[4], 0) * 3;
  soma := soma + strtointdef(s[5], 0) * 2;
  soma := soma + strtointdef(s[6], 0) * 9;
  soma := soma + strtointdef(s[7], 0) * 8;
  soma := soma + strtointdef(s[8], 0) * 7;
  soma := soma + strtointdef(s[9], 0) * 6;
  soma := soma + strtointdef(s[10], 0) * 5;
  soma := soma + strtointdef(s[11], 0) * 4;
  soma := soma + strtointdef(s[12], 0) * 3;
  soma := soma + 2 * dg1;

  dg2 := soma - ((soma div 11) * 11);

  if dg2 <= 1 then
    dg2 := 0
  else
    dg2 := 11 - dg2;

  if (inttostr(dg1) = s[13]) and (inttostr(dg2) = s[14]) then
    result := true
  else
    result := false;
end;

function TBiblioteca.cpf(num: string): boolean;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9, x: integer;
  d1, d2: integer;
  digitado, calculado, aux_cpf, aux: string;
begin
  if (num = '') or (num = '   .   .   -  ') then
  begin
    result := true;
    exit;
  end;
  x := 1;
  aux_cpf := '';
  while x < 19 do
  begin
    aux := copy(num, x, 1);
    if ((aux <> '.') and (aux <> '/') and (aux <> '-')) then
      aux_cpf := aux_cpf + aux;
    x := x + 1;
  end;
  num := aux_cpf;

  n1 := StrToInt(num[1]);
  n2 := StrToInt(num[2]);
  n3 := StrToInt(num[3]);
  n4 := StrToInt(num[4]);
  n5 := StrToInt(num[5]);
  n6 := StrToInt(num[6]);
  n7 := StrToInt(num[7]);
  n8 := StrToInt(num[8]);
  n9 := StrToInt(num[9]);
  d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9 + n1 * 10;
  d1 := 11 - (d1 mod 11);
  if d1 >= 10 then
    d1 := 0;
  d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 + n2 * 10 + n1 * 11;
  d2 := 11 - (d2 mod 11);
  if d2 >= 10 then
    d2 := 0;
  calculado := inttostr(d1) + inttostr(d2);
  digitado := num[10] + num[11];
  if calculado = digitado then
    result := true
  else
    result := false;
end;

function TBiblioteca.EliminaCaracter(stext: string): string;
var
  npos: integer;
begin
  result := '';
  npos := 1;
  while npos <= Length(sText) do
  begin
    if (stext[npos] = '.') or (stext[npos] = '-') or (stext[npos] = '/') or
      (stext[npos] = ')') or (stext[npos] = '(') or (stext[npos] = ',') then
    begin
      inc(npos);
    end
    else
    begin
      result := result + stext[npos];
      inc(npos);
    end;
  end;
end;

function TBiblioteca.FormataCNPJ(cnpj: string): string;
var
  sAux, sCNPJ: string;
begin
  sAux := EliminaCaracter(cnpj);
  case Length(sAux) of
    11:
      begin
        sCNPJ := copy(sAux, 1, 3) + '.' +
          copy(sAux, 4, 3) + '.' +
          copy(sAux, 7, 3) + '-' +
          copy(sAux, 10, 2);
        Result := sCNPJ;
      end;
    14:
      begin
        sCNPJ := copy(sAux, 1, 2) + '.' +
          copy(sAux, 3, 3) + '.' +
          copy(sAux, 6, 3) + '/' +
          copy(sAux, 9, 4) + '-' +
          copy(sAux, 13, 2);
        Result := sCNPJ;
      end;
  else
    result := '';
  end;
end;

end.
