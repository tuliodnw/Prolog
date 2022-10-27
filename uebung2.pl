/******************************************************************************/
/******************************************************************************/
/*                         �bung 2: ListenPr�dikate                           */
/******************************************************************************/
/******************************************************************************/
/* Zusammen mit Structs sind Listen das wichtigste Mittel zur Strukturierung  */
/* von Daten in  PROLOG.                                                      */
/* Listen sind eine rekursive Datenstruktur: Sie werden durch eine Relation,  */
/* die die Liste in Kopf bzw. Restliste unterteilt aufgebaut bzw. zerlegt.    */
/* Diese Relation wird durch "|" dargestellt.                                 */
/* Diese Relation ist je nach Flie�muster mit den LISP Funktionen CAR, CDR    */
/* und CONS vergleichbar.                                                     */
/* Liste k�nnen aus inhomogenen Elementen bestehen und beliebig geschachtelt  */
/* sein.                                                                      */
/******************************************************************************/
/* Beispiele aus der Vorlesung                                                */
/******************************************************************************/
/* Elemente-Relation: el_rel(E,L):- E ist Element von L                       */
/*----------------------------------------------------------------------------*/
/* F�r die Elemente-Relation sind wenigstens zwei Flie�muster sinnvoll:       */
/* 1. el_rel(+E,+L): Sowohl das Element als auch die Liste sind gegeben. Es   */
/*    gibt nur zwei L�sungen: true oder false, je nachdem ob das Element in   */
/*    der Liste enthalten ist oder nicht. Diese L�sungen ergeben sich durch   */
/*    den erfolgreichen Beweis der Anfrage oder durch deren Scheitern aber    */
/*    nicht durch eine Wertebelegung einer Variablen.                         */
/* 2. el_rel(-E,+L): Nur die Liste ist gegeben. Es wird nach einem Element    */
/*    gefragt, das in der Liste enthalten ist. Es gibt N L�sungen, wenn die   */
/*    Liste N Elemente enth�lt. Diese L�sungen entsprechen N Werten der beim  */
/*    Aufruf ungebundenen Variable E                                          */
/* Die restlichen zwei Flie�muster el_rel(+E,-L) und el_rel(-E,-L) sind       */
/* praktisch nicht relevant, da sie eine unendlich Anzahl von L�sungen        */
/* erzeugen.                                                                  */
/*----------------------------------------------------------------------------*/
el_rel(E,[E|_]).
el_rel(E,[_|R]):- el_rel(E,R).
/*
el_rel(a,[a,b,c]).
el_rel(O,[a,b,c]).
*/

a(_).

/*----------------------------------------------------------------------------*/
/* Testen Sie das Pr�dikat el_rel mit verschiedenen Flie�mustern              */
/******************************************************************************/
/* kette/3 ist eine Relation zwischen drei Listen, wobei die die Verkettung   */
/* der ersten beiden Listen gleich der dritten Liste ist. Mit "#" als         */
/* Verkettungsoperator l��t sich diese Relation wie folgt darstellen:         */
/*                      kette(L1,L2,L):- L = L1 # L2.                         */
/* Diese pseudomathematische Definition ist allerdings keine Prologdefinition.*/
/* Sie zeigt aber die durch Umstellen der Gleichung m�glichen Funktionalit�ten*/
/* bei den unterschiedlichen Flie�mustern:                                    */
/* kette(+L1,+L2,+L): Test ob L=L1 # L2 ist                                   */
/* kette(+L1,+L2,-L): Verketten von Listen: L=L1 # L2                         */
/* kette(-L1,+L2,+L): Subtraktion1 von Listen: L1=L-L2                        */
/* kette(+L1,-L2,+L): Subtraktion2 von Listen: L2=L-L1                        */
/* kette(-L1,-L2,+L): Zerlegen einer Liste in zwei Teillisten L1, L2 so dass  */
/* L1 # L2 = L ist.                                                           */
/*----------------------------------------------------------------------------*/
/* Die restlichen 3 von den 8 m�glichen Flie�mustern sind:                    */
/* kette(+L1,-L2,-L)                                                          */
/* kette(-L1,+L2,-L)                                                          */
/* kette(-L1,-L2,-L)                                                          */
/* Diese Flie�muster sind praktisch nicht relevant, da sie eine unendliche    */
/* Anzahl von L�sungen erzeugen.                                              */
/*----------------------------------------------------------------------------*/
kette([],L,L).
kette([K|R1],L,[K|R2]):- kette(R1,L,R2).

