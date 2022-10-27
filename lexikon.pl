/*----------------------------------------------------------------------------*/
/*                             LEXIKALISCHE REGELN                            */
/*----------------------------------------------------------------------------*/
/* Noch um neue Nomen erweitern                                               */
/*----------------------------------------------------------------------------*/
art(nom,mas,sing) --> [der].
art(akk,mas,sing) --> [den].
art(nom,fem,sing) --> [die].
art(akk,fem,sing) --> [die].
art(nom,_,plur)   --> [die].
art(akk,_,plur)   --> [die].
art(nom,mas,sing) --> [ein].
art(akk,mas,sing) --> [einen].
art(nom,fem,sing) --> [eine].
art(akk,fem,sing) --> [eine].
/*----------------------------------------------------------------------------*/
nomen(nom,mas,sing) --> [hase].
nomen(akk,mas,sing) --> [hasen].
nomen(nom,mas,plur) --> [hasen].
nomen(akk,mas,plur) --> [hasen].
nomen(nom,mas,sing) --> [fuchs].
nomen(akk,mas,sing) --> [fuchs].
nomen(nom,mas,plur) --> [fuechse].
nomen(akk,mas,plur) --> [fuechse].
nomen(nom,fem,sing) --> [informatik].
nomen(akk,fem,sing) --> [informatik].
nomen(nom,fem,sing) --> [mohrruebe].
nomen(akk,fem,sing) --> [mohrruebe].
nomen(nom,fem,plur) --> [mohrrueben].
nomen(akk,fem,plur) --> [mohrrueben].
nomen(nom,mas,sing) --> [student].
nomen(akk,mas,sing) --> [studenten].
nomen(nom,mas,plur) --> [studenten].
nomen(akk,mas,plur) --> [studenten].
nomen(nom,mas,sing) --> [professor].
nomen(akk,mas,sing) --> [professor].
nomen(nom,mas,plur) --> [professoren].
nomen(akk,mas,plur) --> [professoren].
nomen(nom,fem,sing) --> [entitaet].              
nomen(akk,fem,sing) --> [entitaet].
nomen(nom,fem,plur) --> [entitaeten].              
nomen(akk,fem,plur) --> [entitaeten].
nomen(nom,neu,sing) --> [lebewesen].              %n
nomen(akk,neu,sing) --> [lebewesen].              %n
nomen(nom,neu,plur) --> [lebewesen].              %n
nomen(akk,neu,plur) --> [lebewesen].              %n
nomen(nom,neu,sing) --> [tier].                   %n
nomen(akk,neu,sing) --> [tier].                   %n
nomen(nom,neu,plur) --> [tiere].                  %n
nomen(akk,neu,plur) --> [tiere].                  %n
nomen(nom,mas,sing) --> [pflanzenfresser].        %n
nomen(akk,mas,sing) --> [pflanzenfresser].        %n
nomen(nom,mas,plur) --> [pflanzenfresser].        %n
nomen(akk,mas,plur) --> [pflanzenfresser].        %n
nomen(nom,mas,sing) --> [fleischfresser].         %n
nomen(akk,mas,sing) --> [fleischfresser].         %n
nomen(nom,mas,plur) --> [fleischfresser].         %n
nomen(akk,mas,plur) --> [fleischfresser].         %n
nomen(nom,fem,sing) --> [wissenschaft].           %n
nomen(akk,fem,sing) --> [wissenschaft].           %n
nomen(nom,fem,plur) --> [wissenschaften].         %n
nomen(akk,fem,plur) --> [wissenschaften].         %n
nomen(nom,fem,sing) --> [mathematik].             %n
nomen(akk,fem,sing) --> [mathematik].             %n
nomen(nom,fem,sing) --> [pflanze].                %n
nomen(akk,fem,sing) --> [pflanze].                %n
nomen(nom,fem,plur) --> [pflanzen].               %n
nomen(akk,fem,plur) --> [pflanzen].               %n
nomen(nom,mas,sing) --> [mensch].                 %n
nomen(akk,mas,sing) --> [menschen].               %n
nomen(nom,mas,plur) --> [menschen].               %n
nomen(akk,mas,plur) --> [menschen].               %n
/*----------------------------------------------------------------------------*/
eigenname(nom,mas,sing) --> [max].
eigenname(akk,mas,sing) --> [max].
eigenname(nom,mas,sing) --> [moritz].
eigenname(akk,mas,sing) --> [moritz].
/*----------------------------------------------------------------------------*/
verb(akk,sing)   --> [isst].
verb(akk,plur)   --> [essen].
verb(nom,sing)   --> [ist].                    %n
verb(nom,plur)   --> [sind].                   %n
verb(akk,sing)   --> [mag].
verb(akk,plur)   --> [moegen].
verb(akk,sing)   --> [studiert].
verb(akk,plur)   --> [studieren].
verb(intr,sing)  --> [schlaeft].
verb(intr,plur)  --> [schlafen].
verb(intr,sing)  --> [waechst].
verb(intr,plur)  --> [wachsen].