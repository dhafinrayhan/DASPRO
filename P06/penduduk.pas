{ NIM/Nama	: 16518332/Dhafin Rayhan Ahmad }
{ Tanggal	: 10 April 2019 }

Program penduduk;
{ Menerima masukan sebuah integer N yang menyatakan jumlah desa 
  dan N buah integer yang menyatakan jumlah penduduk masing-masing 
  desa kemudian menghitung total penduduk }

{ KAMUS }
var
	N, i, pend, total : integer;

{ ALGORITMA }
begin
	readln(N); { masukan N, asumsi valid }
	total := 0; { inisiasi }
	{ Skema pengulangan berdasarkan jumlah pengulangan }
	for i := 1 to N do
	begin
		readln(pend); { masukan penduduk sebuah desa, asumsi valid }
		total := total + pend;
	end;
	{ Menampilkan total penduduk semua desa }
	writeln(total);
end.
