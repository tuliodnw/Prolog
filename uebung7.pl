/******************************************************************************/
/*    Übung 7: Studenten, Hasen und Mohrrüben                                 */
/******************************************************************************/
/* Aufgabe 1: Gegeben ist nachstehende Grammatik. Definieren Sie eine DCG,    */
/*            die die Syntaxanalyse nach dieser Grammatik realisiert. Testen  */
/*            Sie das Ergebnis mit verschiedenen Fließmustern.                */
/*----------------------------------------------------------------------------*/
/*                  Grammatik REGELN                                          */
/*----------------------------------------------------------------------------*/
%<satz>      --> <np> <vp>
%<np>        --> <art> <nomen>
%<np>        --> <nomen>
%<np>        --> <eigenname>
%<vp>        --> <verb> <np>
%<vp>        --> <verb>
/*----------------------------------------------------------------------------*/
/*                  LEXIKALISCHE REGELN                                       */
/*----------------------------------------------------------------------------*/
%<art>              --> der
%<art>              --> den
%<art>              --> die
%<art>              --> ein
%<art>              --> einen
%<art>              --> eine
%<nomen>            --> entitaet
%<nomen>            --> lebewesen
%<nomen>            --> tier
%<nomen>            --> tiere
%<nomen>            --> pflanzenfresser
%<nomen>            --> fleischfresser
%<nomen>            --> hase
%<nomen>            --> hasen
%<nomen>            --> fuchs
%<nomen>            --> fuechse
%<nomen>            --> wissenschaft
%<nomen>            --> wissenschaften
%<nomen>            --> informatik
%<nomen>            --> mathematik
%<nomen>            --> pflanze
%<nomen>            --> pflanzen
%<nomen>            --> mohrruebe
%<nomen>            --> mohrrueben
%<nomen>            --> mensch
%<nomen>            --> menschen
%<nomen>            --> student
%<nomen>            --> studenten
%<nomen>            --> professor
%<nomen>            --> professoren
%<eigenname>        --> max
%<eigenname>        --> moritz
%<verb>             --> isst
%<verb>             --> essen
%<verb>             --> ist
%<verb>             --> sind
%<verb>             --> mag
%<verb>             --> moegen
%<verb>             --> studiert
%<verb>             --> studieren
%<verb>             --> schlaeft
%<verb>             --> schlafen
%<verb>             --> waechst
%<verb>             --> wachsen
/******************************************************************************/
/*                                    Test                                    */
/*----------------------------------------------------------------------------*/
%satz([ein,student,isst,mohrrueben],[]).  -> true
%satz([die,student,essen,student],[]).  -> true
%satz([ein,student,studiert,X],[]). ->
%X=hase;X=hasen;X=informatik;X=mohrruebe;X=mohrrueben;X=student;X=studenten;X=max;X=moritz
%satz([ein,student,studiert,bwl],[]). -> false
%satz([ein],[]).                      -> false
%satz([A,B,C],[]).  -> Alle Sätze aus drei Wörtern
% A = der,B = student,C = moegen ;
% A = der,B = student,C = studiert ;
% A = der,B = student,C = studieren ;
% A = der,B = student,C = isst ;
% ......................................
%satz(S,[]).  -> Alle Sätze
% S = [der, student, mag, der, student] ;
% S = [der, student, mag, der, studenten] ;
% S = [der, student, mag, der, informatik] ;
% S = [der, student, mag, der, hase]
% ......................................
/******************************************************************************/
/* Aufgabe 1a: Definieren Sie einen Ausdruck, der die Anzahl der von der DCG  */
/*             erzeugten Sätze a) mit 3 Worten b) mit beliebig viel Worten    */
/*             bestimmt                                                       */
/******************************************************************************/
/* Aufgabe 2: Erweitern Sie die DCG um die Kongruenzprüfung. Dabei soll der   */
/*            Numerus der ersten np und des Verbs ausgegeben werden.          */
/*            Testen Sie das Ergebnis.                                        */
/*            Für die syntaktischen Kategorien werden folgende Wertebereiche  */
/*            benutzt:                                                        */
/*                                                                            */
/*            Kategorie|Wertebereich                                          */
/*            ---------+----------                                            */
/*              Casus  | nom,akk                                              */
/*              Genus  | mas,fem                                              */
/*             Numerus |sing,plur                                             */
/*                                                                            */
/*            Intransitive Verben werden mit Casus=intr gekennzeichnet.       */
/******************************************************************************/
/*                                    Test                                    */
/*----------------------------------------------------------------------------*/
%satz(N,[ein,student,isst,mohrrueben],[]).  -> N=sing
%satz(N,[die,student,essen,student],[]).    -> false
%satz(_,[ein,student,studiert,X],[]). ->
%X=hasen;X=hasen;X=informatik;X=mohrruebe;X=mohrrueben;X=studenten;X=studenten;X=max;X=moritz
%satz(_,[ein,student,studiert,bwl],[]). -> false
%satz(_,[ein],[]).                      -> false
%satz(_,[A,B,C],[]).  -> Alle Sätze aus drei Wörtern
%A=der,B=hase,C=schlaeft;
%A=der,B=student,C=schlaeft;
%A=die,B=informatik,C=schlaeft;
%A=die,B=mohrruebe,C=schlaeft
% ......................................
%satz(plur,S,[]).  ->  Alle Sätze im Plural
% S = [die, hasen, essen, den, hasen] ;
% S = [die, hasen, essen, den, studenten] ;
% S = [die, hasen, essen, die, informatik] ;
% S = [die, hasen, essen, die, mohrruebe] ;
% S = [die, hasen, essen, die, hasen] ;
% S = [die, hasen, essen, die, mohrrueben] ;
% S = [die, hasen, essen, die, studenten] ;
% S = [die, hasen, essen, einen, hasen]
% ......................................
%satz(_,S,[]).  -> Alle Sätze
% S = [der, hase, isst, den, hasen] ;
% S = [der, hase, isst, den, studenten] ;
% S = [der, hase, isst, die, informatik] ;
% S = [der, hase, isst, die, mohrruebe] ;
% S = [der, hase, isst, die, hasen] ;
% S = [der, hase, isst, die, mohrrueben] ;
% S = [der, hase, isst, die, studenten] ;
% S = [der, hase, isst, einen, hasen] ;
% S = [der, hase, isst, einen, studenten] ;
% ......................................
/******************************************************************************/
/* Aufgabe 2a: Definieren Sie einen Ausdruck, der die Anzahl der von der DCG  */
/*             erzeugten Sätze a) mit 3 Worten b) mit beliebig viel Worten    */
/*             bestimmt                                                       */
/******************************************************************************/
/* Aufgabe 3: Erweitern Sie die DCG um die Konstruktion des Syntaxbaums, d.h. */
/*            bei gebenen Satz wird der Numerus und der erzeugte Syntaxbaum   */
/*            bestimmt oder bei gegebenem Syntaxbaum wird der Numerus und der */
/*            Satz bestimmt.                                                  */
/******************************************************************************/
/*                                    Test                                    */
/*----------------------------------------------------------------------------*/
%satz(_,B,[ein,student,isst,mohrrueben],[]).  ->
% B = satz(np(art(ein), nomen(student)), vp(verb(isst), np(nomen(mohrrueben))))

