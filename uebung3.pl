%Gerichteter Graph:
%1
kante_gg(a, b).
kante_gg(a, e).
kante_gg(b, c).
kante_gg(b, f).
kante_gg(e, d).
kante_gg(e, f).
kante_gg(f, c).
kante_gg(g, d).
kante_gg(g, h).
kante_gg(h, f).

%2.0
%2.1
nachb3_gg(X,Y):-kante_gg(X,Y).
nachb3_gg(X,Y):-kante_gg(X,Z),kante_gg(Z,Y).
nachb3_gg(X,Q):-kante_gg(X,Z),kante_gg(Z,Y),kante_gg(Y,Q).

%2.2
pfad_gg(X,Y):-kante_gg(X,Y).
pfad_gg(X,Y):-kante_gg(X, Z), pfad_gg(Z,Y).

%3.0
%3.1
%pfad_gg2(g,c,P). P = [g, h, f, c].
pfad_gg2(X,Y,[X,Y]):-kante_gg(X,Y).
pfad_gg2(X,Y,[X|P]):-kante_gg(X,Z), pfad_gg2(Z,Y,P).

%3.2
%pfad_gg3(g,c,[g],P). P = [c, f, h, g]
%pfad_gg3(a,c,[a],P). P = [c, b, a] ; P = [c, f, b, a] ;P = [c, f, e, a] ;
pfad_gg3(X,Y,A,[Y|A]):- kante_gg(X,Y).
%pfad_gg3(X,Y,A,P):- kante_gg(X,Z),not(member(Z,A)),pfad_gg3(Z,Y,[Z|A],P).
pfad_gg3(X,Y,A,P):- kante_gg(X,Z),pfad_gg3(Z,Y,[Z|A],P).

%4
%4.1
%pfadz(g,c,[g],P). P=[c,b,a,d,g];P=[c,f,b,a,d,g];P=[c,f,e,a,d,g];P=[c,f,h,g]; P=[c,b,a,f,h,g];
%pfadz(a,a,[a],P). P=[a,f,b,a];P=[a,d,e,a];P=[a,f,e,a]
kante_zg(a, b).
kante_zg(a, e).
kante_zg(b, c).
kante_zg(b, f).
kante_zg(d, a).
kante_zg(e, d).
kante_zg(e, f).
kante_zg(f, a).
kante_zg(f, c).
kante_zg(g, d).
kante_zg(g, h).
kante_zg(h, f).

pfadz(X,Y,[X|R],[Y|[X|R]]):-kante_zg(X,Y).
pfadz(X,Y,A,P):- kante_zg(X,Z),not(member(Z,A)),pfadz(Z,Y,[Z|A],P). %Easier
%4.2

%5
kante_ug(b, o).
kante_ug(b, g).
kante_ug(o, g).
kante_ug(g, p).
kante_ug(o, p).
kante_ug(p, t).
kante_ug(p, c).
kante_ug(p, l).
kante_ug(c, l).
kante_ug(t, l).
connection(X,Y):-kante_ug(X,Y);kante_ug(Y,X).
pfad_ug(_,Y,[LAST|R],[Y|[LAST|R]]):-connection(Y,LAST).
pfad_ug(X,Y,[X|R],P):-connection(X, NEW),not(NEW==Y),not(member(NEW,R)),pfad_ug(NEW,Y,[NEW|[X|R]],P).

%5.1
nb(bayern, thueringen).
nb(bayern, badenwuerttemberg).
nb(bayern, sachsen).
nb(bayern, hessen).
nb(badenwuerttemberg, hessen).
nb(badenwuerttemberg, rheinlandpfalz).
nb(saarland, rheinlandpfalz).
nb(hessen, thueringen).
nb(sachsen, thueringen).
nb(sachsenanhalt, thueringen).
nb(hessen, niedersachsen).
nb(niedersachsen, nordrheinwestfalen).
nb(hessen, nordrheinwestfalen).
nb(sachsen, sachsenanhalt).
nb(sachsen, brandenburg).
nb(berlin, brandenburg).
nb(sachsenanhalt, brandenburg).
nb(mecklenburgvorpommern, brandenburg).
nb(sachsenanhalt, niedersachsen).
nb(hamburg, niedersachsen).
nb(bremen, niedersachsen).
nb(schleswigholstein, niedersachsen).
nb(mecklenburgvorpommern, niedersachsen).
nb(mecklenburgvorpommern, schleswigholstein).
nb(hamburg, schleswigholstein).


pp(X,Y):-nb(X,Y);nb(Y,X).
dbr(_,Y,[LAST|R],[Y|[LAST|R]]):-pp(Y,LAST).
dbr(X,Y,[X|R],P):-pp(X,NEW),not(NEW==Y),not(member(NEW,R)),dbr(NEW,Y,[NEW|[X|R]],P).

%5.2




