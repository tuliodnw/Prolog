/******************************************************************************/
/*           Aufgabe 4: Suche in Schachbrettwelt mit der Dimension 8          */
/*----------------------------------------------------------------------------*/
/* Die Schachbrettwelt ist durch eine Nachbarschaftsrelation zwischen den     */
/* Feldern gegeben. Jedes Feld au�er den Randfeldern hat 4 Nachbarfelder.     */
/* Die Felder sind durch Angabe ihrer x-y-Koordinaten gekennzeichnet. Eine    */
/* Verbindung zwischen den Feldern (x1,y1),k(x2,y2) wird durch den Fakt       */
/* nb(k(x1,y1),k(x2,Y2)) in der Wissensbasis repr�sentiert.                   */
/* Es gibt 5 Modifikationen dieser Schachbrettwelt, die durch verschiedene    */
/* Hindernisse gebildet werden, die die Anzahl der �berg�nge begrenzen.       */
/******************************************************************************/
/*  1. Welt ohne Hindernisse: Alle �berg�nge sind verf�gbar                   */
/******************************************************************************/
/*  2. Welt mit waagerechtem Hinterniss                                       */
/*----------------------------------------------------------------------------*/
%  y
%    +---+---+---+---+---+---+---+---+
%  1 | S |   |   |   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  2 |   |   |   |   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  3 |   |   |   |   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  4 |   |###|###|###|###|###|###|   |
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
/*  3. Welt mit senkrechtem Hinterniss                                        */
/*----------------------------------------------------------------------------*/
%  y
%    +---+---+---+---+---+---+---+---+
%  1 | S |   |   |   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  2 |   |   |   |###|   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  3 |   |   |   |###|   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  4 |   |   |   |###|   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  5 |   |   |   |###|   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  6 |   |   |   |###|   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  7 |   |   |   |###|   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  8 |   |   |   |   |   |   |   | Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8    x
%
/******************************************************************************/
/*  4. Welt mit kreuzf�rmigen Hinterniss                                      */
/*----------------------------------------------------------------------------*/
%  y
%    +---+---+---+---+---+---+---+---+
%  1 | S |   |   |   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  2 |   |   |   |###|   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  3 |   |   |   |###|   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  4 |   |###|###|###|###|###|###|   |
%    +---+---+---+---+---+---+---+---+
%  5 |   |   |   |###|   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  6 |   |   |   |###|   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  7 |   |   |   |###|   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  8 |   |   |   |   |   |   |   | Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8    x
%
/******************************************************************************/
/*  5. Welt mit Diagonal-Hinterniss                                           */
/*----------------------------------------------------------------------------*/
%  y
%    +---+---+---+---+---+---+---+---+
%  1 | S |   |   |   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  2 |   |###|   |   |   |   |###|   |
%    +---+---+---+---+---+---+---+---+
%  3 |   |   |###|   |   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  4 |   |   |   |###|###|   |   |   |
%    +---+---+---+---+---+---+---+---+
%  5 |   |   |   |###|###|   |   |   |
%    +---+---+---+---+---+---+---+---+
%  6 |   |   |###|   |   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  7 |   |###|   |   |   |   |###|   |
%    +---+---+---+---+---+---+---+---+
%  8 |   |   |   |   |   |   |   | Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8    x
%
/******************************************************************************/
/*  6. Welt mit Labyrinth                                                     */
/*----------------------------------------------------------------------------*/
%  y
%    +---+---+---+---+---+---+---+---+
%  1 | S |   |   |   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  2 |   |###|###|###|###|###|###|   |
%    +---+---+---+---+---+---+---+---+
%  3 |   |###|###|   |   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  4 |   |   |   |###|###|###|###|   |
%    +---+---+---+---+---+---+---+---+
%  5 |   |###|###|###|###|   |   |   |
%    +---+---+---+---+---+---+---+---+
%  6 |   |   |###|   |   |   |###|   |
%    +---+---+---+---+---+---+---+---+
%  7 |   |###|###|###|###|   |   |###|
%    +---+---+---+---+---+---+---+---+
%  8 |   |   |   |   |###|###|   | Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8    x
%
/******************************************************************************/
/*  7. Welt mit Zickzack-Hinternissen                                         */
/*----------------------------------------------------------------------------*/
%  y
%    +---+---+---+---+---+---+---+---+
%  1 | S |   |   |###|   |   |   |   |
%    +---+---+---+---+---+---+---+---+
%  2 |   |###|   |###|   |###|###|   |
%    +---+---+---+---+---+---+---+---+
%  3 |   |###|   |###|   |   |###|   |
%    +---+---+---+---+---+---+---+---+
%  4 |   |###|   |   |   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  5 |   |###|   |###|   |   |###|   |
%    +---+---+---+---+---+---+---+---+
%  6 |   |###|   |###|   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  7 |   |###|   |###|   |###|###|###|
%    +---+---+---+---+---+---+---+---+
%  8 |   |   |   |###|   |   |   | Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8    x
%
/******************************************************************************/
/* In den Schemata sind mit S bzw. Z Start und Ziel f�r die Suche angegeben.  */
/******************************************************************************/
/* Die jeweilige Wissensbasis kann durch folgendes Pr�dikat geladen werden,   */
/* wobei N=Abk�rzung des Dateinamens: member(N,[o_h,w_h,s_h,k_h,d_h,l_h,z_h]).*/
/*----------------------------------------------------------------------------*/
init(N):- retractall(nb(_,_)),pfad(N,P),consult(P).
/*----------------------------------------------------------------------------*/
pfad(o_h,'Q:/STIEFEL/WV_GRUNDLAGEN.BCH/uebung4/wb_schachbrett88').             % ohne Hinderniss
pfad(w_h,'Q:/STIEFEL/WV_GRUNDLAGEN.BCH/uebung4/wb_schachbrett88_w_hinderniss').% mit waagr. Hinderniss
pfad(s_h,'Q:/STIEFEL/WV_GRUNDLAGEN.BCH/uebung4/wb_schachbrett88_s_hinderniss').% mit senkr. Hinderniss
pfad(k_h,'Q:/STIEFEL/WV_GRUNDLAGEN.BCH/uebung4/wb_schachbrett88_k_hinderniss').% mit kreuz. Hinderniss
pfad(d_h,'Q:/STIEFEL/WV_GRUNDLAGEN.BCH/uebung4/wb_schachbrett88_d_hinderniss').% mit diagn. Hinderniss
pfad(l_h,'Q:/STIEFEL/WV_GRUNDLAGEN.BCH/uebung4/wb_schachbrett88_l_hinderniss').% mit Labyr. Hinderniss
pfad(r_h,'Q:/STIEFEL/WV_GRUNDLAGEN.BCH/uebung4/wb_schachbrett88_r_hinderniss').% mit Raster Hinderniss
pfad(z_h,'Q:/STIEFEL/WV_GRUNDLAGEN.BCH/uebung4/wb_schachbrett88_z_hinderniss').% mit Zizac. Hinderniss
/******************************************************************************/
/* Aufgabe 1: Bestimmen Sie die Anzahl der �berg�nge f�r die 7 Konfigurationen*/
/*----------------------------------------------------------------------------*/
/* Aufgabe 2: Definieren Sie ein Pr�dikat f�r die Tiefensuche tiesu und       */
/*            bestimmen damit f�r die 8 Konfigurationen jeweils die ersten    */
/*            L�sungen bei einer Suche mit START=k(1,1) und ZIEL=k(8,8).      */
/*            �berzeugen  Sie sich von der Korrektheit des gefunden Wegs und  */
/*            geben dessen L�nge an!                                          */
/*----------------------------------------------------------------------------*/
/* Aufgabe 3: Definieren Sie ein Pr�dikat f�r die Breitensuche breisu und     */
/*            bestimmen damit die ersten L�sungen f�r die 7 Konfigurationen   */
/*            bei einer Suche mit START=k(1,1) und ZIEL=k(8,8). �berzeugen    */
/*            Sie sich von der Korrektheit des gefunden Wegs und geben dessen */
/*            L�nge an!                                                       */
/*----------------------------------------------------------------------------*/
/* Aufgabe 4: Definieren Sie ein Pr�dikat f�r die heuristische Suche          */
/*            hill_climb und bestimmen damit die ersten L�sungen f�r die      */
/*            7 Konfigurationen bei einer Suche mit START=k(1,1) und          */
/*            ZIEL=k(8,8). �berzeugen Sie sich von der Korrektheit des        */
/*            gefunden Wegs und geben dessen L�nge an!                        */
/*            Zur Sortierung der bewerteten Nachbarn k�nnen Sie das Pr�dikat  */
/*            keysort benutzen. Dieses sortiert die Listenelemente einer      */
/*            Liste wenn diese mit einem Sortierschl�ssel in Form einer Zahl  */
/*            versehen sind, die mit dem Listenelement mittels "-" verbunden  */
/*            ist.                                                            */
/*            keysort([3-x,5-y,2-z,1-u,4-v,6-w],SL). =>                       */
/*                                    SL=[1-u,2-z,3-x,4-v,5-y,6-w].           */
/*----------------------------------------------------------------------------*/
/* Aufgabe 5: Definieren Sie ein Pr�dikat manht f�r eine Suche mit            */
/*            vollst�ndiger Information �ber die Welt ohne Hindernisse, das   */
/*            auf der Basis der vollst�ndigen Information zielgerichtet den   */
/*            k�rzesten Weg bei einer Suche mit START=k(1,1) und ZIEL=k(8,8)  */
/*            bestimmt.                                                       */
/*----------------------------------------------------------------------------*/
/* Aufgabe 6: Stellen Sie die Ergebnisse in einer Liste zusammen              */
/*                                                                            */
/*  Pfadl�nge | o_h | w_h | s_h | k_h | d_h | d_h | z_h                       */
/* -----------+-----+-----+-----+-----+-----+-----+-----                      */
/* tiesu      | 57  |     |     |     |     |     |                           */
/* breisu     |     |     |     |     |     |     |                           */
/* hill_climb |     |     |     |     |     |     |                           */
/* manh       |     |     |     |     |     |     |                           */
/*                                                                            */
/******************************************************************************/