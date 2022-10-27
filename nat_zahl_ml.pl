/*============================================================================*/
/* Übung 2: Ziel der Übung ist die Behrrschung der Rekursion und  Benutzung   */
/* von Funktoren zur Konstruktion von Datenstrukturen                         */
/*============================================================================*/
/* Natürliche Zahlen können als rekursive Datenstruktur dargestellt werden.   */
/* Die Benutzung einer rekursiven Datenstruktur gegenüber einer iterativen    */
/* hat für die Definition von Prädikaten für diese Zahlen folgende Vorteile:  */
/* 1. Inferenz wird durch Unifikation ersetzt - Effizienzgewinn               */
/* 2. Die Anzahl der Unterziele der rechten Regelseiten ist geringer          */
/* 3. Dadurch sind mehr Fließmuster möglich inklusive Invertierung            */
/* 4. Invertierung ist unbegrenzt nur bei einem Unterziel möglich             */
/* 5. Endlosschleifen nach der wersten Lösung können durch ! vermieden        */
/*    werden.                                                                 */
/*----------------------------------------------------------------------------*/
/* Die rekursive Definition der Natürliche Zahlen lautet:                     */
/*                                                                            */
/* Einfacher Sonderfall: Null ist eine natürliche Zahl                        */
/* Rekursiver Fall:      Jeder Nachfolger einer natürlichen Zahl ist eine     */
/*                       natürliche Zahl                                      */
/*                                                                            */
/* Null wird in Prolog als parameterloser Funktor (Konstante) darsgestellt.   */
/* Die Nachfolgerrelation wird als einstelliger Funktor darsgestellt.  Als    */
/* Funktorname benutzen wir "null" für Null und "s" für Nachfolger. Das sind  */
/* nutzerdefinierte Namen -  kann auch beliebigen andere Namen verwenden.     */
/* Beispiele für solche Zahlen:                                               */
/*                                                                            */
/*               Funktordarstellung | Dezimaldarstellung                      */
/*               ===================|===================                      */
/*                      null        |         0                               */
/*               s(s(s(s(s(null)))))|         5                               */
/*                                                                            */
/*============================================================================*/
/* Ausgehend von dieser Definition kann ein Prädikat zur Überprüfung, ob sein */
/* Argument eine Natürliche Zahl ist, wie folgt definiert werden:             */
/*----------------------------------------------------------------------------*/
% natur(X):- X ist eine natürliche Zahl
/*----------------------------------------------------------------------------*/
  natur(null).
  natur(s(X)):-natur(X).
