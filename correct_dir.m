function str_out =correct_dir(str_dir)
%correct_dir(str_dir) jako argument potrzebuje œcie¿ki pliku z b³êdami,
%czyli s¹ pominiête zera
src=str_dir;
nr=1;
%000000000111111111122222222
%123456789012345678901234567
%2019_11_21_13_52_26.115.png
while  (src(nr)~='_')
    nr=nr+1;
end
p1=nr;
nr=nr+1;
while  (src(nr)~='_')
    nr=nr+1;
end
p2=nr;
nr=nr+1;
while  (src(nr)~='_')
    nr=nr+1;
end
p3=nr;
nr=nr+1;
while  (src(nr)~='_')
    nr=nr+1;
end
p4=nr;
nr=nr+1;
while  (src(nr)~='_')
    nr=nr+1;
end
p5=nr;
nr=nr+1;
while  (src(nr)~='.')
    nr=nr+1;
end
k1=nr;
nr=nr+1;
while  (src(nr)~='.')
    nr=nr+1;
end
k2=nr;
w=src(1:5);
  if p2==p1+2 %jedno cyfrowy miesiac
    w(6)='0';
    w(7)=src(p1+1);
    w(8)=src(p1+2);
  else % jest ok
      w(6:8)=src(p1+1:p1+3);
  end
  if p3==p2+2 %jednocyfrowy dzien
    w(9)='0';
    w(10)=src(p2+1);
    w(11)=src(p2+2);
  else
      w(9:11)=src(p2+1:p2+3);
  end
  if p4==p3+2 %jednocyfrowa godzina
    w(12)='0';
    w(13)=src(p3+1);
    w(14)=src(p3+2);
  else
      w(12:14)=src(p3+1:p3+3);
  end
  if p5==p4+2 %jednocyfrowa minuta
    w(15)='0';
    w(16)=src(p4+1);
    w(17)=src(p4+2);
  else
    w(15:17)=src(p4+1:p4+3);
  end
  if k1==p5+2 %jednocyfrowa sekunda
    w(18)='0';
    w(19)=src(p5+1);
    w(20)=src(p5+2);
  else
      w(18:20)=src(p5+1:p5+3);
  end
  if k2==k1+2 %jednocyfrowa milisekunda - chyba tutaj trzeba zrobiæ inacze
      %-nale¿y zera doisaæ do koñca, a nie do pocz¹tku.
    w(21)=src(k1+1);  
    w(22)='0';
    w(23)='0';
    w(24)='.';
    w(25)='p';
    w(26)='n';
    w(27)='g';
  elseif k2==k1+3 %dwucyfrowa milisekunda - chyba tutaj trzeba zrobiæ inaczej
    %-nale¿y zera dopisaæ do koñca, a nie do pocz¹tku.
    w(21)=src(k1+1);
    w(22)=src(k1+2);
    w(23)='0';
    w(24)='.';
    w(25)='p';
    w(26)='n';
    w(27)='g';
  else
      w(21:27)=src(k1+1:k1+7);
  end      
  str_out=w;
end

