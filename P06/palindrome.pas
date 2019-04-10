{ NIM/Nama	: 16518332/Dhafin Rayhan Ahmad }
{ Tanggal	: 10 April 2019 }



Program palindrome;
{ Membaca masukan sebuah integer, masukan character sebanyak integer tersebut, 
  kemudian menuliskannya bila ada dan memeriksa apakah palindrom atau bukan }



{ KAMUS UMUM }
const
	NMax = 100;
type
	TabChar = record
		Tab : array [1..NMax] of char;
		Neff : integer; { nilai efektif }
	end;
var
	T1 : TabChar;



{ FUNGSI DAN PROSEDUR}

procedure BacaTabChar (var T : TabChar);
{ I.S. : sebuah TabChar }
{ F.S. : TabChar sudah memiliki Neff dan isi elemen-elemen Tab }
{ KAMUS LOKAL }
var
	i : integer;
{ ALGORITMA LOKAL }
begin
	readln(T.Neff); { asumsi valid }
	if T.Neff > 0 then
	begin
		{ Skema pengulangan berdasarkan pencacah }
		for i := 1 to T.Neff do
		begin
			readln(T.Tab[i]);
		end;
	end;
end;

function IsPalindrome (T : TabChar) : boolean;
{ Mengembalikan true apabila Tab pada suatu TabChar palindrome }
{ KAMUS LOKAL }
var
	palindrom : boolean;
	i : integer;
{ ALGORITMA }
begin
	palindrom := true; i := 1; { inisiasi }
	while palindrom and (i <= (T.Neff div 2)) do
	begin
		if T.Tab[i] <> T.Tab[T.Neff-i+1] then
		begin
			palindrom := false;
		end;
		i := i + 1;
	end;
	IsPalindrome := palindrom;
end;

procedure TulisTabChar (T : TabChar);
{ I.S. : sebuah TabChar }
{ F.S. : semua elemen Tab pada TabChar tertulis di layar }
{ KAMUS LOKAL }
var
	i : integer;
{ ALGORITMA }
begin
	{ Skema pengulangan berdasarkan pencacah }
	for i := 1 to T.Neff do
	begin
		write(T.Tab[i]);
	end;
	writeln();
end;



{ ALGORITMA UMUM }
begin
	BacaTabChar(T1);
	if T1.Neff > 0 then
	begin
		TulisTabChar(T1);
		if IsPalindrome(T1) then
		begin
			writeln('Palindrom');
		end else
		begin
			writeln('Bukan palindrom');
		end;
	end else { T1.Neff = 0 }
	begin
		writeln('Array kosong');
	end;
end.