/*----------------------------------------------------------------------------*/
% natur(s(s(null))).     % -> yes
% natur(Z).              %Z=null;Z=s(null);Z=s(s(null));Z=s(s(s(null)));Z=s(s(s(s(null))))
%                         Ist auch als generator geeignet - begrenzung erforderlich
/*----------------------------------------------------------------------------*/
/* Definieren Sie folgende Prädikate:                                         */
/*============================================================================*/
% add(X,Y,Z):- X und Y sind natürliche Zahlen, für die gilt  Z=X+Y.
% mal(X,Y,Z):-X,Y,Z sind solche nat. Zahlen, daß X*Y=Z ist.
% potenz(X,N,Y):-X,N,Y sind solche nat. Zahlen, daß Y=X^N ist.
% kl_gl(X,Y):- X und Y sind natürliche Zahlen, für die gilt X =< Y.
% zwischen(U,O,Z):- Z ist eine natürliche Zahl zwischen U(nterer Grenze)
%                   und O(berer Grenze) inclusive.
%                   Verwendung von 1 Prädikat kl_gl in jeder Klausel
% fakultaet(N,F):- F = N!    natürliche Zahlen   Umkehrbar - eine Lösung dann aber Stacküberlauf
% minrek(X,Y,Min):-Min ist das Minimum der nat. Zahlen X und Y.
% maxrek(X,Y,Max):-Max ist das Minimum der nat. Zahlen X und Y.
% mod(X,Y,Z):- Z ist der Rest der Integer Division von X durch Y.
% gcd(X,Y,Z):-Z ist der größte gemeinsame Teiler der nat. Zahlen X, Y.
% konv(R,AR,AD,D):-R ist eine nat. Zahl in rekursiver und D in dezimaler Form.
%                  AR und AD sind Akkumulatoren
/*----------------------------------------------------------------------------*/
/* Beispiel für die Anwendung dieser Prädikate:                               */
/*============================================================================*/
% add(s(s(null)),s(s(s(null))),s(s(s(s(s(null)))))). % -> OK
% add(s(s(null)),s(s(s(null))),Z).                   % Z=s(s(s(s(s(null)))))
% add(s(s(null)),Z,s(s(s(s(s(null)))))).             % Z=s(s(s(null)))
% add(Z,s(s(null)),s(s(s(s(s(null)))))).             % Z=s(s(s(null)))
% add(X,Y,s(s(s(s(s(null)))))). % X = null Y = s(s(s(s(s(null)))))
                                % X = s(null) Y = s(s(s(s(null))))
                                % X = s(s(null)) Y = s(s(s(null)))
                                % X = s(s(s(null))) Y = s(s(null))
                                % X = s(s(s(s(null)))) Y = s(null)
                                % X = s(s(s(s(s(null))))) Y = null
