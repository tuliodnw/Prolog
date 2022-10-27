/******************************************************************************/
/******************************************************************************/
/***********                         ÜBUNG 5                         **********/
/******************************************************************************/
/******************************************************************************/
/* Umwandlung von einfachen englischen Sätzen mit Informationen zur           */
/* gegenseitigen Lage von Räumen, die durch Himmelsrichtung-Relationen        */
/* angegegeben sind, in eine  Wissensbasis, die die Beantwortung von Fragen   */
/* zur Wegfindung ermöglicht.                                                 */
/******************************************************************************/
/* Ausgangsinformation                                                        */
/*----------------------------------------------------------------------------*/
/* 1.The office is east of the hallway.                                       */
/* 2.The kitchen is north of the office.                                      */
/* 3.The garden is west of the bedroom.                                       */
/* 4.The office is west of the garden.                                        */
/* 5.The bathroom is north of the garden.                                     */
/* 6.The bedroom is south of the lavatory.                                    */
/* 7.The bathroom is west of the lavatory.                                    */
/* 8.The kitchen is west of the bathroom.                                     */
/* 9.The kitchen is east of the studio.                                       */
/* 0.The hallway is south of the studio.                                      */
/******************************************************************************/
/*   Fragenbeispiele                                                          */
/*----------------------------------------------------------------------------*/
/* How do you go from the kitchen to the garden?                              */
/* How do you on the shortest route from the kitchen to the garden?           */
/* How do you go from the office to the bathroom?                             */
/* How do you on the shortest route from the office to the bathroom?          */
/******************************************************************************/
/*                   PLAN DER RÄUME                                           */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  studio --- küche --- bad --- toilette                                     */
/*     |         |        |          |                                        */
/*     |         |        |          |                                        */
/*     |         |        |          |                                        */
/*   flur --- büro --- garten --- schlafzimmer                                */
/*                                                                            */
/******************************************************************************/
/* Die natürlichsprachlichen Sätze werden als eine Liste von Wortlisten       */
/* repräsentiert.                                                             */
/*----------------------------------------------------------------------------*/
statements([[the,office,is,east,of,the,hallway],              % 1
            [the,kitchen,is,north,of,the,office],             % 2
            [the,garden,is,west,of,the,bedroom],              % 3
            [the,office,is,west,of,the,garden],               % 4
            [the,bathroom,is,north,of,the,garden],            % 5
            [the,bedroom,is,south,of,the,lavatory],           % 6
            [the,bathroom,is,west,of,the,lavatory],           % 7
            [the,kitchen,is,west,of,the,bathroom],            % 8
            [the,kitchen,is,east,of,the,studio],              % 9
            [the,hallway,is,south,of,the,studio]]).           % 10