/*
kette([a,b,c],[h,j],[a,b,c,h,j]).
kette([a,b,c],[h,j],P).
kette(P,[h,j],[a,b,c,h,j]).
kette([a,b,c],P,[a,b,c,d]).
kette(P,Q,[a,b,c]).
*/




/*----------------------------------------------------------------------------*/
/* Testen Sie das Pr�dikat kettet/3 mit verschiedenen Flie�mustern            */
/******************************************************************************/
/*                                   Aufgaben                                 */
/*----------------------------------------------------------------------------*/
/* Alle Pr�dikate sind wenn nicht besonders vermerkt ohne Zuhilfenahme anderer*/
/* Pr�dikate rekursiv zu definieren.                                          */
/******************************************************************************/
/* 1. Definieren Sie ein Testpr�dikat, das feststellt  ob die Anzahl der      */
/*    Elemente der gegebenen Listen geradzahlig ist (Ohne Benutzung anderer   */
/*    Pr�dikate oder der Funktion mod).                                       */
/*----------------------------------------------------------------------------*/
/* Pseudomathematische Definition geradz_lst(L):- |L| MOD 2 = 0               */
/*----------------------------------------------------------------------------*/
/*                     Testf�lle f�r das Pr�dikat geradz_lst                  */
/*----------------------------------------------------------------------------*/
% geradz_lst([]).       --> true
% geradz_lst([a]).      --> false
% geradz_lst([a,b]).    --> true
% geradz_lst([a,b,c]).  --> false
% geradz_lst([a,b,c,d]).--> true
/******************************************************************************/
%geradz_lst([]).
%geradz_lst([_|[_|R]]):-geradz_lst(R).




/* 2. Definieren Sie ein Pr�dikat zur Bestimmung der L�nge einer Liste bzw.   */
/*    zur Erzeugung einer Liste einer vorgegebener L�nge.                     */
/*----------------------------------------------------------------------------*/
/* Pseudomathematische Definition laenge(L,LL):- LL=|L|                       */
/*----------------------------------------------------------------------------*/
laenge(null,[]).
laenge(s(N),[_|R]):- laenge(N,R).






/* 2.1. Definieren Sie das Pr�dikat laenge1/2 Benutzung von Nat�rlichen Zahlen*/
/*      zur Angabe der Listenl�nge                                            */
/*----------------------------------------------------------------------------*/
/* Nat�rliche Zahlen sind rekursiv wie folgt definiert:                       */
/* 1. Null ist eine Nat�rliche Zahl                                           */
/* 2. Jeder Nachfolger einer Nat�rlichen Zahl ist eine Nat�rliche Zahl        */
/* Diese zwei Regeln lassen sich direkt in PROLOG mit Nat�rlichen Zahlen in   */
/* Form von Structs umsetzen, wobei das Symbol "null" der Zahl 0 entspricht   */
/* und s der Funktor f�r den Nachfolger ist.                                  */
/*----------------------------------------------------------------------------*/
nat(null).
nat(s(X)):- nat(X).

/*

*/