/*----------------------------------------------------------------------*/
% mal(s(s(null)),s(s(s(null))),Z). % Z=s(s(s(s(s(s(null))))))
% mal(Z,s(s(null)),s(s(s(s(s(s(null))))))).  Z=s(s(s(null)))  1 Lösung danach Aufhänger
% mal(Z,s(s(null)),s(s(s(s(s(s(null))))))),!.  Z=s(s(s(null)))  1 Lösung danach kein Aufhänger
% mal(s(s(null)),N,s(s(s(s(s(s(null))))))).  Z=s(s(s(null)))  1 Lösung danach Aufhänger
% mal(s(s(null)),N,s(s(s(s(s(s(null))))))),!.  Z=s(s(s(null)))  1 Lösung danach kein Aufhänger
/*----------------------------------------------------------------------*/
% mal2(s(s(null)),s(s(s(null))),Z). % Z=s(s(s(s(s(s(null)))))) 1 Lösung danach Aufhänger
% mal2(s(s(null)),s(s(s(null))),Z),!. % Z=s(s(s(s(s(s(null)))))) 1 Lösung danach kein Aufhänger
% mal2(Z,s(s(null)),s(s(s(s(s(s(null))))))).  Z=s(s(s(null)))
% mal2(s(s(null)),N,s(s(s(s(s(s(null))))))).  Z=s(s(s(null)))
% mal2(F1,F2,s(s(s(s(s(s(null))))))). %->
% F1 = s(null), F2 = s(s(s(s(s(s(null)))))) ;
% F1 = s(s(null)), F2 = s(s(s(null))) ;
% F1 = s(s(s(null))), F2 = s(s(null)) ;
% F1 = s(s(s(s(s(s(null)))))), F2 = s(null) ;
% ERROR: Out of local stack
% mal2(F1,F2,s(s(s(s(s(s(null))))))),!. %->
% F1 = s(null), F2 = s(s(s(s(s(s(null)))))) ;
/*----------------------------------------------------------------------*/
% malz(s(s(null)),s(s(s(null))),Z). % Z=s(s(s(s(s(s(null)))))) 1 Lösung danach Aufhänger
% malz(s(s(null)),s(s(s(null))),Z),!. % Z=s(s(s(s(s(s(null)))))) 1 Lösung danach kein Aufhänger
% malz(Z,s(s(null)),s(s(s(s(s(s(null))))))).  Z=s(s(s(null)))  1 Lösung danach Aufhänger
% malz(Z,s(s(null)),s(s(s(s(s(s(null))))))),!.  Z=s(s(s(null)))  1 Lösung danach kein Aufhänger
% malz(s(s(null)),N,s(s(s(s(s(s(null))))))).  N=s(s(s(null)))  1 Lösung danach Aufhänger
% malz(s(s(null)),N,s(s(s(s(s(s(null))))))),!.  N=s(s(s(null)))  1 Lösung danach kein Aufhänger
% malz(X,Y,s(s(s(s(s(s(null))))))). ->
% X = s(null), Y = s(s(s(s(s(s(null)))))) ;
% X = s(s(null)), Y = s(s(s(null))) ;
% X = s(s(s(null))), Y = s(s(null)) ;
% X = s(s(s(s(s(s(null)))))), Y = s(null) ;
/*----------------------------------------------------------------------*/
% fakultaet(s(s(s(null))),F).  -> F = s(s(s(s(s(s(null))))))
% fakultaet(N,s(s(s(s(s(s(null))))))).  N = s(s(s(null))) ; ERROR: Out of global stack
% fakultaet(N,s(s(s(s(s(s(null))))))),!.  N = s(s(s(null)))
/*----------------------------------------------------------------------*/
% ufakultaet(N,s(s(s(s(s(s(null))))))). -> N = s(s(s(null)))
/*----------------------------------------------------------------------*/
% fakfr(5,F).   -> F=120
% fakfr(N,6).   ERROR: >/2: Arguments are not sufficiently instantiated: Keine Umkehrung
/*----------------------------------------------------------------------*/
% fakrr(5,1,F). -> F=120
% fakrr(N,1,6). ERROR: >/2: Arguments are not sufficiently instantiated: Keine Umkehrung
/*----------------------------------------------------------------------*/
% potenz(s(null),s(s(null)),X),konvfr(X,Z). -> X=s(null) Z=1
% potenz(s(s(null)),s(s(s(null))),X),konvfr(X,Z). ->
%                                   X = s(s(s(s(s(s(s(s(null)))))))), Z = 8
% potenz(s(s(null)),P,s(s(s(s(s(s(s(s(null))))))))). -> P = s(s(s(null))) Aufhängung
% potenz(s(s(null)),P,s(s(s(s(s(s(s(s(null))))))))),!. -> P = s(s(s(null))) keine Aufhängung
% potenz(B,s(s(s(null))),s(s(s(s(s(s(s(s(null))))))))). -> B = s(s(null)) Aufhängung
% potenz(B,s(s(s(null))),s(s(s(s(s(s(s(s(null))))))))),!. -> B = s(s(null)) keine Aufhängung
%----------------------------------------------------------------------------
% konv(X,null,0,1). %-> X=s(null)      Nur restrekursive Def. geht in beide Richtungen
% konv(s(null),null,0,D). %->D=1
%----------------------------------------------------------------------------
% konv(X,null,0,5),fakultaet(X,F),konv(F,null,0,Y). %-> 120
% konv(F,null,0,6),fakultaet(X,F),konv(X,null,0,Y). %-> Y=3 Aufhängung
% konv(F,null,0,6),fakultaet(X,F),konv(X,null,0,Y),!. %-> Y=3 keine Aufhängung
% konv(E,null,0,5),konv(P,null,0,32),potenz(W,E,P),konv(W,null,0,Z). % 5 te Wurzel aus 32 = 2   Aufhängung
% konv(E,null,0,5),konv(P,null,0,32),potenz(W,E,P),konv(W,null,0,Z),!. % 5 te Wurzel aus 32 = 2 keine Aufhängung
% konv(B,null,0,2),konv(P,null,0,32),potenz(B,L,P),konv(L,null,0,Z). % ld(32)=5                 Aufhängung
% konv(B,null,0,2),konv(P,null,0,32),potenz(B,L,P),konv(L,null,0,Z),!. % ld(32)=5               keine Aufhängung
% konv(X,null,0,5),konv(Y,null,0,7),maxrek(X,Y,M),konv(M,null,0,Z).  -> 7
% konv(X,null,0,5),konv(Y,null,0,7),minrek(X,Y,M),konv(M,null,0,Z).  -> 5
% konv(X,null,0,5),mod1(X,null,M). -> fail
% konv(X,null,0,2),mod2(X,null,M). %-> Überlauf
% konv(X,null,0,2),mod3(X,null,M). %-> fail
%----------------------------------------------------------------------------
% konvfr(s(s(s(s(s(s(null)))))),X).       % -> X=6
% konvfr(N,6). -> N = s(s(s(s(s(s(null))))))  Aufhängung
%----------------------------------------------------------------------------
% konvfr(U,1),konvfr(O,4),!,zwischen(U,O,I),konvfr(I,Z). %->1 2 3 4
% konvfr(E,5),konvfr(P,32),potenz(W,E,P),konvfr(W,Z). % 5 te Wurzel aus 32 = 2   Aufhängung
% konvfr(B,2),konvfr(P,32),potenz(B,L,P),konvfr(L,Z). % ld(32)=5                 Aufhängung
%-----------------------------------------------------------------------------
%minrek(s(s(s(null))),s(s(s(s(s(null))))),s(s(s(null)))). %-> true
%minrek(s(s(s(null))),s(s(s(s(s(null))))),M),nl,write(M). %-> M=s(s(s(null)))
%minrek(X,s(s(s(s(s(null))))),s(s(s(null)))),nl,write(X). %-> X=s(s(s(null)))
%-----------------------------------------------------------------------------
% konvfr(X,6),konvfr(Y,4),write(X,":",Y),nl,gcd(X,Y,Z).
%-----------------------------------------------------------------------------
% lesseqi(5,4) %-> fail
%-----------------------------------------------------------------------------
% zwischeni(1,I,5).  I=1,...I=5
% zwischeni(1,3,5).
% zwischeni(1,Z,9).
% zwischen0(I,1). Alle Lösungen + Stacküberlauf wegen Linksrekursivität
% zwischen1(I,5). Restrekursive Lösung mit absteigenden Werten
/************************************************************************/
/*                               LÖSUNGEN                               */
/************************************************************************/
% add(X,Y,Z):- X und Y sind natürliche Zahlen, für die gilt  Z=X+Y.
  add(null,X,X):-natur(X).
  add(s(X),Y,s(Z)):-add(X,Y,Z).
