/******************************************************************************/
/*                   Suche in Schachbrettwelt Dimension 8                     */
/******************************************************************************/
/* Die Schachbrettwelt ist durch eine Nachbarschaftsrelation zwischen den     */
/* Feldern gegeben. Jedes Feld außer den Randfeldern hat 4 Nachbarfelder in   */
/* waagerechter und senkrechter Richtung. Diese Felder sind in einem Schritt  */
/* erreichbar. Eine diagonale Bewegung ist nicht zulässig.                    */
/* Die Felder sind durch Angabe ihrer x-y-Koordinaten gekennzeichnet. Eine    */
/* Verbindung zwischen den Feldern k(x1,y1) und k(x2,y2) wird durch den Fakt  */
/* nb(k(x1,y1),k(x2,Y2)) in der Wissensbasis repräsentiert.                   */
/* Die Schachbrettwelt ist 8x8 Felder groß.                                   */
/* Es gibt 8 Modifikationen dieser Schachbrettwelt, die durch verschiedene    */
/* Hindernisse gebildet werden, die die Anzahl der Übergänge begrenzen.       */
/* In den Schemata sind mit "S" und "Z" Start und Ziel der Suche angegeben.   */
/******************************************************************************/
/*  1. Welt ohne Hindernisse: Alle Übergänge sind verfügbar.                  */
/*----------------------------------------------------------------------------*/
%  y
%    +---+---+---+---+---+---+---+---+
%  1 | S |   |   |   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  2 |   |   |   |   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  3 |   |   |   |   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  4 |   |   |   |   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  5 |   |   |   |   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  6 |   |   |   |   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  7 |   |   |   |   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  8 |   |   |   |   |   |   |   | Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8    x
%
/******************************************************************************/
/*                    2. Welt mit 26 waagerechten Hinternissen                */
/*----------------------------------------------------------------------------*/
%  y
%    +---+---+---+---+---+---+---+---+
%  1 | S |   |   |   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  2 |###|###|###|   |###|###|###|###|
%    +---+---+---+---+---+---+---+---+
%  3 |   |   |   |   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  4 |   |###|###|###|###|###|###|   |
%    +---+---+---+---+---+---+---+---+
%  5 |   |   |   |   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  6 |###|###|###|   |###|###|###|###|
%    +---+---+---+---+---+---+---+---+
%  7 |   |   |   |   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  8 |   |###|###|###|###|###|###| Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8    x
/******************************************************************************/
/*  3. Welt mit 26 senkrechten Hinternissen                                   */
/*----------------------------------------------------------------------------*/
%  y
%    +---+---+---+---+---+---+---+---+
%  1 | S |###|   |   |   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  2 |   |###|   |###|   |###|   |###|
%    +---+---+---+---+---+---+---+---+
%  3 |   |###|   |###|   |###|   |###|
%    +---+---+---+---+---+---+---+---+
%  4 |   |###|   |###|   |###|   |###|
%    +---+---+---+---+---+---+---+---+
%  5 |   |   |   |###|   |   |   |###|
%    +---+---+---+---+---+---+---+---+
%  6 |   |###|   |###|   |###|   |###|
%    +---+---+---+---+---+---+---+---+
%  7 |   |###|   |###|   |###|   |###|
%    +---+---+---+---+---+---+---+---+
%  8 |   |###|   |   |   |###|   | Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8    x
/******************************************************************************/
/*  4. Welt mit 22 kreuzförmigen Hinternissen                                 */
/*----------------------------------------------------------------------------*/
%  y
%    +---+---+---+---+---+---+---+---+
%  1 | S |###|   |###|   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  2 |   |###|   |###|   |###|   |###|
%    +---+---+---+---+---+---+---+---+
%  3 |   |   |   |###|   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  4 |   |   |   |   |   |###|###|###|
%    +---+---+---+---+---+---+---+---+
%  5 |###|###|###|   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  6 |   |###|   |   |###|   |###|###|
%    +---+---+---+---+---+---+---+---+
%  7 |   |   |   |   |###|   |   |   |
%    +---+---+---+---+---+---+---+---+
%  8 |   |###|   |   |###|   |###| Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8    x
/******************************************************************************/
/*  5. Welt mit 16 diagonalen Hinternissen                                    */
/*----------------------------------------------------------------------------*/
%  y
%    +---+---+---+---+---+---+---+---+
%  1 | S |   |   |   |###|   |   |###|
%    +---+---+---+---+---+---+---+---+
%  2 |   |###|   |   |   |   |###|   |
%    +---+---+---+---+---+---+---+---+
%  3 |###|   |###|   |   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  4 |   |   |   |   |   |   |###|   |
%    +---+---+---+---+---+---+---+---+
%  5 |   |###|   |   |###|   |   |   |
%    +---+---+---+---+---+---+---+---+
%  6 |   |   |###|   |   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  7 |   |###|   |###|   |   |###|   |
%    +---+---+---+---+---+---+---+---+
%  8 |###|   |   |   |   |   |   | Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8    x
/******************************************************************************/
/*  6. Welt mit Labyrinth mit 24 Hinternissen                                 */
/*----------------------------------------------------------------------------*/
%  y
%    +---+---+---+---+---+---+---+---+
%  1 | S |   |   |   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  2 |   |###|###|###|###|###|###|   |
%    +---+---+---+---+---+---+---+---+
%  3 |   |###|###|   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  4 |   |   |###|   |###|###|###|###|
%    +---+---+---+---+---+---+---+---+
%  5 |###|   |###|   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  6 |   |   |###|###|###|###|###|   |
%    +---+---+---+---+---+---+---+---+
%  7 |   |###|###|   |   |   |###|   |
%    +---+---+---+---+---+---+---+---+
%  8 |   |   |   |   |###|   |   | Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8    x
/******************************************************************************/
/*    7. Welt mit 24 zickzackförmig angeordneten Hindernissen                 */
/*----------------------------------------------------------------------------*/
%  y
%    +---+---+---+---+---+---+---+---+
%  1 | S |   |   |###|   |   |###|   |
%    +---+---+---+---+---+---+---+---+
%  2 |   |###|   |###|   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  3 |###|   |   |###|   |   |###|   |
%    +---+---+---+---+---+---+---+---+
%  4 |###|###|   |   |   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  5 |###|   |   |###|   |   |###|   |
%    +---+---+---+---+---+---+---+---+
%  6 |###|###|   |###|   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  7 |###|   |   |###|   |###|###|###|
%    +---+---+---+---+---+---+---+---+
%  8 |   |   |   |###|   |   |   | Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8    x
/******************************************************************************/
/*  8. Welt mit 16 rasterförmigen Hindernissen                                */
/*----------------------------------------------------------------------------*/
%  y
%    +---+---+---+---+---+---+---+---+
%  1 | S |   |   |###|   |   |   |###|
%    +---+---+---+---+---+---+---+---+
%  2 |   |###|   |   |   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  3 |   |   |   |###|   |   |   |###|
%    +---+---+---+---+---+---+---+---+
%  4 |   |###|   |   |   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  5 |   |   |   |###|   |   |   |###|
%    +---+---+---+---+---+---+---+---+
%  6 |   |###|   |   |   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  7 |   |   |   |###|   |   |   |###|
%    +---+---+---+---+---+---+---+---+
%  8 |   |###|   |   |   |###|   | Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8    x
/******************************************************************************/
/* In den meisten Testbeispielen sind die Felder mit den Koordinaten (1,1) u. */
/* (8,8) Startund Ziel der Suche. In den Schemata sind sie mit "S" und "Z"    */
/* gekennzeichnet.                                                            */
/******************************************************************************/
/* Die jeweilige Wissensbasis kann durch folgendes Prädikat mit consult/1     */
/* geladen werden. Dabei ist der logische Dateiname eine Abkürzung für die    */
/* jeweilige Art der Hindernisse.                                             */
/*----------------------------------------------------------------------------*/
/* "ohne" entspricht der Datei Schachbrettwelt ohne Hinderniss                */
/* "waag" entspricht der Datei Schachbrettwelt mit waagrechten Hindernissen   */
/* "senk" entspricht der Datei Schachbrettwelt mit senkrechten Hindernissen   */
/* "kreu" entspricht der Datei Schachbrettwelt mit kreuzförmigen Hinderniss   */
/* "diag" entspricht der Datei Schachbrettwelt mit diagnalen Hindernissen     */
/* "laby" entspricht der Datei Schachbrettwelt mit Labyrinth-Hinderniss       */
/* "rast" entspricht der Datei Schachbrettwelt mit Raster-Hindernissen        */
/* "zick" entspricht der Datei Schachbrettwelt mit Zickzack-Hindernissen      */
/*----------------------------------------------------------------------------*/
/* Der Zusammenhang zwischen der Abkürzung und dem Pfad ist durch das         */
/* Prädikat pfad/2 definiert.                                                 */
/*----------------------------------------------------------------------------*/
pfad(ohne,'C:/Users/admin/Desktop/Prolog 2023/WV_GRUNDLAGEN.BCH/Git/uebung4/wb_schachbr8x8_ohne.pl').
pfad(waag,'C:/Users/admin/Desktop/Prolog 2023/WV_GRUNDLAGEN.BCH/Git/uebung4/wb_schachbr8x8_waag.pl').
pfad(senk,'C:/Users/admin/Desktop/Prolog 2023/WV_GRUNDLAGEN.BCH/Git/uebung4/wb_schachbr8x8_senk.pl').
pfad(kreu,'C:/Users/admin/Desktop/Prolog 2023/WV_GRUNDLAGEN.BCH/Git/uebung4/wb_schachbr8x8_kreu.pl').
pfad(diag,'C:/Users/admin/Desktop/Prolog 2023/WV_GRUNDLAGEN.BCH/Git/uebung4/wb_schachbr8x8_diag.pl').
pfad(laby,'C:/Users/admin/Desktop/Prolog 2023/WV_GRUNDLAGEN.BCH/Git/uebung4/wb_schachbr8x8_laby.pl').
pfad(zick,'C:/Users/admin/Desktop/Prolog 2023/WV_GRUNDLAGEN.BCH/Git/uebung4/wb_schachbr8x8_zick.pl').
pfad(rast,'C:/Users/admin/Desktop/Prolog 2023/WV_GRUNDLAGEN.BCH/Git/uebung4/wb_schachbr8x8_rast.pl').
/******************************************************************************/
/* Die zu konsultierenden Dateien enthalten die Faktenmenge des Prädikats     */
/* nb/2 (nachbarschaftsrelation) für die jeweilige Konfiguration der Schach-  */
/* brettwelt. Damit die Konfigurationen gelöscht und geladen werden können,   */
/* muss nb/2 als dynamisches Prädikat deklariert werden.                      */
/*----------------------------------------------------------------------------*/


