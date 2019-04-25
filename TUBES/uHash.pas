unit uHash;
{ Unit yang mengandung fungsi-fungsi dan prosedur-prosedur
  untuk melakukan hashing pada password }


interface
    uses uType;

    { KAMUS }
    type
        hashTab = array[0..255] of integer; { tabel untuk fungsi hash }
        transTab = array[0..11531] of string; { tabel untuk fungsi translate }
        groupTab = record
            h1, h2, h3, h4 : hashTab;
            t : transTab;
        end;
    var
        gTA, gTB : groupTab;

    { FUNGSI DAN PROSEDUR}
    procedure generate (var gTA : groupTab; var gTB : groupTab);
    function secure (s : string; gTA, gTB : groupTab) : string;


implementation
    { FUNGSI DAN PROSEDUR }
    function map (x : integer) : string;
    { Menerima integer pada range [0,61] kemudian menjadikannya sebuah angka / huruf besar / huruf kecil }
    var
        imap : integer;
    begin
        if (x < 10) then
        begin
            imap := x + 48;
        end else if (x < 36) then
        begin
            imap := x + 55;
        end else
        begin
            imap := x + 61;
        end;
        map := chr(imap);
    end;

    procedure fill_shuffle (var T : hashTab; seed : integer);
    { I.S. : sebuah tabel 'hashTab' }
    { F.S. : tabel terisi dengan bilangan 0-255 secara pseudo-acak }
    var
        i, pointer : integer;
    begin
        for i := 0 to 255 do
        begin
            T[i] := 0;
        end;
        i := 1;
        pointer := ((seed * i) mod 256);
        while i < 256 do
        begin
            if T[pointer] = 0 then
            begin
                T[pointer] := i;
                i := i + 1;
                pointer := (seed * i) mod 256;
            end else
            begin
                pointer := (pointer + 1) mod 256;
            end;
        end;
    end;

    procedure fill_shuffle (var T : transTab; seed : integer);
    { I.S. : sebuah tabel 'transTab' }
    { F.S. : tabel terisi dengan bilangan 0-10139 secara pseudo-acak }
    var
        ref : transTab;
        i, j, pointer : integer;
    begin
        for i := 0 to 255 do
        begin
            T[i] := '';
        end;
        for i := 0 to 61 do
        begin
            for j := 0 to 185 do
            begin
                ref[i * 186 + j] := map(i);
            end;
        end;
        for i := 0 to 185 do
        begin
            for j := 0 to 61 do
            begin
                ref[i * 62 + j] := ref[i * 62 + j] + map(i mod 62);
            end;
        end;
        for i := 0 to 3843 do
        begin
                ref[i * 3] := ref[i * 3] + ref[(i*(seed+40)+2) mod 11532][2];
                ref[i * 3 + 1] := ref[i * 3 + 1] + ref[(i*(seed-40)+2) mod 11532][2];
        end;

        i := 1;
        pointer := ((seed * i) mod 11532);
        while i < 11532 do
        begin
            if T[pointer] = '' then
            begin
                T[pointer] := ref[i];
                i := i + 1;
                pointer := (seed * i) mod 11532;
            end else
            begin
                pointer := (pointer + 1) mod 11532;
            end;
        end;
    end;

    function hash (s : string; T1, T2 : hashTab) : integer;
    { Membuat hashing 8-bit dengan turunan dari 'Pearson hashing' }
    { IDE: Teknik 'Pearson hashing' (https://dl.acm.org/citation.cfm?id=78978) dan sebuah jawaban dari
           pengguna stackexchange 'Paul Uszak' (https://crypto.stackexchange.com/users/23115/paul-uszak) }
    { CATATAN: Penggunaan hashing dibatasi sampai 8-bit saja karena menyesuaikan dengan materi kuliah yang
               menggunakan Free Pascal sebagai compiler dan integer sebagai type bilangan bulat yang dipakai }
    var
      h, h1, h2, i : integer;
    begin
        h1 := 0; h2 := 0;
        for i := 1 to length(s) do
        begin
            h1 := T1[h1 xor ord(s[i])];
            h2 := T2[h2 xor ord(s[i])];
        end;
        h := h1 xor h2;
        hash := h;
    end;

    function translate (x : string; tT : transTab) : string;
    { Men-translate string bilangan 4-digit menjadi string 3-char }
    { CATATAN : Fungsi ini idak mengurangi collision, namun
                hanya mempersulit readability secara natural }
    begin
        translate := tT[strToInt(x)];
    end;

    function superhash (s : string; gT : groupTab) : string;
    { Menggabungkan hasil tiga kali hashing terhadap sebuah string dengan cara khusus tapi sederhana }
    var
        hh1, hh2, hh3, hh4 : integer; { hasil hashing }
        preSH, pS1, pS2, pS3 : string; { hasil operasi sederhana pada hasil hashing }
    begin
        hh1 := hash(s, gT.h3, gT.h4);
        hh2 := hash(s, gT.h2, gT.h1);
        hh3 := hash(s, gT.h3, gT.h1);
        hh4 := hash(s, gT.h2, gT.h4);
        preSH := zPad(hh1 + hh3, 3) + zPad(hh2 + hh4, 3) + zPad(hh2 + hh3, 3) + zPad(hh1 + hh4, 3);
        pS1 := preSH[1]+preSH[2]+preSH[3]+preSH[4];
        pS2 := preSH[5]+preSH[6]+preSH[7]+preSH[8];
        pS3 := preSH[9]+preSH[10]+preSH[11]+preSH[12];
        superhash := translate(pS1, gT.t) + translate(pS2, gT.t) + translate(pS3, gT.t);
    end;

    procedure generate (var gTA : groupTab; var gTB : groupTab);
    begin
        { Mengisi tabel hashing dan tabel translate untuk Proses A (proses pertama) }
        fill_shuffle(gTA.h1, 353); fill_shuffle(gTA.h2, 1019); fill_shuffle(gTA.h3, 691); fill_shuffle(gTA.h4, 2027);
        fill_shuffle(gTA.t, 347);
        { Mengisi tabel gTA.hshing dan tabel translate untuk Proses B (proses kedua) }
        fill_shuffle(gTB.h1, 1291); fill_shuffle(gTB.h2, 823); fill_shuffle(gTB.h3, 1091); fill_shuffle(gTB.h4, 457);
        fill_shuffle(gTB.t, 389);
        { CATATAN: Dilakukan 2 proses yang kemudian hasil keduanya dikonkatenasi. Langkah ini tidak signifikan terhadap
                   pengurangan collision, namun diharapkan mengurangi collision meskipun ada kemungkinan collision juga
                   bertambah dari sis lain. Namun, langkah ini bermanfaat untuk menambah dan memvariasikan panjang hashing }
    end;

    function secure (s : string; gTA, gTB : groupTab) : string;
    { Melakukan superhash dua kali lalu mengkonkatenasi kedua hasilnya }
    { CATATAN : merupakan fungsi utama yang akan dipakai di program }
    begin
        secure := superhash(s, gTA) + superhash(s, gTB);
    end;

end.