/*----------------------------------------------------------------------*/
% mal(X,Y,Z):-X,Y,Z sind solche nat. Zahlen, daß X*Y=Z ist.
  mal(null,X,null):-natur(X).
  mal(s(X),Y,Z):-mal(X,Y,XY),add(XY,Y,Z).
/*----------------------------------------------------------------------*/
% mal2(X,Y,Z):- Z=X*Y mit Ausschluß von NULL und ander UZ Reihenfolge: Eine Lösung, dann Aufhängen
  mal2(s(null),X,X).
  mal2(s(X),Y,Z):-add(XY,Y,Z),mal2(X,Y,XY).
/*----------------------------------------------------------------------*/
% malz(X,Y,Z):- Z=X*Y mit Ausschluß von NULL, deshalb für Zerlegung geeignet
  malz(s(null),X,X):-natur(X).
  malz(s(X),Y,Z):-zwischen(s(null),Z,s(X)),zwischen(s(null),Z,Y), % 0<X+1<=Z;0<Y<=Z
                  add(Y,XY,Z),malz(X,Y,XY).
/*----------------------------------------------------------------------*/
% potenz(X,N,Y):-X,N,Y sind solche nat. Zahlen, daß Y=X^N ist.
  potenz(null,s(X),null):-natur(X).               % 0^N = 0  N>0
  potenz(s(X),null,s(null)):-natur(X).            % X^0 = 1  X>0
  potenz(X,s(N),Y):-potenz(X,N,Z),mal(Z,X,Y).