/******************************************************************************/
/* Die Initialisierung der Wissensbasis erfolgt mit init/1.                   */
/*----------------------------------------------------------------------------*/
init(Name):- retractall(nb(_,_)),pfad(Name,P),consult(P).

/******************************************************************************/
/*                           Teil 1. Knoten- und Kantenanzahl                 */
/******************************************************************************/
/* Aufgabe 1.1: Definieren Sie das Prädikat alle_trans(<Name>,<Transanzahl>)  */
/*              zur Bestimmung der Anzahl der Übergänge für die Konfiguration */
/*              mit dem Namen <Name>.                                         */
/******************************************************************************/
alle_trans(NAME,N):- init(NAME),findall(F0-F1,nb(F0,F1),FL),length(FL,N).
/*                                 Testfälle                                  */
/*----------------------------------------------------------------------------*/
% alle_trans(ohne,N).  N = 224
% alle_trans(waag,N).  N =  76
% alle_trans(senk,N).  N =  76
% alle_trans(kreu,N).  N =  92
% alle_trans(diag,N).  N = 108
% alle_trans(laby,N).  N =  80
% alle_trans(zick,N).  N =  78
% alle_trans(rast,N).  N = 112
/******************************************************************************/
/* Aufgabe 1.2: Definieren Sie das Prädikat alle_knoten(<Name>,<KnotenAnzahl>)*/
/*              zur Bestimmung der der Knotenanzahl für die Konfiguration mit */
/*               dem Namen <Name>.                                            */
/******************************************************************************/
/*                                 Testfälle                                  */
/*----------------------------------------------------------------------------*/

alle_knoten(NAME,X):-init(NAME),setof(F,N^(nb(F,N);nb(N,F)),FL),writeln(FL),length(FL,X).

% alle_knoten(ohne,N).  N = 64
% alle_knoten(waag,N).  N = 38
% alle_knoten(senk,N).  N = 38
% alle_knoten(kreu,N).  N = 42
% alle_knoten(diag,N).  N = 48
% alle_knoten(laby,N).  N = 40
% alle_knoten(zick,N).  N = 40
% alle_knoten(rast,N).  N = 48
/******************************************************************************/
/*                             Teil 2. Blinde Suche                           */
/******************************************************************************/
/* Aufgabe 2: Tiefensuche                                                     */
/*----------------------------------------------------------------------------*/
/* Aufgabe 2.1: Tiefensuche ohne Zählung der Suchschritte                     */
/*----------------------------------------------------------------------------*/
/* Definieren Sie die Prädikat für die Tiefensuche ohne Zählung der Such-     */
/* schritte:                                                                  */
/* a) tiesu(<Name>,<START>,<ZIEL>,<WEG>)                                      */
/*          <Name>: Name der Datei mit der jeweiligen Schachbrettwelt         */
/*          <START>: Startkoordinaten der Suche.                              */
/*          <ZIEL>: Zielkoordinaten der Suche.                                */
/*          <WEG>: Pfad bei erfolgreicher Suche.                              */
/* b) tiesu_ex(+<START>,+<Akku>,+<Ziel>,-<Weg>)                               */
/*                                                                            */
/* Das Prädikat tiesu/4 initialisiert die Wissensbasis und ruft das Prädikat  */
/* tiesu_ex/4 mit dem Anfangswert für den Akku auf.                           */
/* tiesu_ex/4 realisiert die eigentliche Suche.                               */
/*----------------------------------------------------------------------------*/
  tiesu(NAME,KINIT,KZIEL,LISTE):-tiesu_ex(NAME,[KINIT],KZIEL,LISTE).
  tiesu_ex(_,[KZIEL|R],KZIEL,[KZIEL|R]).
  tiesu_ex(NAME,[K|R],KZIEL,WEGRESULT):-init(NAME),nb(K,Z),not(member(Z,[K|R])),tiesu_ex(NAME,[Z|[K|R]],KZIEL,WEGRESULT).






/* Bestimmen Sie damit für die 8 Konfigurationen jeweils die ersten Lösungen  */
/* der Suche mit START=k(1,1) und ZIEL=k(8,8).                                */
/* Überzeugen  Sie sich von der Korrektheit des gefunden Wegs und geben       */
/* dessen Länge an!                                                           */
/******************************************************************************/
/*                                 Testfälle                                  */
/*----------------------------------------------------------------------------*/
% time(tiesu(ohne,k(1,1),k(3,3),W)),print(W),length(W,L).
% 7,116 inferences, 0.000 CPU in 0.129 seconds (0% CPU, Infinite Lips)
% [k(1,1),k(2,1),k(3,1),k(4,1),k(5,1),k(6,1),k(7,1),k(8,1),k(8,2),k(7,2),k(6,2),k(5,2),k(4,2),k(3,2),k(2,2),k(1,2),k(1,3),k(2,3),k(3,3)]
% L = 19
% time(tiesu(waag,k(1,1),k(3,3),W)),print(W),length(W,L).
% % 941 inferences, 0.000 CPU in 0.000 seconds (?% CPU, Infinite Lips)
% [k(1,1),k(2,1),k(3,1),k(4,1),k(5,1),k(6,1),k(7,1),k(8,1),k(8,2),k(7,2),k(6,2),k(5,2),k(4,2),k(3,2),k(2,2),k(1,2),k(1,3),k(2,3),k(3,3)]
% L = 7
% time(tiesu(waag,k(1,1),k(8,8),W)),print(W),length(W,L).
% 3,933 inferences, 0.000 CPU in 0.234 seconds (0% CPU, Infinite Lips)
% [k(1,1),k(2,1),k(3,1),k(4,1),k(4,2),k(4,3),k(3,3),k(2,3),k(1,3),k(1,4),k(1,5),k(2,5),k(3,5),k(4,5),k(4,6),k(4,7),k(5,7),k(6,7),k(7,7),k(8,7),k(8,8)]
% L = 21
/*----------------------------------------------------------------------------*/
% tiesu(senk,k(1,1),k(8,8),W),print(W),length(W,L).
% [k(1,1),k(1,2),k(1,3),k(1,4),k(1,5),k(2,5),k(3,5),k(3,4),k(3,3),k(3,2),k(3,1),k(4,1),k(5,1),k(5,2),k(5,3),k(5,4),k(5,5),k(6,5),k(7,5),k(7,6),k(7,7),k(7,8),k(8,8)]
% L = 23
% tiesu(kreu,k(1,1),k(8,8),W),print(W),length(W,L).
% [k(1,1),k(1,2),k(1,3),k(2,3),k(3,3),k(3,4),k(4,4),k(5,4),k(5,5),k(6,5),k(6,6),k(6,7),k(7,7),k(8,7),k(8,8)]
% L = 15
% tiesu(diag,k(1,1),k(8,8),W),print(W),length(W,L).
% [k(1,1),k(2,1),k(3,1),k(4,1),k(4,2),k(5,2),k(5,3),k(4,3),k(4,4),k(3,4),k(3,5),k(4,5),k(4,6),k(5,6),k(5,7),k(6,7),k(6,8),k(7,8),k(8,8)]
% L = 19
% tiesu(laby,k(1,1),k(8,8),W),print(W),length(W,L).
%    +---+---+---+---+---+---+---+---+
%  1 | S |-> |-> |-> |-> |-> |-> | + |
%    +---+---+---+---+---+---+---+---+
%  2 |   |###|###|###|###|###|###| | |
%    +---+---+---+---+---+---+---+---+
%  3 |   |###|###| + | <-| <-| <-| + |
%    +---+---+---+---+---+---+---+---+
%  4 |   |   |###| | |###|###|###|###|
%    +---+---+---+---+---+---+---+---+
%  5 |###|   |###| + |-> |-> |-> | + |
%    +---+---+---+---+---+---+---+---+
%  6 |   |   |###|###|###|###|###| | |
%    +---+---+---+---+---+---+---+---+
%  7 |   |###|###|   |   |   |###| | |
%    +---+---+---+---+---+---+---+---+
%  8 |   |   |   |   |###|   |   | Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8    x
% [k(1,1),k(2,1),k(3,1),k(4,1),k(5,1),k(6,1),k(7,1),k(8,1),k(8,2),k(8,3),k(7,3),k(6,3),k(5,3),k(4,3),k(4,4),k(4,5),k(5,5),k(6,5),k(7,5),k(8,5),k(8,6),k(8,7),k(8,8)]
% L = 23
% tiesu(zick,k(1,1),k(8,8),W),print(W),length(W,L).
% [k(1,1),k(2,1),k(3,1),k(3,2),k(3,3),k(3,4),k(4,4),k(5,4),k(5,5),k(5,6),k(5,7),k(5,8),k(6,8),k(7,8),k(8,8)]
% L = 15
% tiesu(rast,k(1,1),k(8,8),W),print(W),length(W,L).
% [k(1,1),k(2,1),k(3,1),k(3,2),k(4,2),k(5,2),k(5,1),k(6,1),k(7,1),k(7,2),k(7,3),k(6,3),k(5,3),k(5,4),k(4,4),k(3,4),k(3,3),k(2,3),k(1,3),k(1,4),k(1,5),k(2,5),k(3,5),k(3,6),k(4,6),k(5,6),k(5,5),k(6,5),k(7,5),k(7,6),k(7,7),k(7,8),k(8,8)]
% L = 33
/******************************************************************************/
/*  Aufgabe 2.2. Tiefensuche mit Zählung aller Suchschritte                   */
/*----------------------------------------------------------------------------*/
/* Um alle auch die erfolglosen Suchschritte zu zählen, kann die Zählvariable */
/* nicht Argument des rekursiven Prädikats sein, weil dann nur die Länge des  */
/* ersten erfolgreichen Pfades bestimmt wird. Dies könnte man auch einfach    */
/* mitdem Prädikat length/2 realisieren.                                      */
/* Man benötigt eine vom Scheitern oder Erfolg des Beweisprozesses unabhängige*/
/* Variable. Diese kann man durch ein dynamisches Prädikat realisieren.       */
/* Dazu wird count_ts(<Anzahl>) benutzt, wobei <Anzahl> die Anzahl der Such-  */
/* schritte enthält. count_ts/1 muss als dynamisches Prädikat deklariert      */
/* werden. Außerdem sind zwei weitere Prädikate erforderlich                  */
/* a) init_count_ts, das <Anzahl> in count_ts/1 initialisiert und             */
/* b) incr_ts/0, das <Anzahl> in count_ts/1 inkrementiert                     */
/* Das Prädikat tiesuz(<Name>,<START>,<Ziel>,<Weg>) mit den gleichen          */
/* Parametern wie tiesu/4 realiserit die Initialisierung und ruft             */
/* tiesuz_ex(<Name>,<START>,<Ziel>,<Weg>) auf, das die eigentliche Suche      */
/* realisiert. Ansonsten unterscheiden sich tiesuz/4 bzw. tiesuz_ex/4 nicht   */
/* von tiesu/4 bzw. tiesu_ex/4.                                               */
/*----------------------------------------------------------------------------*/
/* Bestimmen Sie damit für die 8 Konfigurationen jeweils die ersten Lösungen  */
/* der Suche mit START=k(1,1) und ZIEL=k(8,8).                                */
/* Überzeugen  Sie sich von der Korrektheit des gefunden Wegs und geben       */
/* dessen Länge an!                                                           */
/******************************************************************************/
/*                                Testfälle                                   */
/*----------------------------------------------------------------------------*/
/*init_count_ts():-count_ts(0).
count_ts(P):-
incr_ts():-       */