/******************************************************************************/
/* Aufgabe 1: Die Wissensbasis aus den textuellen Aussagen erzeugen           */
/*----------------------------------------------------------------------------*/
/* Die Wissenbasis besteht aus Klauseln des dynamischen dreistelligen         */
/* Prädikats: nachbar(<raum1>,<richtung>,<raum1>).                            */
/* So erzeugt die Aussage [the,office,is,east,of,the,hallway] zwei Klauseln:  */
/* nachbar(hallway,east,office) und nachbar(office,west,hallway)              */
/*----------------------------------------------------------------------------*/
wb_gen:- retractall(neighbour(_,_,_)),statements(AL),aus_lesen(AL).
/*----------------------------------------------------------------------------*/
/* Hinweis 1: Da nur eine Form von Aussagen auftritt, entnehmen Sie mit einer */
/*   Schablone, die eine Liste aus Konstanten und Variablen ist, die jeweils  */
/*   3 relevanten Informationen aus der Aussage und bilden daraus den Eintrag */
/*   für die Klausel.                                                         */
/*   Beispiel für eine Schablone:                                             */
/*                  [ist,ein,X,ein,Y]=[ist,ein,fuchs,ein,sauegetier]          */
/*   Aus der Unifikation von Schablone und Satz folgt:                        */
/*                                       X=fuchs und Y=sauegetier             */
/******************************************************************************/
/* Aufgabe 2: Verarbeiten Sie zwei Typen von Anfragen entsprechend den obigen */
/*            Beispielen und geben Sie die Antwort aus.                       */
/*----------------------------------------------------------------------------*/
/* 2.1. Zuerst muessen die Fragen berabeitet werden. Das erfolgt analog der   */
/*      Verarbeitung der Aussagen - entsprechend den zwei Frageformen.        */
/*      Frageform 1: [how,do,you,go,from,the,kitchen,to,the,garden]           */
/*      Frageform 2: [how,do,you,on,the,shortest,route,from,the,kitchen,to,the,garden] */
/*----------------------------------------------------------------------------*/
/* 2.2. Die Informationen aus der Frageverarbeitung stellen den Start und das */
/*      Ziel einer Suche im Zustandsraum da. Das Ergebnis der Suche ist ein   */
/*      Weg, der vom Start zum Ziel führt, z.B.                               */
/*      [step(kitchen,west,studio),step(studio,south,hallway),                */
/*       step(hallway,east,office),step(office,east,garden)]                  */
/*      Ausgegeben wird diese Liste und ein natürlichsprachlicher Text, der   */
/*      aus dieser Liste erzeugt wird und die entsprechenden Anweisungen zur  */
/*      Erreichung der Ziels enthält:                                         */
/*      go from the kitchen to the west in the studio and then                */
/*      go from the studio to the south in the hallway and then               */
/*      go from the hallway to the east in the office and then                */
/*      go from the office to the east in the garden                          */
/*----------------------------------------------------------------------------*/
/* 2.3. Da i.a. mehrere Lösungen möglich sind soll mit der zweiten Frageform  */
/*      nach dem kürzesten Weg gefragt werden - siehe Beispiele unten.        */
/*----------------------------------------------------------------------------*/
/* Hinweis 2: Die Anfragen können erst nach Bildung der Wissensbasis          */
/*            bearbeitet werden.                                              */
/*----------------------------------------------------------------------------*/
/* Hinweis 3: Um den kürzesten Weg zu bestimmen, finden Sie mit findall alle  */
/*            Wege, bestimmen deren Länge und wählen den kürzesten aus. Zur   */
/*            Längenbestimmung können Sie length benutzen und um den          */
/*            kürzesten Weg zu bestimmen können Sie keysort benutzen, das die */
/*            Elemente einer Liste sortiert.                                  */
/******************************************************************************/
/* Aufgabe 3: Lösen Sie die beiden vorigen Aufgaben für deutschsprachige      */
/*            Aussagen, Fragen und Antworten.                                 */        
/*----------------------------------------------------------------------------*/
aussagen([[das,buero,liegt,oestlich,vom,flur],
          [die,kueche,liegt,noerdlich,vom,buero],
          [der,garten,ist,westlich,vom,schlafzimmer],
          [das,buero,befindet,sich,westlich,des,gartens],
          [das,bad,liegt,noerdlich,vom,garten],
          [das,schlafzimmer,liegt,suedlich,von,der,toilette],
          [das,bad,liegt,westlich,von,der,toilette],
          [die,kueche,ist,westlich,vom,bad],
          [die,kueche,liegt,oestlich,vom,studio],
          [der,flur,befindet,sich,suedlich,vom,studio]]).