%satz(_,B,[studenten,studieren,informatik],[]). ->
% B = satz(np(nomen(studenten)), vp(verb(studieren), np(nomen(informatik)))) .

%satz(N,satz(np(nomen(studenten)), vp(verb(studieren), np(nomen(informatik)))),S,[]).
% N = plur, S = [studenten, studieren, informatik]
/******************************************************************************/
/* Aufgabe 4: Erweitern Sie die DCG um die Konstruktion der Semantik, d.h.    */
/*            bei gebenen Satz wird der Numerus, der erzeugte Syntaxbaum und  */
/*            die Semantik bestimmt und es wird überprüft, ob die Semantik    */
/*            bezogen auf eine Wissenbasis korrekt ist. D.h. es dürfen keine  */
/*            Sätze mehr akzeptiert werden, in denen Hasen Studenten oder     */
/*            Mohrrueben Studenten essen oder Mohrrueben schlafen. Studenten  */
/*            dürfen Mohrrueben und Hasen essen aber keine Informatik oder    */
/*            Füchse - erweitern Sie das Lexikon um das Nomen "Fuchs".        */
/*            Dazu enthält die Wissensbasis eine kleine Taxonomie:            */
/*                                                                            */
/*                                 Entität                                    */
/*                                    |                                       */
/*                   +----------------+-------------+                         */
/*                   |                              |                         */
/*             Wissenschaft                     Lebewesen                     */
/*                   |                              |                         */
/*              Informatik     +--------------------+-------------------+     */
/*                             |                    |                   |     */
/*                          Mensch                 Tier              Pflanze  */
/*                             |                    |                   |     */
/*           +--------+--------+         +----------+--------+      Mohrruebe */
/*           |        |        |         |                   |                */
/*        Student    Max    Moritz   Pflanzenfresser   Fleischfresser         */
/*                                       |                   |                */
/*                                      Hase               Fuchs              */
/*                                                                            */
/*                                                                            */
/*            Desweiteren enthält die Wissensbasis Regeln, die Eigenschaften  */
/*            der Klassen ausdrücken:                                         */
/*            1. Lebewesen wachsen.                                           */
/*            2. Tiere schlafen.                                              */
/*            3. Pflanzenfresser essen Pflanzen.                              */
/*            4. Fleischfresser essen Tiere                                   */
/*            5. Menschen essen Pflanzenfresser und Pflanzen.                           */
/*            6. Menschen studieren Entitäten.                                */
/*            7. Tiere moegen Lebewesen                                       */
/*            8. Menschen moegen Entitäten.                                   */
/******************************************************************************/
/*                                    Test                                    */
/*----------------------------------------------------------------------------*/
%satz(_,_,Sem,[ein, student, mag, informatik],[]). ->  Syntax und Semantik sind ok: Sem = moegen(student, informatik)
%satz(_,_,Sem,[informatik, mag,einen,studenten],[]). -> Syntax ist ok aber Semantik ist fehlerhaft: Sem = moegen(informatik, student)
%satz(_,B,_,[informatik, mag,einen,studenten],[]). -> Syntax ist ok aber Semantik ist fehlerhaft:
%                                                     B = satz(np(nomen(informatik)), vp(verb(mag), np(art(einen), nomen(studenten))))
%satz(_,_,Sem,[der, hase, isst, mohrrueben],[]). ->  Syntax und Semantik sind ok: Sem = essen(hase, mohrruebe)
%satz(_,_,Sem,[mohrrueben,essen,hasen],[]). ->  Syntax ist ok aber Semantik ist fehlerhaft: Sem = essen(mohrruebe, hase)
%satz(_,_,Sem,[der, hase, mag, den, studenten],[]). -> Syntax und Semantik sind ok: Sem = moegen(hase, student)
%satz(_,_,Sem,[der, hase, mag, die, mohrrueben],[]). -> Syntax und Semantik sind ok: Sem = moegen(hase, mohrruebe)
%satz(_,_,Sem,[der, hase, mag, max],[]). -> Syntax und Semantik sind ok: Sem = moegen(hase, max)
%satz(_,_,Sem,[der, student, isst, eine, mohrruebe],[]). -> Syntax und Semantik sind ok: Sem = essen(student, mohrruebe)
%satz(_,_,Sem,[der, student, isst, hasen],[]). -> Syntax und Semantik sind ok: Sem = essen(student, hase)
%satz(_,_,Sem,[hasen,essen,den,studenten],[]). -> Syntax ist ok aber Semantik ist fehlerhaft: Sem = essen(hase, student)
%satz(_,_,Sem,[der, student, mag, hasen],[]). -> Syntax und Semantik sind ok: Sem = moegen(student, hase)
%satz(_,_,Sem,[der, student, mag, mohrrueben],[]). -> Syntax und Semantik sind ok: Sem = moegen(student, mohrruebe)
%satz(_,_,Sem,[der, student, mag, studenten],[]). -> Syntax und Semantik sind ok: Sem = moegen(student, student)
%satz(_,_,Sem,[der, student, mag, moritz],[]). -> Syntax und Semantik sind ok: Sem = moegen(student, moritz)
%satz(_,_,Sem,[moritz, mag,den, studenten],[]). -> Syntax und Semantik sind ok: Sem = moegen(moritz, student)
%satz(_,_,Sem,[der, student, studiert, die, hasen],[]). -> Syntax und Semantik sind ok:  Sem = studieren(student, hase)
%satz(_,_,Sem,[die, hasen, studieren,den,studenten],[]). -> Syntax ist ok aber Semantik ist fehlerhaft: Sem = studieren(hase, student)
%satz(_,_,Sem,[der, student, studiert, informatik],[]). -> Syntax und Semantik sind ok: Sem = studieren(student, informatik)
%satz(_,_,Sem,[informatik, studiert,den, studenten],[]). -> Syntax ist ok aber Semantik ist fehlerhaft: Sem = studieren(informatik, student).
%satz(_,_,Sem,[der, student, waechst],[]). -> Syntax und Semantik sind ok: Sem = wachsen(student)
%satz(_,_,Sem,[die, mohrruebe, mag, die, studenten],[]). -> Syntax ist ok aber Semantik ist fehlerhaft: Sem = moegen(mohrruebe, student)
%satz(_,_,Sem,[die, mohrruebe, mag, max],[]). -> Syntax ist ok aber Semantik ist fehlerhaft: Sem = moegen(mohrruebe, max)
%satz(_,_,Sem,[die, hasen, essen, eine,mohrruebe],[]). -> Syntax und Semantik sind ok: Sem = essen(hase, mohrruebe)
%satz(_,_,Sem,[die, hasen, moegen, den, studenten],[]). ->  Syntax und Semantik sind ok: Sem = moegen(hase, student)
%satz(_,_,Sem,[die, hasen, schlafen],[]). -> Syntax und Semantik sind ok: Sem = schlafen(hase)
%satz(_,_,Sem,[die,mohrrueben, schlafen],[]). -> Syntax ist ok aber Semantik ist fehlerhaft: Sem = schlafen(mohrruebe).
%satz(_,_,Sem,[die, hasen, wachsen],[]). -> Syntax und Semantik sind ok: Sem = wachsen(hase)
%satz(_,_,Sem,[die,mohrrueben,wachsen],[]). -> Syntax und Semantik sind ok: Sem = wachsen(mohrruebe)
%satz(_,_,Sem,[ein, hase, mag, einen, studenten],[]). -> Syntax und Semantik sind ok: Sem = moegen(hase, student)
%satz(_,_,Sem,[max, mag, max],[]). -> Syntax und Semantik sind ok: Sem = moegen(max, max)
%satz(_,_,Sem,[moritz, waechst],[]). -> Syntax und Semantik sind ok: Sem = wachsen(moritz)
%satz(_,_,Sem,[moritz,isst,einen,hasen],[]). -> Syntax und Semantik sind ok: Sem = essen(moritz, hase)
%satz(_,_,Sem,[moritz,isst,einen,fuchs],[]). -> Syntax ist ok aber Semantik ist fehlerhaft: Sem = essen(moritz, fuchs).
%satz(_,_,Sem,[moritz,isst,eine,mohrruebe],[]). -> Syntax und Semantik sind ok: Sem = essen(moritz, mohrruebe)
%satz(_,_,Sem,[moritz,isst,einen,studenten],[]). -> Syntax ist ok aber Semantik ist fehlerhaft: Sem = essen(moritz, student).

