testx7([
[ein,ein,ein],
[ein,student,ein],
[der,student,isst,den,studenten],
[ein,student,isst,mohrrueben],
[max,studiert,einen,studenten],      % Nr 5
[max,studiert,informatik],           % Nr 6
[max,mag,informatik],                % Nr 7
[studenten,studieren,informatik],
[ein,student,mag,informatik],
[informatik,mag,einen,studenten],
[der,hase,isst,mohrrueben],
[der,student,studiert,informatik],   % Nr 12
[mohrrueben,essen,hasen],
[der,hase,mag,den,studenten],
[der,hase,mag,die,mohrrueben],
[der,hase,mag,max],
[der,student,isst,eine,mohrruebe],
[der,student,isst,hasen],
[hasen,essen,den,studenten],
[der,student,mag,hasen],
[der,student,mag,mohrrueben],
[der,student,mag,studenten],
[der,student,mag,moritz],
[moritz,mag,den,studenten],
[der,student,studiert,die,hasen],
[die,hasen,studieren,den,studenten],
[informatik,studiert,den,studenten],
[der,student,waechst],
[die,mohrruebe,mag,die,studenten],
[die,mohrruebe,mag,max],
[die,hasen,essen,eine,mohrruebe],
[die,hasen,moegen,den,studenten],
[die,hasen,schlafen],
[die,mohrrueben,schlafen],
[die,hasen,wachsen],
[die,mohrrueben,wachsen],
[ein,hase,mag,einen,studenten],
[max,mag,max],
[moritz,waechst],
[moritz,isst,einen,hasen],
[moritz,isst,einen,fuchs],
[moritz,isst,eine,mohrruebe],
[moritz,isst,einen,studenten],
[ein,student,isst,einen,fuchs],
[ein,fuchs,isst,einen,fuchs],
[max,isst,einen,studenten]]).

testy7([
'Syntaxfehler',
'Syntaxfehler',
'Syntax ist ok aber Semantik ist fehlerhaft',
'Syntax und Semantik sind ok',
'Syntax und Semantik sind ok',                   % Nr 5
'Syntax und Semantik sind ok',                   % Nr 6
'Syntax und Semantik sind ok',                   % Nr 7
'Syntax und Semantik sind ok',
'Syntax und Semantik sind ok',
'Syntax ist ok aber Semantik ist fehlerhaft',
'Syntax und Semantik sind ok',
'Syntax und Semantik sind ok',                   % Nr 12
'Syntax ist ok aber Semantik ist fehlerhaft',
'Syntax und Semantik sind ok',
'Syntax und Semantik sind ok',
'Syntax und Semantik sind ok',
'Syntax und Semantik sind ok',
'Syntax und Semantik sind ok',
'Syntax ist ok aber Semantik ist fehlerhaft',
'Syntax und Semantik sind ok',
'Syntax und Semantik sind ok',
'Syntax und Semantik sind ok',
'Syntax und Semantik sind ok',
'Syntax und Semantik sind ok',
'Syntax und Semantik sind ok',
'Syntax ist ok aber Semantik ist fehlerhaft',
'Syntax ist ok aber Semantik ist fehlerhaft',
'Syntax und Semantik sind ok',
'Syntax ist ok aber Semantik ist fehlerhaft',
'Syntax ist ok aber Semantik ist fehlerhaft',
'Syntax und Semantik sind ok',
'Syntax und Semantik sind ok',
'Syntax und Semantik sind ok',
'Syntax ist ok aber Semantik ist fehlerhaft',
'Syntax und Semantik sind ok',
'Syntax und Semantik sind ok',
'Syntax und Semantik sind ok',
'Syntax und Semantik sind ok',
'Syntax und Semantik sind ok',
'Syntax und Semantik sind ok',
'Syntax ist ok aber Semantik ist fehlerhaft',
'Syntax und Semantik sind ok',
'Syntax ist ok aber Semantik ist fehlerhaft',
'Syntax ist ok aber Semantik ist fehlerhaft',
'Syntax ist ok aber Semantik ist fehlerhaft',
'Syntax ist ok aber Semantik ist fehlerhaft']).