UNIT UnitMain;
INTERFACE
uses ProjUnit,UnitPioche,Crt;
function initmain(prem:pointPioche;nbpiece:integer): Resinitmain;
function renvoyerpion(first1:ptrmain):resinitmain;
function max1main(first1:ptrmain): Integer;
function max2main(first1:ptrmain;first2:ptrmain):integer;
var
IMPLEMENTATION
function initmain(prem:pointPioche;nbpiece:integer): Resinitmain;
var
    res:Resinitmain;
    rand,i,j,x : integer;
    precedent,acc,test: ^tPioche;
    first,prev,main:^tMain;
begin
test:=prem;
x:=1;
while test^.next<>nil do
begin
test:=test^.next;
x:=x+1;
end;
writeln('la pioche a une longueur de');
writeln(x);








    for i := 1 to 6 do //6 nombre de pion
    begin
        rand:=Random(nbpiece-1);
        //writeln('before');
        //ici on pars au debut de la liste
        precedent := prem;
        //on parcour notre liste (la pioche) jusqua la valeur aleatoire
        for j := 2 to rand do
        
        begin
            if j=rand then
            begin
            
            //ici quand on arrive au pion choisi aleatoirement on le sauvegarde et le saute directement ( ca le retire de la liste)
            acc:=precedent^.next;
            precedent:=precedent^.next^.next;
            nbpiece:=nbpiece-1;
            end
            else
            begin //ici tant quon est pas au pion choisi on passe au suivant
            precedent:=precedent^.next;
            end;   
        end;
        //writeln('after'); 
        //ici on affiche pion quon va mettre dans la main du joueur
        //writeln(acc^.pion.forme=fois);
        //writeln(acc^.pion.couleur=orange);
        //ici on met le(du moins sa sauvegarde) pion dans la main
        if (i=1) 
        then
        begin
            //premiers cas premier element de la liste
            //writeln('un');
            new(first);
            first^.pion:=acc^.pion;
            precedent := prem;
            prev:=first;
        end
        else
        begin
            //autre cas element standard
            //writeln('std');
            new(main);
            main^.pion:=acc^.pion;
            prev^.next:=main;
            prev:=main;
        end;        
    end;
    
    res.pioche:=prem;
    res.main:=first;
    res.nbpiece:=nbpiece;
    initmain:=res;
end;


function renvoyerpion(first1:ptrmain):resinitmain;
var
res:Resinitmain;    
num,i,j : integer;
precedent,acc: ^tMain;
first,prev,pioche:^tPioche;
ligne:string;
begin
num:=0;
i:=1;
writeln ('si pas de pion a enlever taper stop sinon oui');
readln(ligne);
while ligne<>'stop'  do
begin
  writeln ('entrez lenumero du pion a enlever');
  readln(num);
 //ici on vire le pion de la main
 //cas special du premier pion
 if num=1 then
 begin
 acc:=first1;
 first1:=first1^.next;
 end;
 precedent := first1;   
 //cas standart
  for j := 2 to num do 
  begin
       if j=num then
       begin
       //ici quand on arrive au pion choisi on le sauvegarde et le saute directement ( ca le retire de la liste)
           acc:=precedent^.next;
           precedent:=precedent^.next^.next;
       end
       else
       begin //ici tant quon est pas au pion choisi on passe au suivant
          precedent:=precedent^.next;
       end;   
  end;
  if (i=1) 
        then
        begin
            //premiers cas premier element de la liste
            //writeln('un');
            new(first);
            first^.pion:=acc^.pion;
            prev:=first;
        end    
    else
        begin
            //autre cas element standard
            //writeln('std');
            new(pioche);
            pioche^.pion:=acc^.pion;
            prev^.next:=pioche;
            prev:=pioche;
        end;     
i:=i+1;        
writeln ('si pas de pion a enlever taper stop sinon oui');
readln(ligne);  
end;
res.pioche:=first;//renvoie une liste de pion a rajouter a la pioche
res.main:=first1;//la nouvelle main
res.nbpiece:=i;//le nombre de pion dans la liste
renvoyerpion:=res;
end;



// 
// Fonction : max1main
// Auteur : Nahia Gorrichon <gorrichonn@eisti.eu>
// Description :  
// Préconditions : 
// Postconditions :
//
function max1main(first1:ptrmain): Integer;
var  
   
    i,nbbleu,nbrouge,nborange,nbjaune,nbvert,nbrose,nbfois,nbplus,nbrond,nbcarre,nblosange,nbetoile,nbnoir,nbblanc,
    nbmarron,nbviolet,nbtriangle,nbtrefle,nbarobase,nbcoeur,max:integer;
    prev:^tMain;
    tab : array[1..20] of integer;
begin
nbbleu:=0;
nborange:=0;
nbjaune:=0;
nbrose:=0;
nbvert:=0;
nbblanc:=0;
nbnoir:=0;
nbviolet:=0;
nbmarron :=0;
nbrouge:=0;
nbfois:=0;
nbplus:=0;
nbrond:=0;
nblosange:=0;
nbetoile:=0;
nbcarre:=0;
nbtriangle:=0;
nbtrefle:=0;
nbarobase:=0;
nbcoeur:=0;