/*----------------------------------------------------------------------------*/
/* Testen Sie das Pr�dikat "nat" mit verschiedenen Flie�mustern               */
/*----------------------------------------------------------------------------*/
/*Definieren Sie das Pr�dikat laenge1/2                                       */
/*----------------------------------------------------------------------------*/
laenge1([],null).
laenge1([_|R],s(N)):- laenge1(R,N).
/*----------------------------------------------------------------------------*/
/*                      Testf�lle f�r das Pr�dikat laenge1                    */
/*----------------------------------------------------------------------------*/
% laenge1([a,b,c],s(s(s(null)))). -> true
% laenge1([a,b],LL). -> LL = s(s(null)).
% laenge1(L,s(s(null))). -> L = [_,_].  Eine Liste aus zwei anonymen Elementen
/*----------------------------------------------------------------------------*/
/* 2.2. Definieren Sie das Pr�dikat laenge2/2 unter Benutzung von             */
/*      Integerzahlen zur Angabe der Listenl�nge.                             */
/*----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------*/
/*                      Testf�lle f�r das Pr�dikat laenge2                    */
/*----------------------------------------------------------------------------*/
% laenge2([a,b,c],3). -> true.
% laenge2([a,b,c],LL). -> LL = 3.
% laenge2(L,2). -> L = [_,_].  Eine Liste aus zwei anonymen Elementen
/*----------------------------------------------------------------------------*/
/* 2.3. Machen Sie sich den Unterschied von laenge1/2 und laenge2/2 bez�glich */
/*      ihrer Anwendbarkeit klar!                                             */
/******************************************************************************/
/* 3. Definieren Sie ein Pr�dikat zur Pr�dikat zum Bestimmen des Pr�fixes     */
/*    einer Liste (Ein Pr�fix ist der vordere Teil einer Liste)               */
/*----------------------------------------------------------------------------*/
/* prefix(P,L):- P ist Prefix der Liste L                                     */
/*----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------*/
/*                      Testf�lle f�r das Pr�dikat prefix                     */
/*----------------------------------------------------------------------------*/
%  prefix([a,b],[a,b,c]). -> true
%  prefix([b,c],[a,b,c]). -> false.
%  prefix(P,[a,b,c]). -> P=[]; P=[a]; P=[a,b]; P=[a,b,c]
/******************************************************************************/
/* 4. Definieren Sie ein Pr�dikat zur Pr�dikat zum Bestimmen des Suffixes     */
/*    einer Liste (Ein Suffix ist der hintere Teil einer Liste)               */
/*----------------------------------------------------------------------------*/
/* suffix(S,L):- S ist Suffix der Liste L                                     */
/*----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------*/
/*                      Testf�lle f�r das Pr�dikat suffix                     */
/*----------------------------------------------------------------------------*/
%suffix([c],[a,b,c]). -> true
%suffix([a,c],[a,b,c]). -> false.
%suffix(S,[a,b,c]). -> S=[a,b,c]; S=[b,c]; S=[c]; SFX=[]
/******************************************************************************/
/* 5. Definieren Sie ein Pr�dikat zum Bestimmen der Position P eines gegebenen*/
/*    Listenelementes E in der Liste L mit Angabe der Position als Nat�rliche */
/*    Zahl und als Integerzahl.                                               */
/*----------------------------------------------------------------------------*/
/* pos(E,L,P):- P ist die Position von E in L                                 */
/*----------------------------------------------------------------------------*/
/* 5.1. Benutzung von Nat�rlichen Zahlen zur Angabe der Position.             */
/*----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------*/
/*                      Testf�lle f�r das Pr�dikat pos1                       */
/*----------------------------------------------------------------------------*/
%pos1(b,[a,b,c],s(s(null))).  -> true
%pos1(E,[a,b,c],s(s(null))).  -> E = b
%pos1(b,[a,b,c],P).           -> P = s(s(null))
%pos1(E,[a,b,c],P).           -> E=a,P=s(null);E=b,P=s(s(null));E=c,P=s(s(s(null)))
/*----------------------------------------------------------------------------*/
/* 5.2. Benutzung von Integer Zahlen zur Angabe der Position.                 */
/*----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------*/
/*                      Testf�lle f�r das Pr�dikat pos2                       */
/*----------------------------------------------------------------------------*/
%pos2(b,[a,b,c],2).           -> true
%pos2(E,[a,b,c],2).           -> E = b
%pos2(b,[a,b,c],P).           -> P = 2
%pos2(E,[a,b,c],P).           -> E=a,P=1;E=b,P=2;E=c,P=3
/*----------------------------------------------------------------------------*/
/* 5.3. Machen Sie sich den Unterschied in der Anwendbarkeit klar!            */
/******************************************************************************/
/* 6. Definieren Sie ein Pr�dikat zur Umkehrung einer Liste                   */
/*----------------------------------------------------------------------------*/
/* 6.1. Definition ohne Akkumulator                                           */
/*----------------------------------------------------------------------------*/
/* umkehr1(LISTE,ETSIL):- ETSIL=LISTE mit umgekehrter Reihenfolge der         */
/*                        Elemente                                            */
/*----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------*/
/*                       Testfall f�r das Pr�dikat umkehr1                    */
/*----------------------------------------------------------------------------*/
%umkehr1([a,b,c],UL). ->  UL = [c, b, a].
/*----------------------------------------------------------------------------*/
/* 6.2. Definition mit Akkumulator                                            */
/*----------------------------------------------------------------------------*/
/* umkehr2(LISTE,AKKU,ETSIL):- AKKU = Liste zum Speichern der Zwischen-       */
/*                                    Ergebnisse                              */
/*----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------*/
/*                       Testfall f�r das Pr�dikat umkehr2                    */
/*----------------------------------------------------------------------------*/
%umkehr2([a,b,c],[],UL). ->  UL = [c, b, a].
/*----------------------------------------------------------------------------*/
/* 6.3. Machen Sie sich den Unterschied zwischen umkehr1 und umkehr2 klar!    */
/******************************************************************************/
/* 7. Definieren Sie ein Pr�dikat zum Test auf Mehrfachvorkommen eines        */
/*    Elementes in einer Liste. Benutzen Sie die Systempr�dikate select und   */
/*    member                                                                  */
/*----------------------------------------------------------------------------*/
/* mehrfach(L):- true wenn ein Element in L mehrfach vorkommt                 */
/*----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------*/
/*                   Testf�lle f�r das Pr�dikat mehrfach                      */
/*----------------------------------------------------------------------------*/
% mehrfach([a,b,a,c,a,d]).      ->yes
% mehrfach([b,a,c,a,d]).        ->yes
% mehrfach([a,b,c,d]).          ->fail
/******************************************************************************/
/* 8. Definieren Sie zwei Pr�dikat zur Normalisierung einer Liste, d.h. zum   */
/*    Entfernen von mehrfachvorkommenden Elementen: normal1/2 und normal2/2.  */
/*----------------------------------------------------------------------------*/
/* 8.1 Definition von normal1/2  ohne Akku und mit Benutzung des              */
/*     Systempr�dikats delete/3:                                              */
/*     normal1(L,M):- M enthaelt jedes Element von L nur einmal.              */
/*----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------*/
/*                   Testf�lle f�r das Pr�dikat normal1                       */
/*----------------------------------------------------------------------------*/
% normal1([a,b,a,c,a,d],M).         -> M=[a,b,c,d]
% normal1([a,b,c,d],M).             -> M=[a,b,c,d]
% normal1([a,b,a,c,d,b],[a,b,c,d]). -> true
% normal1([a,b,a,c,d,b],[a,c,b,d]). -> false
/*----------------------------------------------------------------------------*/
/* 8.2 Definition mit Akku und mit Benutzung des Systempr�dikats member/2.    */
/*     normal2(L,A,M):- M enthaelt jedes Element von L nur einmal.            */
/*                      L=Liste; M=Menge, A=Akku                              */
/*----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------*/
/*                   Testf�lle f�r das Pr�dikat normal2                       */
/*----------------------------------------------------------------------------*/
% normal2([a,b,a,c,a,d],[],M).         -> M=[d, a, c, b]
% normal2([a,b,c,d],[],M).             -> M=[d, c, b, a]
% normal2([a,b,a,c,d,b],[],[a,b,c,d]). -> false
% normal2([a,b,a,c,d,b],[],[b,d,c,a]). -> true
% normal2([a,b,a,c,d,b],[],[a,c,b,d]). -> false
/*----------------------------------------------------------------------------*/
/* 8.3 Finden Sie 3 Unterschiede in der Wirkungsweise von normal1 und normal2.*/
/*----------------------------------------------------------------------------*/
/* L�sung:                                                                    */
/* 1.  normal1 liefert eine andere Reihenfolge als normal2                    */
/* 2.  normal1 liefert eine L�sung, normal2 in der Regel mehrere              */
/* 3.  normal1 und normal2 scheitern beim Flie�muster normal(+,+) bei         */
/*     unterschiedlichen Reihenfolgen der Listenelemente                      */
/******************************************************************************/
/* 9. Definieren Sie das Pr�dikat ordered(L), das testet ob L eine            */
/*    aufsteigend geordnete Zahlenliste ist.                                  */
/*----------------------------------------------------------------------------*/
/* Pseudomathematische Definition: f�r alle x(i) und x(i+1), 1=<i=<n, n>=1:   */                                        */
/* ordered([x(1),x(2),...,x(n)]):- x(i)=< x(i+1)                              */
/*----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------*/
/*                   Testf�lle f�r das Pr�dikat ordered                       */
/*----------------------------------------------------------------------------*/
%ordered([]).        -> false
%ordered([5]).       -> true
%ordered([1,2,3]).   -> true
%ordered([1,2,1,3]). -> false
/******************************************************************************/
/* 10. Definieren Sie das Pr�dikat selektieren(L1,E,L2) zur Auswahl eines     */
/*     Elementes E aus der Liste L1, wobei die Liste L2 die restlichen        */
/*     Elemente von L1 enth�lt.                                               */
/*----------------------------------------------------------------------------*/
/* Pseudomathematische Definition:                                            */
/* selektieren(L1,E,L2):- L1 = {E} u L2                                       */
/*----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------*/
/*                   Testf�lle f�r das Pr�dikat selektieren                   */
/*----------------------------------------------------------------------------*/
% selektieren([a,b,c],b,[a,c]). -> yes
% selektieren([a,b,c],E,[a,c]). -> E=b
% selektieren([a,b,c],b,L).     -> L = [a,c]
% selektieren(L,b,[a,c]).       -> L=[b,a,c]; L=[a,b,c]; L=[a,c,b]
% selektieren([a,b,c],E,L).     -> E=a,L=[b,c]; E=b,L=[a,c]; E=c,L=[a,b].
/**/