/*----------------------------------------------------------------------*/
% kl_gl(X,Y):- X und Y sind natürliche Zahlen, für die gilt X =< Y.
  kl_gl(null,X):- natur(X).       % 0 <= beliebiger nat. Zahl
  kl_gl(s(X),s(Y)):-kl_gl(X,Y).   % X+1<=Y+1 <- X<=Y
/*----------------------------------------------------------------------*/
% zwischen(U,O,Z):- Z ist eine natürliche Zahl zwischen U(nterer Grenze)
%                   und O(berer Grenze) inclusive.
  zwischen(U,O,U):-kl_gl(U,O).    % Z=U liegt zwischen U und O, wenn U<=O
  zwischen(U,O,Z):-kl_gl(s(U),O),zwischen(s(U),O,Z). %Unbtergrenze inkremiert
/*----------------------------------------------------------------------*/
  zwischen1(U,O,O):-kl_gl(U,O).    % Z=O liegt zwischen U und O, wenn U<=O
  zwischen1(U,s(O),Z):-zwischen1(U,O,Z).  % Obergrenze dekremiert
/*----------------------------------------------------------------------*/
% fakultaet(N,F):- F = N!    natürliche Zahlen   Umkehrbar - eine Lösung dann aber Stacküberlauf
  fakultaet(null,s(null)).
  fakultaet(s(N),F):- fakultaet(N,F1), mal(s(N),F1,F).
/*----------------------------------------------------------------------*/
% ufakultaet(N,F):- F = N!    natürliche Zahlen  Nur Umkehrfunktion, da umgekehrte Reihenfolge U Ziele
  ufakultaet(null,s(null)).
  ufakultaet(s(N),F):- malz(s(N),F1,F),ufakultaet(N,F1).
/*----------------------------------------------------------------------*/
% fakfr(N,F):- F=N!    Integer   Nicht umkehrbar
  fakfr(1,1).
  fakfr(N,F):-N>1,N1 is N-1,fakfr(N1,F1),F is N*F1.
/*----------------------------------------------------------------------*/
% fakfrr(N,A,F):- F=N!   A=Akkumulator     Integer   Nicht umkehrbar
  fakrr(1,F,F).
  fakrr(N,A,F):-N>1,N1 is N-1,A1 is N*A,fakrr(N1,A1,F).
/*----------------------------------------------------------------------*/
% minimum(N1,N2,Min):-Das Minimum der nat. Zahlen N1, N2 ist Min.
  minimum(N1,N2,N1):-kl_gl(N1,N2).
  minimum(N1,N2,N2):-kl_gl(N2,N1).
/*----------------------------------------------------------------------*/
% minrek(X,Y,Min):-Min ist das Minimum der nat. Zahlen X und Y.
  minrek(N,null,null):-natur(N).
  minrek(null,N,null):-natur(N).
  minrek(s(X),s(Y),s(M)):-minrek(X,Y,M).
/*----------------------------------------------------------------------*/
% maxrek(X,Y,Max):-Max ist das Minimum der nat. Zahlen X und Y.
  maxrek(X,null,X).
  maxrek(null,Y,Y).
  maxrek(s(X),s(Y),s(M)):-maxrek(X,Y,M).
/*----------------------------------------------------------------------*/
% mod1(X,Y,Z):- Z ist der Rest der Integer Division von X durch Y.
  mod1(X,s(Y),X):-kl_gl(X,Y).                           % X<Y, X = X MOD Y
  mod1(X,Y,Z):-kl_gl(Y,X),add(X1,Y,X),mod1(X1,Y,Z).     % X>=Y,X1=X-Y