prev := first1;
if (prev^.pion.couleur=rouge) then nbrouge := nbrouge+1;
if (prev^.pion.couleur=bleu) then nbbleu := nbbleu+1;    
if (prev^.pion.couleur=orange) then nborange := nborange+1;
if (prev^.pion.couleur=jaune) then nbjaune:= nbjaune+1;
if (prev^.pion.couleur=rose) then nbrouge := nbrose+1;
if (prev^.pion.couleur=vert) then nbvert := nbvert+1;
if (prev^.pion.couleur=blanc) then nbvert := nbblanc+1;
if (prev^.pion.couleur=noir) then nbvert := nbnoir+1;
if (prev^.pion.couleur=violet) then nbvert := nbviolet+1;
if (prev^.pion.couleur=marron) then nbvert := nbmarron+1;
if (prev^.pion.forme=plus) then nbplus := nbplus+1;
if (prev^.pion.forme=fois) then nbfois := nbfois+1;
if (prev^.pion.forme=rond) then nbrond := nbrond+1;
if (prev^.pion.forme=losange) then nblosange := nblosange+1;
if (prev^.pion.forme=carre) then nbcarre:= nbcarre+1;
if (prev^.pion.forme=etoile) then nbetoile:= nbetoile+1;
if (prev^.pion.forme=trefle) then nbvert := nbtrefle+1;
if (prev^.pion.forme=triangle) then nbvert := nbtriangle+1;
if (prev^.pion.forme=arobase) then nbvert := nbarobase+1;
if (prev^.pion.forme=coeur) then nbvert := nbcoeur+1;

for  i := 2 to 6 do
    begin
        prev:=prev^.next;
        if (prev^.pion.couleur=rouge) then nbrouge := nbrouge+1;
        if (prev^.pion.couleur=bleu) then nbbleu := nbbleu+1;
        if (prev^.pion.couleur=orange) then nbrouge := nborange+1;
        if (prev^.pion.couleur=jaune) then nbjaune := nbjaune+1;
        if (prev^.pion.couleur=rose) then nbrose := nbrose+1;
        if (prev^.pion.couleur=vert) then nbvert := nbvert+1;
        if (prev^.pion.couleur=blanc) then nbvert := nbblanc+1;
        if (prev^.pion.couleur=noir) then nbvert := nbnoir+1;
        if (prev^.pion.couleur=violet) then nbvert := nbviolet+1;
        if (prev^.pion.couleur=marron) then nbvert := nbmarron+1;
        if (prev^.pion.forme=fois) then nbfois := nbfois+1;
        if (prev^.pion.forme=plus) then nbplus := nbplus+1;
        if (prev^.pion.forme=rond) then nbfois := nbrond+1;
        if (prev^.pion.forme=losange) then nblosange := nblosange+1;
        if (prev^.pion.forme=etoile) then nbetoile := nbetoile+1;
        if (prev^.pion.forme=carre) then nbcarre := nbcarre+1;
        if (prev^.pion.forme=trefle) then nbvert := nbtrefle+1;
        if (prev^.pion.forme=triangle) then nbvert := nbtriangle+1;
        if (prev^.pion.forme=arobase) then nbvert := nbarobase+1;
        if (prev^.pion.forme=coeur) then nbvert := nbcoeur+1;
    end;
    //writeln('hello');
    tab[1]:=nbrouge;
    tab[2] := nbbleu;
    tab[3] := nborange;
    tab[4] := nbjaune; 
    tab[5]:=nbrose;
    tab[6]:=nbvert;
    tab[7] := nbfois;
    tab[8] := nbplus;
    tab[9] :=nbrond;
    tab[10]:=nblosange;
    tab[11]:=nbetoile;
    tab[12]:=nbcarre;
    tab[13]:=nbblanc;
    tab[14]:=nbnoir;
    tab[15]:=nbviolet;
    tab[16]:=nbmarron;
    tab[17]:=nbtriangle;
    tab[18]:=nbtrefle;
    tab[19]:=nbcoeur;
    tab[20]:=nbarobase;
prev := first1;




//maximum
    max:=tab[1];
    for i:=1 to 20 do
begin

if(tab[i]>=max) then max:=tab[i];
end;
 max1main := max;
 
end;

function max2main(first1:ptrmain;first2:ptrmain):integer;
var
    a,b : integer;
begin
    a :=max1main(first1);
    b :=max1main(first2);
    if(a=b) then
    begin
        writeln('age1?'); 
        readln(a);
        writeln('age2?');
        readln(b);
        if(a<b) then writeln('main2') else writeln('main1');
    end
    else
    begin
    if(a<b) then writeln('main2') else writeln('main1');
    if(a<b) then a:=b;
    end;
    max2main:=b;
end;
end.