/******************************************************************************/
/*                            TESTFÄLLE Aufgabe 2                             */
/*----------------------------------------------------------------------------*/
% question([how,do,you,go,from,the,kitchen,to,the,garden],A).
%
% go from the kitchen to the west in the studio and then
% go from the studio to the south in the hallway and then
% go from the hallway to the east in the office and then
% go from the office to the east in the garden
% A = [step(kitchen, west, studio), step(studio, south, hallway), step(hallway, east, office), step(office, east, garden)] ;
%
% go from the kitchen to the east in the bathroom and then
% go from the bathroom to the east in the lavatory and then
% go from the lavatory to the south in the bedroom and then
% go from the bedroom to the west in the garden
% A = [step(kitchen, east, bathroom), step(bathroom, east, lavatory), step(lavatory, south, bedroom), step(bedroom, west, garden)] ;
%
% go from the kitchen to the east in the bathroom and then
% go from the bathroom to the south in the garden
% A = [step(kitchen, east, bathroom), step(bathroom, south, garden)] ;
%
% go from the kitchen to the south in the office and then
% go from the office to the east in the garden
% A = [step(kitchen, south, office), step(office, east, garden)]
/*----------------------------------------------------------------------------*/
% question([how,do,you,go,from,the,office,to,the,bathroom],A).
% go from the office to the east in the garden and then
% go from the garden to the north in the bathroom
% A = [step(office, east, garden), step(garden, north, bathroom)] ;
%
% go from the office to the east in the garden and then
% go from the garden to the east in the bedroom and then
% go from the bedroom to the north in the lavatory and then
% go from the lavatory to the west in the bathroom
% A = [step(office, east, garden), step(garden, east, bedroom), step(bedroom, north, lavatory), step(lavatory, west, bathroom)] ;
%
% go from the office to the north in the kitchen and then
% go from the kitchen to the east in the bathroom
% A = [step(office, north, kitchen), step(kitchen, east, bathroom)] ;
%
% go from the office to the west in the hallway and then
% go from the hallway to the north in the studio and then
% go from the studio to the east in the kitchen and then
% go from the kitchen to the east in the bathroom
% A = [step(office, west, hallway), step(hallway, north, studio), step(studio, east, kitchen), step(kitchen, east, bathroom)] ;
/*----------------------------------------------------------------------------*/
% question([how,do,you,go,on,the,shortest,route,from,the,kitchen,to,the,garden],A).
% go from the kitchen to the east in the bathroom and then
% go from the bathroom to the south in the garden
% A = [step(kitchen, east, bathroom), step(bathroom, south, garden)]
/*----------------------------------------------------------------------------*/
% question([how,do,you,go,on,the,shortest,route,from,the,office,to,the,bathroom],A).
% go from the office to the east in the garden and then
% go from the garden to the north in the bathroom
% A = [step(office, east, garden), step(garden, north, bathroom)]
/******************************************************************************/
/******************************************************************************/
/*                               Testfälle Aufgabe 3                          */
/******************************************************************************/
% frage([wie,kommt,man,von,der,kueche,in,den,garten],A).
% gehe von der kueche nach westen in das studio!
% gehe von dem studio nach sueden in den flur!
% gehe von dem flur nach osten in das buero!
% gehe von dem buero nach osten in den garten!
% A = [step(kueche, westlich, studio), step(studio, suedlich, flur), step(flur, oestlich, buero), step(buero, oestlich, garten)]
/*----------------------------------------------------------------------------*/
% frage([wie,kommt,man,vom,garten,in,die,kueche],A).
% gehe von dem garten nach norden in das bad!
% gehe von dem bad nach westen in die kueche!
% A = [step(garten, noerdlich, bad), step(bad, westlich, kueche)]
/*----------------------------------------------------------------------------*/
% frage([wie,komme,ich,von,der,kueche,in,den,garten],A).
% gehe von der kueche nach westen in das studio!
% gehe von dem studio nach sueden in den flur!
% gehe von dem flur nach osten in das buero!
% gehe von dem buero nach osten in den garten!
% A = [step(kueche, westlich, studio), step(studio, suedlich, flur), step(flur, oestlich, buero), step(buero, oestlich, garten)]
/*----------------------------------------------------------------------------*/
% frage([wie,komme,ich,vom,garten,in,die,kueche],A).
% gehe von dem garten nach norden in das bad!
% gehe von dem bad nach westen in die kueche!
% A = [step(garten, noerdlich, bad), step(bad, westlich, kueche)]
/*----------------------------------------------------------------------------*/
% frage([was,ist,der,kuerzeste,weg,von,der,kueche,in,den,garten],A).
% gehe von der kueche nach osten in das bad!
% gehe von dem bad nach sueden in den garten!
% A = [step(kueche, oestlich, bad), step(bad, suedlich, garten)]
/*----------------------------------------------------------------------------*/
% frage([was,ist,der,kuerzeste,weg,vom,buero,in,den,garten],A).
% gehe von dem buero nach osten in den garten!
% A = [step(buero, oestlich, garten)]
/*----------------------------------------------------------------------------*/
% frage([wie,kommt,man,auf,dem,kuerzesten,weg,von,der,kueche,in,das,studio],A).
% gehe von der kueche nach westen in das studio!
% A = [step(kueche, westlich, studio)] ;
/*----------------------------------------------------------------------------*/
% frage([wie,kommt,man,auf,dem,kuerzesten,weg,vom,studio,in,das,schlafzimmer],A).
% gehe von dem studio nach sueden in den flur!
% gehe von dem flur nach osten in das buero!
% gehe von dem buero nach osten in den garten!
% gehe von dem garten nach osten in das schlafzimmer!
% A = [step(studio, suedlich, flur), step(flur, oestlich, buero), step(buero, oestlich, garten), step(garten, oestlich, schlafzimmer)] .
/*----------------------------------------------------------------------------*/
% frage([wie,komme,ich,auf,dem,kuerzesten,weg,von,der,kueche,in,das,schlafzimmer],A).
% gehe von der kueche nach osten in das bad!
% gehe von dem bad nach osten in die toilette!
% gehe von der toilette nach sueden in das schlafzimmer!
% A = [step(kueche, oestlich, bad), step(bad, oestlich, toilette), step(toilette, suedlich, schlafzimmer)] .
/*----------------------------------------------------------------------------*/
% frage([wie,komme,ich,auf,dem,kuerzesten,weg,vom,studio,in,den,garten],A).
% gehe von dem studio nach sueden in den flur!
% gehe von dem flur nach osten in das buero!
% gehe von dem buero nach osten in den garten!
% A = [step(studio, suedlich, flur), step(flur, oestlich, buero), step(buero, oestlich, garten)] .
/******************************************************************************/