% init_count_ts,tiesuz(ohne,k(1,1),k(8,8),W),print(W),length(W,L).
% 93 Suchschritte
% [k(1,1),k(2,1),k(3,1),k(4,1),k(5,1),k(6,1),k(7,1),k(8,1),k(8,2),k(7,2),k(6,2),k(5,2),k(4,2),k(3,2),k(2,2),k(1,2),k(1,3),k(2,3),k(3,3),k(4,3),k(5,3),k(6,3),k(7,3),k(8,3),k(8,4),k(7,4),k(6,4),k(5,4),k(4,4),k(3,4),k(2,4),k(1,4),k(1,5),k(2,5),k(3,5),k(4,5),k(5,5),k(6,5),k(7,5),k(8,5),k(8,6),k(7,6),k(6,6),k(5,6),k(4,6),k(3,6),k(2,6),k(1,6),k(1,7),k(2,7),k(3,7),k(4,7),k(5,7),k(6,7),k(7,7),k(8,7),k(8,8)]
% L = 57
% init_count_ts,tiesuz(waag,k(1,1),k(8,8),W),print(W),length(W,L).
% 46 Suchschritte
% [k(1,1),k(1,2),k(1,3),k(1,4),k(1,5),k(2,5),k(3,5),k(3,4),k(3,3),k(3,2),k(3,1),k(4,1),k(5,1),k(5,2),k(5,3),k(5,4),k(5,5),k(6,5),k(7,5),k(7,6),k(7,7),k(7,8),k(8,8)]
% L = 23
% init_count_ts,tiesuz(senk,k(1,1),k(8,8),W),print(W),length(W,L).
% 46 Suchschritte
% [k(1,1),k(1,2),k(1,3),k(1,4),k(1,5),k(2,5),k(3,5),k(3,4),k(3,3),k(3,2),k(3,1),k(4,1),k(5,1),k(5,2),k(5,3),k(5,4),k(5,5),k(6,5),k(7,5),k(7,6),k(7,7),k(7,8),k(8,8)]
% L = 23 .
% init_count_ts,tiesuz(kreu,k(1,1),k(8,8),W),print(W),length(W,L).
% 126 Suchschritte
% [k(1,1),k(1,2),k(1,3),k(2,3),k(3,3),k(3,4),k(4,4),k(5,4),k(5,5),k(6,5),k(6,6),k(6,7),k(7,7),k(8,7),k(8,8)]
% L = 15
% init_count_ts,tiesuz(diag,k(1,1),k(8,8),W),print(W),length(W,L).
% 64 Suchschritte
% [k(1,1),k(2,1),k(3,1),k(4,1),k(4,2),k(5,2),k(5,3),k(4,3),k(4,4),k(3,4),k(3,5),k(4,5),k(4,6),k(5,6),k(5,7),k(6,7),k(6,8),k(7,8),k(8,8)]
% L = 19
% init_count_ts,tiesuz(laby,k(1,1),k(8,8),W),print(W),length(W,L).
% 38 Suchschritte
% [k(1,1),k(2,1),k(3,1),k(4,1),k(5,1),k(6,1),k(7,1),k(8,1),k(8,2),k(8,3),k(7,3),k(6,3),k(5,3),k(4,3),k(4,4),k(4,5),k(5,5),k(6,5),k(7,5),k(8,5),k(8,6),k(8,7),k(8,8)]
% L = 23
% [k(1,1),k(2,1),k(3,1),k(4,1),k(5,1),k(6,1),k(7,1),k(8,1),k(8,2),k(7,2),k(7,3),k(6,3),k(5,3),k(4,3),k(4,4),k(4,5),k(5,5),k(6,5),k(7,5),k(8,5),k(8,6),k(7,6),k(7,7),k(8,7),k(8,8)]
% L = 25
% init_count_ts,tiesuz(zick,k(1,1),k(8,8),W),print(W),length(W,L).
% 39 Suchschritte
% [k(1,1),k(2,1),k(3,1),k(3,2),k(3,3),k(3,4),k(4,4),k(5,4),k(5,5),k(5,6),k(5,7),k(5,8),k(6,8),k(7,8),k(8,8)]
% L = 15
% init_count_ts,tiesuz(rast,k(1,1),k(8,8),W),print(W),length(W,L).
% 88 Suchschritte
% [k(1,1),k(2,1),k(3,1),k(3,2),k(4,2),k(5,2),k(5,1),k(6,1),k(7,1),k(7,2),k(7,3),k(6,3),k(5,3),k(5,4),k(4,4),k(3,4),k(3,3),k(2,3),k(1,3),k(1,4),k(1,5),k(2,5),k(3,5),k(3,6),k(4,6),k(5,6),k(5,5),k(6,5),k(7,5),k(7,6),k(7,7),k(7,8),k(8,8)]
% L = 33
/******************************************************************************/
/*  Aufgabe 2.3. Tiefensuche mit Tiefenbegrenzung                             */
/*----------------------------------------------------------------------------*/
/* Bei der einfachen Tiefensuche kehrt die Suche immer erst dann um, wenn es  */
/* nicht weitergeht. Das führt meist aber nicht immer zu unnötig langen Wegen.*/
/* Die Lösung besteht darin die Suchtiefe zu begrenzen. Scheitert die Suche   */
/* bei dieser Begrenzung, wird der zulässige Wert der Suchtiefe inkrementiert.*/
/* Damit kann der zulässige Wert der Suchtiefe schrittweise einen Maximalwert */
/* erreichen, der nicht überschritten werden soll. In diesem Fall scheitert   */
/* dann die Suche. Damit benötigt das Prädikat zur Tiefensuche zwei zusätz-   */
/* liche Parameter - den Wert der zulässigen Suchtiefe <Zul_Tiefe> und den    */
/* Wert, um den die zulässige Suchtiefe schrittweise erhöht wird:             */
/* <Incr_zul_Tiefe>.                                                          */
/*----------------------------------------------------------------------------*/
/* Definieren Sie die Prädikate                                               */
/* a) b_tiesu(<Name>,<START>,<Ziel>,<Zul_Tiefe>,<Incr_zul_Tiefe>,<Weg>), das  */
/*    die Wissensbasis entsprechend <Name> lädt und b_tiesu_z/5 aufruft.      */
/* b) b_tiesu_z(<START>,<Ziel>,<Zul_Tiefe>,<Incr_zul_Tiefe>,<Weg>), das       */
/*    rekursiv den Anfangswert der zulässigen Tiefe <Zul_Tiefe> mit           */
/*    <Incr_zul_Tiefe> solange inkrementiert, bis die eigentliche             */
/*    Tiefensuche mit b_tiesu_ex/6 erfolgreich ist. Dabei überprüft           */
/*    b_tiesu_z/5, ob der aktuelle Wert von <Zul_Tiefe> einen festgelegten    */
/*    Maximalwert nicht überschreitet. Dieser Maximalwert wird hier mit 100   */
/*    fest eingestellt. Wenn der Maximalwert noch nicht überschritten ist,    */
/*    wird b_tiesu_ex/6 mit dem aktuellen Wert von <Zul_Tiefe> aufgerufen.    */
/* c) b_tiesu_ex(<START>,<Ziel>,<Akku>,<Max_tiefe>,<Akt_Tiefe>,<Weg>), das    */
/*    die Tiefensuch mit der aktuellen maximalen Suchtiefe <Max_tiefe>        */
/*    durchführt. Wenn b_tiesu_ex/6 damit scheitert, so wird der Wert von     */
/*    <Akt_Tiefe> um 1 erhöht und  b_tiesu_z/5 mit dem neuen Wert rekursiv    */
/*    aufgerufen. Das setzt sich solange fort bis entweder b_tiesu_ex/6       */
/*    erfolgreich ist oder der Wert von <Zul_Tiefe> den gegebenen Maximalwert */
/*    überschreitet.                                                          */
/*----------------------------------------------------------------------------*/
/* Bestimmen Sie damit für die 8 Konfigurationen jeweils die ersten Lösungen  */
/* der Suche mit START=k(1,1) und ZIEL=k(8,8).                                */
/* Überzeugen  Sie sich von der Korrektheit des gefunden Wegs und geben       */
/* dessen Länge an!                                                           */
/******************************************************************************/
/*                                 Testfälle                                  */
/*----------------------------------------------------------------------------*/
/* Tiefensuche mit Tiefenbegrenzung ohne Hindernisse                          */
/*----------------------------------------------------------------------------*/
% b_tiesu(ohne,k(1,1),k(3,3),4,2,W),print(W),length(W,L).
% [k(1,1),k(2,1),k(3,1),k(3,2),k(3,3)]
% L = 5.
% time(b_tiesu(ohne,k(1,1),k(8,8),4,2,W)),print(W),length(W,L).   ->L=15
% 1,107,380 inferences, 0.234 CPU in 0.484 seconds (48% CPU, 4732363 Lips)
% [k(1,1),k(2,1),k(3,1),k(4,1),k(5,1),k(6,1),k(7,1),k(8,1),k(8,2),k(8,3),k(8,4),k(8,5),k(8,6),k(8,7),k(8,8)]
% L = 15.
/*----------------------------------------------------------------------------*/
/* Tiefensuche mit Tiefenbegrenzung mit waagerechten Hindernissen             */
/*----------------------------------------------------------------------------*/
% b_tiesu(waag,k(1,1),k(8,8),4,2,W),print(W),length(W,L).
% [k(1,1),k(2,1),k(3,1),k(4,1),k(4,2),k(4,3),k(3,3),k(2,3),k(1,3),k(1,4),k(1,5),k(2,5),k(3,5),k(4,5),k(4,6),k(4,7),k(5,7),k(6,7),k(7,7),k(8,7),k(8,8)]
% L = 21.
/*----------------------------------------------------------------------------*/
/* Tiefensuche mit Tiefenbegrenzung mit senkrechten Hindernissen              */
/*----------------------------------------------------------------------------*/
% b_tiesu(senk,k(1,1),k(8,8),4,2,W),print(W),length(W,L).
% [k(1,1),k(1,2),k(1,3),k(1,4),k(1,5),k(2,5),k(3,5),k(3,6),k(3,7),k(3,8),k(4,8),k(5,8),k(5,7),k(5,6),k(5,5),k(6,5),k(7,5),k(7,6),k(7,7),k(7,8),k(8,8)]
% L = 21.
/*----------------------------------------------------------------------------*/
/* Tiefensuche mit Tiefenbegrenzung mit kreuzförmigen Hindernissen            */
/*----------------------------------------------------------------------------*/
% b_tiesu(kreu,k(1,1),k(8,8),4,2,W),print(W),length(W,L).
% [k(1,1),k(1,2),k(1,3),k(2,3),k(3,3),k(3,4),k(4,4),k(5,4),k(6,4),k(6,5),k(6,6),k(6,7),k(7,7),k(8,7),k(8,8)]
% L = 15.
/*----------------------------------------------------------------------------*/
/* Tiefensuche mit Tiefenbegrenzung mit diagonalen Hindernissen               */
/*----------------------------------------------------------------------------*/
% b_tiesu(diag,k(1,1),k(8,8),4,2,W),length(W,L).         L = 15.
/*----------------------------------------------------------------------------*/
/* Tiefensuche mit Tiefenbegrenzung im Labyrinth                              */
/*----------------------------------------------------------------------------*/
% b_tiesu(laby,k(1,1),k(8,8),4,2,W),length(W,L).           L=19
/*----------------------------------------------------------------------------*/
/* Tiefensuche mit Tiefenbegrenzung Zick-Zack-Hinderniss                      */
/*----------------------------------------------------------------------------*/
% b_tiesu(zick,k(1,1),k(8,8),4,2,W),length(W,L).           L=15
/*----------------------------------------------------------------------------*/
/* Tiefensuche mit Tiefenbegrenzung Raster-Hinderniss                         */
/*----------------------------------------------------------------------------*/
% b_tiesu(rast,k(1,1),k(8,8),4,2,W),length(W,L).           L=15
/******************************************************************************/
/* Aufgabe 2.4. Breitensuche                                                  */
/*----------------------------------------------------------------------------*/
/* Definieren Sie die Prädikate für die Breitensuche                          */
/* a) breisu(<Name>,<Start>,<Ziel>,<Weg>), das die Initialisierungen für die  */
/*    eigentliche Breitensuche vornimmt, indem es das Prädikat breisu_ex/4    */
/*    aufruft.                                                                */
/* b) breisu_ex(<Start>,<Akku>,<Ziel>,<Weg>) realisiert die Breitensuche,     */
/*    indem es zuerst alle Knoten einer Ebene durchsucht, bevor es den        */
/*    nächsten Schritt in die Tiefe geht.                                     */
/*----------------------------------------------------------------------------*/
/* Bestimmen Sie damit für die 8 Konfigurationen jeweils die ersten Lösungen  */
/* der Suche mit START=k(1,1) und ZIEL=k(8,8).                                */
/* Überzeugen  Sie sich von der Korrektheit des gefunden Wegs und geben       */
/* dessen Länge an!                                                           */
/* Denken Sie daran, dass die Breitensuche oft mehr Zeit benötigt als die     */
/* Tiefensuche, weil sie alle Möglichkeiten auslotet. Das kann schon bei      */
/* diesen 8x8-Graphen einige Minuten daueren.                                 */
/******************************************************************************/
/*                                 Testfälle                                  */
/*----------------------------------------------------------------------------*/
/* Breitensuche ohne Hindernisse ACHTUNG: LANGE LAUFZEIT                      */
/*----------------------------------------------------------------------------*/
% time(breisu(ohne,k(1,1),k(3,3),W)). W = [k(1, 1), k(2, 1), k(3, 1), k(3, 2), k(3, 3)].
% 970 inferences, 0.000 CPU in 0.000 seconds
% time(breisu(ohne,k(1,1),k(8,8),W)),print(W),length(W,N).
% 11,453,145,928 inferences, 1324.542 CPU in 1326.829 seconds (100% CPU, 8646872 Lips)
% [k(1,1),k(2,1),k(3,1),k(4,1),k(5,1),k(6,1),k(7,1),k(8,1),k(8,2),k(8,3),k(8,4),k(8,5),k(8,6),k(8,7),k(8,8)]
% N = 15.
/*----------------------------------------------------------------------------*/
/* Breitensuche mit waagrechten Hindernissen                                  */
/*----------------------------------------------------------------------------*/
% time(breisu(waag,k(4,3),k(4,5),W)),print(W),length(W,L).
% 3,850 inferences, 0.000 CPU in 0.234 seconds (0% CPU, Infinite Lips)
% [k(4,3),k(3,3),k(2,3),k(1,3),k(1,4),k(1,5),k(2,5),k(3,5),k(4,5)]
% L = 9.
% time(breisu(waag,k(1,1),k(8,8),W)),print(W),length(W,L).
% 5,224 inferences, 0.000 CPU in 0.234 seconds (0% CPU, Infinite Lips)
% [k(1,1),k(2,1),k(3,1),k(4,1),k(4,2),k(4,3),k(3,3),k(2,3),k(1,3),k(1,4),k(1,5),k(2,5),k(3,5),k(4,5),k(4,6),k(4,7),k(5,7),k(6,7),k(7,7),k(8,7),k(8,8)]
% L = 21.
/*----------------------------------------------------------------------------*/
/* Breitensuche mit senkrechten Hindernissen                                  */
/*----------------------------------------------------------------------------*/
% breisu(senk,k(3,4),k(5,4),W),print(W),length(W,L).
% [k(3,4),k(3,3),k(3,2),k(3,1),k(4,1),k(5,1),k(5,2),k(5,3),k(5,4)]
% L = 9.
% time(breisu(senk,k(1,1),k(8,8),W)),print(W),length(W,L).
% 5,173 inferences, 0.000 CPU in 0.250 seconds (0% CPU, Infinite Lips)
% [k(1,1),k(1,2),k(1,3),k(1,4),k(1,5),k(2,5),k(3,5),k(3,6),k(3,7),k(3,8),k(4,8),k(5,8),k(5,7),k(5,6),k(5,5),k(6,5),k(7,5),k(7,6),k(7,7),k(7,8),k(8,8)]
% L = 21.
/*----------------------------------------------------------------------------*/
/* Breitensuche mit kreuzförmigen Hindernissen                                */
/*----------------------------------------------------------------------------*/
% breisu(kreu,k(3,3),k(5,5),W),print(W),length(W,L).
% [k(3,3),k(3,4),k(4,4),k(5,4),k(5,5)]
% L = 5.
% time(breisu(kreu,k(1,1),k(8,8),W)),print(W),length(W,N).
% 29,319 inferences, 0.031 CPU in 0.250 seconds (13% CPU, 939706 Lips)
% [k(1,1),k(1,2),k(1,3),k(2,3),k(3,3),k(3,4),k(4,4),k(5,4),k(5,5),k(6,5),k(6,6),k(6,7),k(7,7),k(8,7),k(8,8)]
% N = 15.
/*----------------------------------------------------------------------------*/
/* Breitensuche mit diagonalen Hindernissen                                   */
/*----------------------------------------------------------------------------*/
% time(breisu(diag,k(1,1),k(8,8),W)),print(W),length(W,L).
% 39,484 inferences, 0.016 CPU in 0.281 seconds (6% CPU, 2531009 Lips)
% [k(1,1),k(2,1),k(3,1),k(4,1),k(4,2),k(5,2),k(5,3),k(5,4),k(6,4),k(6,5),k(7,5),k(8,5),k(8,6),k(8,7),k(8,8)]
% L = 15.
/*----------------------------------------------------------------------------*/
/* Breitensuche mit Labyrinth                                                 */
/*----------------------------------------------------------------------------*/
% time(breisu(laby,k(1,1),k(8,8),W)),print(W),length(W,L).
% 4,464 inferences, 0.000 CPU in 0.234 seconds (0% CPU, Infinite Lips)
% [k(1,1),k(1,2),k(1,3),k(1,4),k(2,4),k(2,5),k(2,6),k(1,6),k(1,7),k(1,8),k(2,8),k(3,8),k(4,8),k(4,7),k(5,7),k(6,7),k(6,8),k(7,8),k(8,8)]
% L = 19.
% 9,222 inferences, 0.016 CPU in 0.250 seconds (6% CPU, 591150 Lips)
% [k(1,1),k(2,1),k(3,1),k(4,1),k(5,1),k(6,1),k(7,1),k(7,2),k(7,3),k(7,4),k(7,5),k(8,5),k(8,6),k(8,7),k(8,8)]
% L = 15.
/*----------------------------------------------------------------------------*/
/* Breitensuche mit Zickzack-Hinderniss                                       */
/*----------------------------------------------------------------------------*/
% time(breisu(zick,k(1,1),k(8,8),W)),print(W),length(W,L).
% [k(1,1),k(2,1),k(3,1),k(3,2),k(3,3),k(3,4),k(4,4),k(5,4),k(5,5),k(5,6),k(5,7),k(5,8),k(6,8),k(7,8),k(8,8)]
% L=15
/*----------------------------------------------------------------------------*/
/* Breitensuche mit Raster-Hinderniss                                         */
/*----------------------------------------------------------------------------*/
% time(breisu(rast,k(1,1),k(8,8),W)),print(W),length(W,L).   L=15
% 60,583 inferences, 0.000 CPU in 0.000 seconds (?% CPU, Infinite Lips)
% [k(1,1),k(2,1),k(3,1),k(3,2),k(4,2),k(5,2),k(5,3),k(6,3),k(7,3),k(7,4),k(7,5),k(7,6),k(7,7),k(7,8),k(8,8)]
% L=15
/******************************************************************************/
/*  Aufgabe 2.5. Manhatten-Suche                                              */
/******************************************************************************/
/* Bei der Manhatten-Suche erfolgt eine monotone Annäherung an das Ziel, d.h. */
/* es geht nie rückwärts sondern nur vorwärts; entweder waagerecht oder       */
/* senkrecht jeweils einen Schritt näher zum Ziel.                            */
/* Deswegen scheitert diese Suche wenn es keinen Manhattan-Pfad von Start zum */
/* Ziel gibt. Der Vorteil ist, wenn es einen solchen Pfad gibt, dann ist er   */
/* garantiert der kürzeste.                                                   */
/*----------------------------------------------------------------------------*/
/* Definieren Sie die Prädikate                                               */
/* a) manht(<Name>,<START>,<ZIEL>,<WEG>) für die Initialisierung der          */
/*    Manhatten-Suche und                                                     */
/* b) manht_ex(<START>,<Akku>,<ZIEL>,<WEG>) für die Ausführung der Manhatten- */
/* Suche.                                                                     */
/*----------------------------------------------------------------------------*/
/* Bestimmen Sie damit für die 8 Konfigurationen jeweils die ersten Lösungen  */
/* der Suche mit START=k(1,1) und ZIEL=k(8,8).                                */
/* Überzeugen  Sie sich von der Korrektheit des gefunden Wegs und geben       */
/* dessen Länge an!                                                           */
/******************************************************************************/
/*                                 Testfälle                                  */
/*----------------------------------------------------------------------------*/
/* Manhatten-Suche ohne Hindernisse                                           */
/*----------------------------------------------------------------------------*/
% manht(ohne,k(1,1),k(8,8),W),print(W),length(W,L).
% [k(1,1),k(2,1),k(3,1),k(4,1),k(5,1),k(6,1),k(7,1),k(8,1),k(8,2),k(8,3),k(8,4),k(8,5),k(8,6),k(8,7),k(8,8)]
% L = 15
% manht(ohne,k(8,8),k(1,1),W),print(W),length(W,L).
% [k(8,8),k(7,8),k(6,8),k(5,8),k(4,8),k(3,8),k(2,8),k(1,8),k(1,7),k(1,6),k(1,5),k(1,4),k(1,3),k(1,2),k(1,1)]
% L = 15
/*----------------------------------------------------------------------------*/
/* Manhatten-Suche mit waagrechten Hindernissen                               */
/*----------------------------------------------------------------------------*/
% manht(waag,k(1,1),k(8,8),W),print(W),length(W,L). -> false
% k(1,1)k(2,1)k(3,1)k(4,1)k(5,1)k(6,1)k(7,1)k(8,1)
%                   k(4,2)k(4,3)k(5,3)k(6,3)k(7,3)k(8,3)k(8,4)k(8,5)
/*----------------------------------------------------------------------------*/
/* Manhatten-Suche mit senkrechten Hindernissen                               */
/*----------------------------------------------------------------------------*/
% manht(senk,k(1,1),k(8,8),W),print(W),length(W,L).  -> false
% k(1,1)k(1,2)k(1,3)k(1,4)k(1,5)k(2,5)k(3,5)k(3,6)k(3,7)k(3,8)k(4,8)k(5,8)
%                         k(1,6)k(1,7)k(1,8)
/*----------------------------------------------------------------------------*/
/* Manhatten-Suche mit kreuzförmigen Hindernissen                             */
/*----------------------------------------------------------------------------*/
% manht(kreu,k(1,1),k(8,8),W),nl,print(W),length(W,L).
% [k(1,1),k(1,2),k(1,3),k(2,3),k(3,3),k(3,4),k(4,4),k(5,4),k(5,5),k(6,5),k(6,6),k(6,7),k(7,7),k(8,7),k(8,8)]
% L = 15
% manht(kreu,k(8,8),k(1,1),W),nl,print(W),length(W,L).
% [k(8,8),k(8,7),k(7,7),k(6,7),k(6,6),k(6,5),k(5,5),k(4,5),k(4,4),k(3,4),k(2,4),k(1,4),k(1,3),k(1,2),k(1,1)]
% L = 15
/*----------------------------------------------------------------------------*/
/* Manhatten-Suche mit diagonalen Hindernissen                                */
/*----------------------------------------------------------------------------*/
% manht(diag,k(1,1),k(8,8),W),print(W),length(W,L).
% [k(1,1),k(2,1),k(3,1),k(4,1),k(5,1),k(6,1),k(7,1),k(8,1),k(8,2),k(8,3),k(8,4),k(8,5),k(8,6),k(8,7),k(8,8)]
% L = 15
% manht(diag,k(8,8),k(1,1),W),print(W),length(W,L).
% k(2,1)k(3,1)k(4,1)k(4,2)k(5,2)k(6,2)k(5,3)k(5,4)k(6,4)k(6,5)k(7,5)k(8,5)k(8,6)k(8,7)k(8,8)[k(1,1),k(2,1),k(3,1),k(4,1),k(4,2),k(5,2),k(5,3),k(5,4),k(6,4),k(6,5),k(7,5),k(8,5),k(8,6),k(8,7),k(8,8)]
% L = 15
/*----------------------------------------------------------------------------*/
/* Manhatten-Suche mit Labyrinth                                              */
/*----------------------------------------------------------------------------*/
% manht(laby,k(1,1),k(8,8),W),nl,print(W),length(W,L).  false.
% k(1,1,k(2,1)k(3,1)k(4,1)k(5,1)k(6,1)k(7,1)k(8,1)k(8,2)k(8,3)
%       k(1,2)k(1,3)k(1,4)k(2,4)k(2,5)k(2,6)
%    +---+---+---+---+---+---+---+---+
%  1 | S |-> |-> |-> |-> |-> |-> | + |
%    +---+---+---+---+---+---+---+---+
%  2 | | |###|###|###|###|###|###| + |
%    +---+---+---+---+---+---+---+---+
%  3 | | |###|###|   |   |   |   | ! |
%    +---+---+---+---+---+---+---+---+
%  4 | + | + |###|   |###|###|###|###|
%    +---+---+---+---+---+---+---+---+
%  5 |###| | |###|   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  6 |   | ! |###|###|###|###|###|   |
%    +---+---+---+---+---+---+---+---+
%  7 |   |###|###|   |   |   |###|   |
%    +---+---+---+---+---+---+---+---+
%  8 |   |   |   |   |###|   |   | Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8    x
/*----------------------------------------------------------------------------*/
/* Manhatten-Suche mit Zickzack-Hinderniss                                    */
/*----------------------------------------------------------------------------*/
% manht(zick,k(1,1),k(8,8),W),nl,print(W),length(W,L).
% [k(1,1),k(2,1),k(3,1),k(3,2),k(3,3),k(3,4),k(4,4),k(5,4),k(5,5),k(5,6),k(5,7),k(5,8),k(6,8),k(7,8),k(8,8)]
% L = 15
% manht(zick,k(8,8),k(1,1),W),nl,print(W),length(W,L).
% [k(8,8),k(7,8),k(6,8),k(5,8),k(5,7),k(5,6),k(5,5),k(5,4),k(4,4),k(3,4),k(3,3),k(3,2),k(3,1),k(2,1),k(1,1)]
% L = 15
/*----------------------------------------------------------------------------*/
/* Manhatten-Suche mit Raster-Hinderniss                                      */
/*----------------------------------------------------------------------------*/
% manht(rast,k(1,1),k(8,8),W),nl,print(W),length(W,L).
% [k(1,1),k(2,1),k(3,1),k(3,2),k(4,2),k(5,2),k(5,3),k(6,3),k(7,3),k(7,4),k(7,5),k(7,6),k(7,7),k(7,8),k(8,8)]
% L = 15
% manht(rast,k(8,8),k(1,1),W),nl,print(W),length(W,L).
% [k(8,8),k(7,8),k(7,7),k(6,7),k(5,7),k(5,6),k(4,6),k(3,6),k(3,5),k(2,5),k(1,5),k(1,4),k(1,3),k(1,2),k(1,1)]
% L = 15
/******************************************************************************/
/*                       3. Heuristische Suche                                */
/******************************************************************************/
/* Aufgabe 3.1. Hill Climb Suche                                              */
/******************************************************************************/
/* Die heuristische Suche "Hill Climb (Bergsteigen") ist wie Tiefensuche nur  */
/* anstelle des ersten Nachbarn des aktuellen Feldes wird der beste Nachbar   */
/* für den nächsten Schritt gewählt. Der beste Nachbar unter allen            */
/* verfügbaren Nachbarn wird mittels eines heuristischen Kriteriums gewählt.  */
/* Auf Grund der schachbrettartigen Struktur des Suchraumes wird die          */
/* Manhattan-Distanz zwischen aktuellem Feld und dem Zielfeld als             */
/* heuristisches Auswahkriterium benutzt, um die Suche zu minimieren.         */
/* Die Auswahl des besten Folgefeldes kann einfach durch Sortierung der Liste */
/* aller Nachbarfelder bezüglich des Auswahlkriteriums erfolgen. Der Kopf der */
/* sortierten Liste ist dann das beste Nachbarfeld.                           */
/* Im Fall, dass 2 Nachbarfelder die gleiche Minimalentfernung zum Ziel haben,*/
/* entscheidet dann der Zufall - genauer gesagt, die ursprüngliche Anordnung  */
/* der Element der zu sortierenden Liste, welcher Nachbar gewählt wird. Dabei */
/* kann dies entscheidend sein für den Sucherfolg. Eine erweiterte Form des   */
/* Algorithmus berücktichtigt dies, indem beim Scheitern der Suche bei        */
/* Benutzung des gewählten besten Nachbars, auf den gleich guten besten       */
/* Nachbar zurückgegangen und von diesem aus die Suche fortgesetzt wird.      */
/*----------------------------------------------------------------------------*/
/* Zur Sortierung der bewerteten Nachbarn können Sie das Prädikat System      */
/* prädikat keysort/2 benutzen. Dieses sortiert die Listenelemente einer      */
/* Liste wenn diese mit einem Sortierschlüssel in Form einer Zahl versehen    */
/* sind, die mit dem Listenelement ein Paar bildet.                           */
/* keysort([3-x,5-y,2-z,1-u,4-v,6-w],SL). => SL=[1-u,2-z,3-x,4-v,5-y,6-w].    */
/*----------------------------------------------------------------------------*/
/* Definieren Sie für die heuristische Suche Hill Climb die Prädikat          */
/* a) mnht_dist(<Ziel>,<Knoten>,<Distanz>-<Knoten>), das die Manhattan-Distanz*/
/*    des aktuellen Feldes zum Ziel-feld bestimmt,                            */
/* b) bewert_feld(<Feldliste>,<Ziel>,<Bewertete Feldliste>), das eine Liste   */
/*     von Feldern mit deren Manhattan-Distanz bewertet,                      */
/* c) bestes(<Bewertete Feldliste>,<Bestes Feld>), das aus der bewerteten     */
/*    Feldliste, das beste Feld auswählt,                                     */
/* d) hill_climb(<Name>,<Start>,<ZIEL>,<Weg>), das die Initialisierung für    */
/*    die Hill Climb Suche realisiert und                                     */
/*    hill_climb_ex(<Start>,<Akku>,<ZIEL>,<Weg>), das die Hill Climb Suche    */
/*    durchführt.                                                             */
/*----------------------------------------------------------------------------*/
/* Bestimmen damit die ersten Lösungen für die 8 Konfigurationen bei einer    */
/* Suche mit START=k(1,1) und ZIEL=k(8,8) bzw. ZIEL=k(8,8) und START=k(1,1).  */
/* Überzeugen Sie sich von der Korrektheit des gefunden Wegs und geben dessen */
/* Länge an!                                                                  */
/******************************************************************************/
/*                              Testfälle                                     */
/*----------------------------------------------------------------------------*/
/*                        Hill Climb ohne Hindernisse                         */
/*----------------------------------------------------------------------------*/
% hill_climb(ohne,k(1,1),k(8,8),W),print(W),length(W,L).
% [k(1,1),k(2,1),k(3,1),k(4,1),k(5,1),k(6,1),k(7,1),k(8,1),k(8,2),k(8,3),k(8,4),k(8,5),k(8,6),k(8,7),k(8,8)]
% L = 15
/*----------------------------------------------------------------------------*/
/* Hill Climb mit waagrechten Hindernissen                                    */
/*----------------------------------------------------------------------------*/
% hill_climb(waag,k(1,1),k(8,8),W),print(W),length(W,L). false
% k(2,1)k(3,1)k(4,1)k(5,1)k(6,1)k(7,1)k(8,1)  Sackgasse
% hill_climb(waag,k(4,3),k(4,5),W),nl,print(W),length(W,L).
% [k(4,3),k(3,3),k(2,3),k(1,3),k(1,4),k(1,5),k(2,5),k(3,5),k(4,5)]
% L = 9
/*----------------------------------------------------------------------------*/
/* Hill Climb mit senkrechten Hindernissen                                    */
/*----------------------------------------------------------------------------*/
% hill_climb(senk,k(3,4),k(5,4),W),print(W),length(W,L).
% W = [k(3, 4), k(3, 3), k(3, 2), k(3, 1), k(4, 1), k(5, 1), k(5, 2), k(5, 3), k(..., ...)],
% L = 9
% hill_climb(senk,k(1,1),k(8,8),W),nl,print(W),length(W,L).
% [k(1,1),k(1,2),k(1,3),k(1,4),k(1,5),k(2,5),k(3,5),k(3,6),k(3,7),k(3,8),k(4,8),k(5,8),k(5,7),k(5,6),k(5,5),k(6,5),k(7,5),k(7,6),k(7,7),k(7,8),k(8,8)]
% L = 21
/*----------------------------------------------------------------------------*/
/* Hill Climb mit kreuzförmigen Hindernissen                                  */
/*----------------------------------------------------------------------------*/
% hill_climb(kreu,k(1,1),k(8,8),W),print(W),length(W,L). false
% k(1,1)k(1,2)k(1,3)k(2,3)k(3,3)k(3,4)k(4,4)k(5,4)k(5,5)k(6,5)k(7,5)k(8,5) Sackgasse
%    +---+---+---+---+---+---+---+---+
%  1 | S |###|   |###|   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  2 | | |###|   |###|   |###|   |###|
%    +---+---+---+---+---+---+---+---+
%  3 | + |-> | + |###|   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  4 |   |   | + |-> | + |###|###|###|
%    +---+---+---+---+---+---+---+---+
%  5 |###|###|###|   | + |-> |-> |-> |
%    +---+---+---+---+---+---+---+---+
%  6 |   |###|   |   |###|   |###|###|
%    +---+---+---+---+---+---+---+---+
%  7 |   |   |   |   |###|   |   |   |
%    +---+---+---+---+---+---+---+---+
%  8 |   |###|   |   |###|   |###| Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8
/*----------------------------------------------------------------------------*/
/* Hill Climb mit diagonalen Hindernissen                                     */
/*----------------------------------------------------------------------------*/
% hill_climb(diag,k(1,1),k(8,8),W),print(W),length(W,N). false
% k(1,1)k(2,1)k(3,1)k(4,1)k(4,2)k(5,2)k(6,2)k(6,1)k(7,1) Sackgasse
%    +---+---+---+---+---+---+---+---+
%  1 | S |-> |-> | + |###| + |-> |###|
%    +---+---+---+---+---+---+---+---+
%  2 |   |###|   | + |-> | + |###|   |
%    +---+---+---+---+---+---+---+---+
%  3 |###|   |###|   |   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  4 |   |   |   |   |   |   |###|   |
%    +---+---+---+---+---+---+---+---+
%  5 |   |###|   |   |###|   |   |   |
%    +---+---+---+---+---+---+---+---+
%  6 |   |   |###|   |   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  7 |   |###|   |###|   |   |###|   |
%    +---+---+---+---+---+---+---+---+
%  8 |###|   |   |   |   |   |   | Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8    x
/*----------------------------------------------------------------------------*/
/* Hill Climb mit Labyrinth                                                   */
/*----------------------------------------------------------------------------*/
% hill_climb(laby,k(1,1),k(8,8),W),print(W),length(W,L).
% [k(1,1),k(2,1),k(3,1),k(4,1),k(5,1),k(6,1),k(7,1),k(8,1),k(8,2),k(8,3),k(7,3),k(6,3),k(5,3),k(4,3),k(4,4),k(4,5),k(5,5),k(6,5),k(7,5),k(8,5),k(8,6),k(8,7),k(8,8)]
% L = 23
%    +---+---+---+---+---+---+---+---+
%  1 | S |-> |-> |-> |-> |-> |-> | + |
%    +---+---+---+---+---+---+---+---+
%  2 |   |###|###|###|###|###|###| | |
%    +---+---+---+---+---+---+---+---+
%  3 |   |###|###| + | <-| <-| <-| + |
%    +---+---+---+---+---+---+---+---+
%  4 |   |   |###| | |###|###|###|###|
%    +---+---+---+---+---+---+---+---+
%  5 |###|   |###| + |-> |-> |-> | + |
%    +---+---+---+---+---+---+---+---+
%  6 |   |   |###|###|###|###|###| | |
%    +---+---+---+---+---+---+---+---+
%  7 |   |###|###|   |   |   |###| | |
%    +---+---+---+---+---+---+---+---+
%  8 |   |   |   |   |###|   |   | Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8    x
/*----------------------------------------------------------------------------*/
/* Hill Climb mit Zickzack-Hinderniss                                         */
/*----------------------------------------------------------------------------*/
% hill_climb(zick,k(1,1),k(8,8),W),print(W),length(W,N).  false
% k(1,1),k(2,1),k(3,1),k(3,2),k(3,3),k(3,4),k(4,4),k(5,4),k(5,5),k(6,5)
%    +---+---+---+---+---+---+---+---+
%  1 |-> |-> | + |###|   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  2 |   |###| | |###|   |###|###|   |
%    +---+---+---+---+---+---+---+---+
%  3 |   |###| | |###|   |   |###|   |
%    +---+---+---+---+---+---+---+---+
%  4 |   |###| + |-> | + |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  5 |   |###|   |###| + |!!!|###|   |
%    +---+---+---+---+---+---+---+---+
%  6 |   |###|   |###|   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  7 |   |###|   |###|   |###|###|###|
%    +---+---+---+---+---+---+---+---+
%  8 |   |   |   |###|   |   |   | Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8    x
/*----------------------------------------------------------------------------*/
/* Hill Climb mit Raster-Hinderniss                                           */
/*----------------------------------------------------------------------------*/
% hill_climb(rast,k(1,1),k(8,8),W),print(W),length(W,N).  false.
% k(1,1),k(2,1),k(3,1),k(3,2),k(4,2),k(5,2),k(5,3),k(6,3),k(7,3),k(7,4),k(8,4)
%    +---+---+---+---+---+---+---+---+
%  1 |-> |-> | + |###|   |   |   |###|
%    +---+---+---+---+---+---+---+---+
%  2 |   |###| + |-> | + |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  3 |   |   |   |###| + |-> | + |###|
%    +---+---+---+---+---+---+---+---+
%  4 |   |###|   |   |   |###| + |!!!|
%    +---+---+---+---+---+---+---+---+
%  5 |   |   |   |###|   |   |   |###|
%    +---+---+---+---+---+---+---+---+
%  6 |   |###|   |   |   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  7 |   |   |   |###|   |   |   |###|
%    +---+---+---+---+---+---+---+---+
%  8 |   |###|   |   |   |###|   | Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8    x
/******************************************************************************/
/*  Aufgabe 3.2. Bestensuche                                                  */
/******************************************************************************/
/* Bei der Bestsuche werden alle bisher durchlaufenen Pfade bewertet. Als     */
/* Bewertung wird wieder die Manhattan-Distanz zwischen dem aktuellen Feld    */
/* und dem Zielfeld genommen.                                                 */
/* Im Unterschied zu Hill Climbing, wo nur immer der beste Pfad gespeichert   */
/* wird, werden  bei der Bestsuche, auch die alternativen Pfade gespeichert.  */
/* Damit wird vermieden, dass die Suche in einer Sackgasse abgebrochen wird.  */
/*----------------------------------------------------------------------------*/
/* Definieren Sie die Prädikate                                               */
/* a) mnht_dist_pfad(<Ziel>,<Pfad>,<Distanz>-<Pfad>), das die Manhattan-      */
/*    Distanz des Pfadkopfes zum Ziel bestimmt.                               */
/* b) bewert_pfad(<Pfadliste>,<Ziel>,<Bewertete Pfadliste>), das eine Liste   */
/*    von Pfaden mit der Manhattan-Distanz bewertet.                          */
/* c) bestsu(<Name>,<Start>,<Ziel,Weg>), das die Initialisierung für die      */
/*    Bestensuche durchführt.                                                 */
/* c) bestsu_ex(<Start>,<Akku>,<Ziel,Weg>), das dieBestensuche durchführt.    */
/*                                                                            */
/* Bestimmen damit die ersten Lösungen für die 8 Konfigurationen bei einer    */
/* Suche mit START=k(1,1) und ZIEL=k(8,8) bzw. ZIEL=k(8,8) und START=k(1,1).  */
/* Überzeugen Sie sich von der Korrektheit des gefunden Wegs und geben dessen */
/* Länge an!                                                                  */
/******************************************************************************/
/*  Bestensuche Testfälle                                                     */
/******************************************************************************/
/* Bestensuche ohne Hindernisse                                               */
/*----------------------------------------------------------------------------*/
% bestsu(ohne,k(1,1),k(8,8),W),print(W),length(W,L).
% [k(1,1),k(2,1),k(2,2),k(3,2),k(3,3),k(4,3),k(4,4),k(5,4),k(5,5),k(6,5),k(6,6),k(7,6),k(7,7),k(8,7),k(8,8)]
% L = 15.
/*----------------------------------------------------------------------------*/
/* Bestensuche mit waagerechten Hindernissen                                  */
/*----------------------------------------------------------------------------*/
% bestsu(waag,k(1,1),k(8,8),W),print(W),length(W,L).
% [k(1,1),k(2,1),k(3,1),k(4,1),k(4,2),k(4,3),k(5,3),k(6,3),k(7,3),k(8,3),k(8,4),k(8,5),k(7,5),k(6,5),k(5,5),k(4,5),k(4,6),k(4,7),k(5,7),k(6,7),k(7,7),k(8,7),k(8,8)]
% L = 23.
/*----------------------------------------------------------------------------*/
/* Bestensuche mit senkrechten Hindernissen                                   */
/*----------------------------------------------------------------------------*/
% bestsu(senk,k(1,1),k(8,8),W),print(W),length(W,L).
% [k(1,1),k(1,2),k(1,3),k(1,4),k(1,5),k(2,5),k(3,5),k(3,6),k(3,7),k(3,8),k(4,8),k(5,8),k(5,7),k(5,6),k(5,5),k(6,5),k(7,5),k(7,6),k(7,7),k(7,8),k(8,8)]
% L = 21.
/*----------------------------------------------------------------------------*/
/* Bestensuche mit kreuzförmigen Hindernissen                                 */
/*----------------------------------------------------------------------------*/
% bestsu(kreu,k(1,1),k(8,8),W),print(W),length(W,L).
% [k(1,1),k(1,2),k(1,3),k(2,3),k(3,3),k(3,4),k(4,4),k(5,4),k(5,5),k(6,5),k(6,6),k(6,7),k(7,7),k(8,7),k(8,8)]
% L = 15.
/*----------------------------------------------------------------------------*/
/* Bestensuche mit diagonalen Hindernissen                                    */
/*----------------------------------------------------------------------------*/
% bestsu(diag,k(1,1),k(8,8),W),print(W),length(W,L).
% [k(1,1),k(2,1),k(3,1),k(4,1),k(4,2),k(5,2),k(5,3),k(5,4),k(6,4),k(6,5),k(7,5),k(8,5),k(8,6),k(8,7),k(8,8)]
% L = 15.
/*----------------------------------------------------------------------------*/
/* Bestensuche mit Labyrint                                                     */
/*----------------------------------------------------------------------------*/
% bestsu(laby,k(1,1),k(8,8),W),print(W),length(W,L).
% [k(1,1),k(2,1),k(3,1),k(4,1),k(5,1),k(6,1),k(7,1),k(8,1),k(8,2),k(8,3),k(7,3),k(6,3),k(5,3),k(4,3),k(4,4),k(4,5),k(5,5),k(6,5),k(7,5),k(8,5),k(8,6),k(8,7),k(8,8)]
% L = 23.
/*----------------------------------------------------------------------------*/
/* Bestensuche mit Zickzack Hinderniss                                        */
/*----------------------------------------------------------------------------*/
% bestsu(zick,k(1,1),k(8,8),W),print(W),length(W,L).
% [k(1,1),k(2,1),k(3,1),k(3,2),k(3,3),k(3,4),k(4,4),k(5,4),k(5,5),k(5,6),k(5,7),k(5,8),k(6,8),k(7,8),k(8,8)]
% L = 15.
/*----------------------------------------------------------------------------*/
/* Bestensuche mit Raster-Hinderniss                                          */
/*----------------------------------------------------------------------------*/
% bestsu(rast,k(1,1),k(8,8),W),print(W),length(W,L).
% [k(1,1),k(2,1),k(3,1),k(3,2),k(4,2),k(5,2),k(5,3),k(6,3),k(7,3),k(7,4),k(7,5),k(7,6),k(7,7),k(7,8),k(8,8)]
% L = 15.
/******************************************************************************/
/* Aufgabe 3.3. A*-Suche                                                      */
/******************************************************************************/
/* Bei der A*-Suche werden wie bei der Bestensuche alle Pfade bewertet und    */
/* gespeichert. Um zu vermeiden, dass ein Pfad für die Fortsetzung ausgewählt */
/* wird, der ziemliche nahe am Ziel aber schon sehr lang ist, weil er Umwege  */
/* enthält, geht in die Bewertung auch die Pfadlänge ein. Damit ist die       */
/* Bewertung = Länge des Pfades + Entfernung zum Ziel.                        */
/*----------------------------------------------------------------------------*/
/* Definieren Sie die Prädikate                                               */
/* a) distanz2(<Ziel>,<Pfad>,<Distanz>-<Pfad>), das die Summe aus der         */
/*    Manhattan-Distanz des Pfadkopfes zum Ziel plus der Pfadlänge bestimmt.  */
/* b) bew_ast_pfd(<PfadListe>,<ZIEL>,<Bewertete <PfadListe>),das eine Liste   */
/*    von Pfaden mit der Manhattan-Distanz + Pfdadlänge bewertet.             */
/* c) astern(<Name>,<Start>,<Ziel,Weg>), das die Initialisierung für die      */
/*    A*-Suche durchführt.                                                    */
/* c) astern_ex(<Start>,<Akku>,<Ziel,Weg>), das die A*-Suche durchführt.      */
/*                                                                            */
/* Bestimmen damit die ersten Lösungen für die 8 Konfigurationen bei einer    */
/* Suche mit START=k(1,1) und ZIEL=k(8,8) bzw. ZIEL=k(8,8) und START=k(1,1).  */
/* Überzeugen Sie sich von der Korrektheit des gefunden Wegs und geben dessen */
/* Länge an!                                                                  */
/******************************************************************************/
/*                                      Testfälle                             */
/*----------------------------------------------------------------------------*/
/* A*-Suche ohne Hindernisse                                                  */
/*----------------------------------------------------------------------------*/
% time(astern(ohne,k(1,1),k(8,8),W)),print(W),length(W,L).
% 69,102,412 inferences, 14.180 CPU in 14.468 seconds (98% CPU, 4873062 Lips)
% [k(1,1),k(2,1),k(3,1),k(4,1),k(5,1),k(6,1),k(7,1),k(8,1),k(8,2),k(8,3),k(8,4),k(8,5),k(8,6),k(8,7),k(8,8)]
% L = 15.
/*----------------------------------------------------------------------------*/
/* A*-Suche mit waagrechten Hindernissen                                      */
/*----------------------------------------------------------------------------*/
% time(astern(waag,k(1,1),k(8,8),W)),print(W),length(W,L).
% 4,788 inferences, 0.000 CPU in 0.234 seconds (0% CPU, Infinite Lips)
% [k(1,1),k(2,1),k(3,1),k(4,1),k(4,2),k(4,3),k(3,3),k(2,3),k(1,3),k(1,4),k(1,5),k(2,5),k(3,5),k(4,5),k(4,6),k(4,7),k(5,7),k(6,7),k(7,7),k(8,7),k(8,8)]
% L = 21.
/*----------------------------------------------------------------------------*/
/* A*-Suche mit senkrechten Hindernissen                                      */
/*----------------------------------------------------------------------------*/
% time(astern(senk,k(1,1),k(8,8),W)),print(W),length(W,L).
% 4,321 inferences, 0.016 CPU in 0.250 seconds (6% CPU, 276985 Lips)
% [k(1,1),k(1,2),k(1,3),k(1,4),k(1,5),k(2,5),k(3,5),k(3,6),k(3,7),k(3,8),k(4,8),k(5,8),k(5,7),k(5,6),k(5,5),k(6,5),k(7,5),k(7,6),k(7,7),k(7,8),k(8,8)]
% L = 21.
/*----------------------------------------------------------------------------*/
/* A*-Suche mit kreuzförmigen Hindernissen                                    */
/*----------------------------------------------------------------------------*/
% time(astern(kreu,k(1,1),k(8,8),W)),print(W),length(W,L).
% 9,491 inferences, 0.000 CPU in 0.250 seconds (0% CPU, Infinite Lips)
% [k(1,1),k(1,2),k(1,3),k(2,3),k(3,3),k(3,4),k(4,4),k(5,4),k(5,5),k(6,5),k(6,6),k(6,7),k(7,7),k(8,7),k(8,8)]
% L = 15.
/*----------------------------------------------------------------------------*/
/* A*-Suche mit diagonalen Hindernissen                                       */
/*----------------------------------------------------------------------------*/
% time(astern(diag,k(1,1),k(8,8),W)),print(W),length(W,L).
% 12,403 inferences, 0.000 CPU in 0.234 seconds (0% CPU, Infinite Lips)
% [k(1,1),k(2,1),k(3,1),k(4,1),k(4,2),k(5,2),k(5,3),k(5,4),k(6,4),k(6,5),k(7,5),k(8,5),k(8,6),k(8,7),k(8,8)]
% L = 15.
/*----------------------------------------------------------------------------*/
/* A*-Suche mit Labyrinth                                                     */
/*----------------------------------------------------------------------------*/
% time(astern(laby,k(1,1),k(8,8),W)),print(W),length(W,L).
% 4,478 inferences, 0.000 CPU in 0.234 seconds (0% CPU, Infinite Lips)
% [k(1,1),k(1,2),k(1,3),k(1,4),k(2,4),k(2,5),k(2,6),k(1,6),k(1,7),k(1,8),k(2,8),k(3,8),k(4,8),k(4,7),k(5,7),k(6,7),k(6,8),k(7,8),k(8,8)]
% L = 19.
/*----------------------------------------------------------------------------*/
/* A*-Suche mit Zickzack Hinderniss                                           */
/*----------------------------------------------------------------------------*/
% time(astern(zick,k(1,1),k(8,8),W)),print(W),length(W,L).
% 4,150 inferences, 0.016 CPU in 0.250 seconds (6% CPU, 266024 Lips)
% [k(1,1),k(2,1),k(3,1),k(3,2),k(3,3),k(3,4),k(4,4),k(5,4),k(5,5),k(5,6),k(5,7),k(5,8),k(6,8),k(7,8),k(8,8)]
% L = 15.
/*----------------------------------------------------------------------------*/
/* A*-Suche mit Raster-Hinderniss                                             */
/*----------------------------------------------------------------------------*/
% time(astern(rast,k(1,1),k(8,8),W)),print(W),length(W,L).
% 13,520 inferences, 0.016 CPU in 0.250 seconds (6% CPU, 866661 Lips)
% [k(1,1),k(2,1),k(3,1),k(3,2),k(4,2),k(5,2),k(5,3),k(6,3),k(7,3),k(7,4),k(7,5),k(7,6),k(7,7),k(7,8),k(8,8)]
% L = 15.
/******************************************************************************/
/* Aufgabe 8: Stellen Sie die Ergebnisse der Suche von k(1,1) nach k(8,8) für */
/*            alle 7 Suchalgorithmen und alle 8 Kofigurationen in einer       */
/*            Tabelle zusammen.                                               */
/*                                                                            */
/* -----------+-----+-----+-----+-----+-----+-----+-----+-----+               */
/*  Pfadlänge |ohne |waag |senk |kreu |diag |laby |zick |rast |               */
/* -----------+-----+-----+-----+-----+-----+-----+-----+-----+               */
/* tiesu      |     |     |     |     |     |     |     |     |               */
/* tiesumTB   |     |     |     |     |     |     |     |     | T=<4,Incr=2   */
/* breisu     |     |     |     |     |     |     |     |     |               */
/* manht      |     |     |     |     |     |     |     |     |               */
/* hill_climb |     |     |     |     |     |     |     |     |               */
/* bestsu     |     |     |     |     |     |     |     |     |               */
/* astern     |     |     |     |     |     |     |     |     |               */
/******************************************************************************/