/*----------------------------------------------------------------------*/
% mod2(X,Y,Z):- Z ist der Rest der Integer Division von X durch Y.
  mod2(X,s(Y),X):-kl_gl(X,Y). %  X<=Y-1
  mod2(X,Y,Z):-add(X1,Y,X),mod2(X1,Y,Z).                % nichtdeterministisch
/*----------------------------------------------------------------------*/
% mod3(X,Y,Z):- Z ist der Rest der Integer Division von X durch Y.
  mod3(X,s(Y),X):-kl_gl(X,Y). %  X<=Y-1
  mod3(X,s(Y),Z):-add(X1,s(Y),X),mod3(X1,s(Y),Z).
%/*----------------------------------------------------------------------*/
% ackermann(X,Y,A):- A = ackermann_funktion(X,Y).
  ackermann(null,N,s(N)).
  ackermann(s(M),null,Val):-ackermann(M,s(null),Val).
  ackermann(s(M),s(N),Val):-ackermann(s(M),N,Val1),ackermann(M,Val1,Val).
%/*----------------------------------------------------------------------*/
% gcd(X,Y,Z):-Z ist der größte gemeinsame Teiler der nat. Zahlen X, Y.
  gcd(X,Y,Gcd):-mod3(X,Y,Z), gcd(Y,Z,Gcd).
  gcd(X,null,X):-kl_gl(s(null),X).
/*----------------------------------------------------------------------*/
% konv0(R,AR,AD,D):-R ist eine nat. Zahl in rekursiver und D in dezimaler Form
  konv0(R,R,D,D).            % Nur eingeschränkt
  konv0(R,AR,AD,D):- kl_gl(AR,R),AD1 is AD+1,konv0(R,s(AR),AD1,D).   %Restrekursive Definition
/*----------------------------------------------------------------------*/
% konv1(R,AR,AD,D):-R ist eine nat. Zahl in rekursiver und D in dezimaler Form
  konv1(R,R,D,D):-!.         %                        Geht für alle Fließmuster
  konv1(R,AR,AD,D):- AD1 is AD+1,konv1(R,s(AR),AD1,D).   %Restrekursive Definition
/*----------------------------------------------------------------------*/
% konv_un_dez(U,D):- konvertiert die Unärzahl U in die äquivalente Dezimalzahl D
konv_un_dez(null,0).
konv_un_dez(s(X),N):- konv_un_dez(X,N1),N is N1+1.
/*----------------------------------------------------------------------*/
% konv_dez_un(U,D):- konvertiert die Dezimalzahl D in die äquivalente Unärzahl U
konv_dez_un(null,0).
konv_dez_un(s(X),N):- N1 is N-1,konv_dez_un(X,N1).
/*----------------------------------------------------------------------*/
% konvfr(R,D):-R ist eine nat. Zahl in rekursiver und D in dezimaler Form
  konvfr(null,0).
  konvfr(s(X),N):-konvfr(X,N1),N is N1+1.             % FAT Rekursive Definition

/************************************************************************/
/*  Alternativer Ansatz mt Verwendung von Infix Funktoren               */
/************************************************************************/
nat(0).
nat(X+1):-nat(X).

gerade(0).
gerade(X+1+1):-gerade(X).

kl_gl(0,Y):- nat(Y).
kl_gl(X+1,Y+1):- kl_gl(X,Y).


?- kl_gl(X,0+1+1+1).
X = 0 ;
X = 0+1 ;
X = 0+1+1 ;
X = 0+1+1+1 ;
false.

5 ?- gerade(X).
X = 0 ;
X = 0+1+1 ;
X = 0+1+1+1+1 ;
X = 0+1+1+1+1+1+1 .

kl_gl(0,Y):- nat(Y).
kl_gl(X+1,Y+1):- kl_gl(X,Y).

konvert(N,D):- nat(N),D is N,!.        % Ohne ! Stacküberlauf nach der Lösung
% konvert(0+1+1+1+1,D).   D = 4.
% konvert(N,4).           N = 0+1+1+1+1.

