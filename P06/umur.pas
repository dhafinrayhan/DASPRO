{ NIM/Nama	: 16518332/Dhafin Rayhan Ahmad }
{ Tanggal	: 10 April 2019 }

Program umur;
{ Membaca data 20 umur peserta, menuliskan kembali semuanya dengan 
  indeks, menuliskan umur tertinggi dan umur terendah }

{ KAMUS }
type
	myArr = array[1..20] of integer;
var
	arrUmur : myArr;
	tertinggi, terendah, i : integer;

{ ALGORITMA }
begin
	{ Skema pengulangan berdasarkan pencacah }
	for i := 1 to 20 do
	begin
		readln(arrUmur[i]);
		{ Skema pencarian nilai ekstrim }
		if i = 1 then
		begin
			tertinggi := arrUmur[i];
			terendah := arrUmur[i];
		end else { i > 1 }
		begin		
			if tertinggi < arrUmur[i] then
			begin
				tertinggi := arrUmur[i];
			end;
			if terendah > arrUmur[i] then
			begin
				terendah := arrUmur[i];
			end;
		end;
	end;
	{ Menampilkan hasil }
	{ Skema pengulangan berdasarkan pencacah }
	for i := 1 to 20 do
	begin
		writeln('[P', i, ']', arrUmur[i]);
	end;
	writeln('Tertinggi = ', tertinggi);
	writeln('Terendah = ', terendah);
end.
