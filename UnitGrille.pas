UNIT UnitGrille;
INTERFACE
USES
ProjUnit, Crt;
(* ------------------------------------------------------------------------------------
 -- Fonction          : initGrille(regle: tRegle) : tgrille
 -- Auteur            : Mathis Gourc <gourcmathi@eisti.eu>
 -- Date de creation  : Aucun à Aucun
 --
 -- But               : Initialiser le plateau
 -- Remarques         : Aucune
 -- Pré conditions    : Aucun
 -- Post conditions   : Aucun
 ------------------------------------------------------------------------------------*)
	
FUNCTION initGrille(regle: tRegle) : tgrille;

(* ------------------------------------------------------------------------------------
 -- Fonction          : placeLibre(x,y: integer;grille: tGrille) : boolean
 -- Auteur            : Mathis Gourc <gourcmathi@eisti.eu>
 -- Date de creation  : 25 May 2018 (Friday) à 15:55
 --
 -- But               : Verifie si la place à laquelle on veut poser le pion est libre ou non
 -- Remarques         : Aucune
 -- Pré conditions    : Aucun
 -- Post conditions   : Aucun
 ------------------------------------------------------------------------------------*)

FUNCTION placeLibre(x,y: integer;grille: tGrille) : boolean;

(* ------------------------------------------------------------------------------------
 -- Fonction          : pionPasSeul(x,y: integer;grille: tGrille) : boolean
 -- Auteur            : Mathis Gourc <gourcmathi@eisti.eu>
 -- Date de creation  : 25 May 2018 (Friday) à 16:08
 --
 -- But               : Verifie si le pion posé est entouré d'au moins un autre pion
 -- Remarques         : Aucune
 -- Pré conditions    : Aucun
 -- Post conditions   : Aucun
 ------------------------------------------------------------------------------------*)

FUNCTION pionPasSeul(x,y: integer;grille: tGrille) : boolean;

(* ------------------------------------------------------------------------------------
 -- Fonction          : coupValide(x,y: integer;grille: tGrille;pion: pointPion) : boolean
 -- Auteur            : Mathis Gourc <gourcmathi@eisti.eu>
 -- Date de creation  : Aucun à Aucun
 --
 -- But               : Verifie si le coup est valide
 -- Remarques         : Aucune
 -- Pré conditions    : Aucun
 -- Post conditions   : Aucun
 ------------------------------------------------------------------------------------*)

FUNCTION coupValide(x,y: integer;grille: tGrille;pion: pointPion) : boolean;

(* ------------------------------------------------------------------------------------
 -- Fonction          : verifDroite(x,y: integer;grille: tGrille;pion: pointPion) : boolean
 -- Auteur            : Mathis Gourc <gourcmathi@eisti.eu>
 -- Date de creation  : Aucun à Aucun
 --
 -- But               : Verifie à droite du pion posé si le coup est valide 
 -- Remarques         : Aucune
 -- Pré conditions    : Aucun
 -- Post conditions   : Aucun
 ------------------------------------------------------------------------------------*)

FUNCTION verifDroite(x,y: integer;grille: tGrille;pion: pointPion) : boolean;

(* ------------------------------------------------------------------------------------
 -- Fonction          : verifGauche(x,y: integer;grille: tGrille;pion: pointPion) : boolean
 -- Auteur            : Mathis Gourc <gourcmathi@eisti.eu>
 -- Date de creation  : Aucun à Aucun
 --
 -- But               : Verifie à gauche du pion posé si le coup est valide
 -- Remarques         : Aucune
 -- Pré conditions    : Aucun
 -- Post conditions   : Aucun
 ------------------------------------------------------------------------------------*)

FUNCTION VerifGauche(x,y: integer;grille: tGrille;pion: pointPion) : boolean;

(* ------------------------------------------------------------------------------------
 -- Fonction          : verifHaut(x,y: integer;grille: tGrille;pion: pointPion) : boolean
 -- Auteur            : Mathis Gourc <gourcmathi@eisti.eu>
 -- Date de creation  : Aucun à Aucun
 --
 -- But               : Verifie en haut du pion posé si le coup est valide
 -- Remarques         : Aucune
 -- Pré conditions    : Aucun
 -- Post conditions   : Aucun
 ------------------------------------------------------------------------------------*)

FUNCTION verifHaut(x,y: integer;grille: tGrille;pion: pointPion) : boolean;

(* ------------------------------------------------------------------------------------
 -- Fonction          : verifBas(x,y: integer;grille: tGrille;pion: pointPion) : boolean
 -- Auteur            : Mathis Gourc <gourcmathi@eisti.eu>
 -- Date de creation  : Aucun à Aucun
 --
 -- But               : Verifie en bas du pion posé si le coup est valide
 -- Remarques         : Aucune
 -- Pré conditions    : Aucun
 -- Post conditions   : Aucun
 ------------------------------------------------------------------------------------*)

FUNCTION verifBas(x,y: integer;grille: tGrille;pion: pointPion) : boolean;

(* ------------------------------------------------------------------------------------
 -- Fonction          : verifLineaire(x,y: integer;grille: tGrille;pion: pointPion) : boolean
 -- Auteur            : Mathis Gourc <gourcmathi@eisti.eu>
 -- Date de creation  : Aucun à Aucun
 --
 -- But               : Verifie en haut, bas, gauche, droite si le coup est valide 
 -- Remarques         : Aucune
 -- Pré conditions    : Aucun
 -- Post conditions   : Aucun
 ------------------------------------------------------------------------------------*)

FUNCTION verifLineaire(x,y: integer;grille: tGrille;pion: pointPion) : boolean;


(* ------------------------------------------------------------------------------------
 -- Fonction          : placerPremierPion(grille: tGrille; pion: tPion;regle: tRegle) : tGrille
 -- Auteur            : Mathis Gourc <gourcmathi@eisti.eu>
 -- Date de creation  : Aucun à Aucun
 --
 -- But               : Place le premier pion au centre de la grille
 -- Remarques         : Aucune
 -- Pré conditions    : Aucun
 -- Post conditions   : Aucun
 ------------------------------------------------------------------------------------*)

FUNCTION placerPremierPion(grille: tGrille; pion: tPion;regle: tRegle) : tGrille;

(* ------------------------------------------------------------------------------------
 -- Fonction          : placerPion(grille: tGrille; pion: tPion;regle: tRegle) : tGrille
 -- Auteur            : Mathis Gourc <gourcmathi@eisti.eu>
 -- Date de creation  : Aucun à Aucun
 --
 -- But               : Place un pion
 -- Remarques         : Aucune
 -- Pré conditions    : Aucun
 -- Post conditions   : Aucun
 ------------------------------------------------------------------------------------*)

FUNCTION placerPion(grille: tGrille; pion: tPion;regle: tRegle) : tGrille;

(* ------------------------------------------------------------------------------------
 -- Procedure          : couleur(couleur: tCouleurs)
 -- Auteur             : Mathis Gourc <gourcmathi@eisti.eu>
 -- Date de creation   : Aucun à Aucun
 --
 -- But                : Colore un pion
 -- Remarques          : Aucune
 -- Pré conditions     : Aucun
 -- Post conditions    : Aucun
 ------------------------------------------------------------------------------------*)

PROCEDURE couleur(couleur: tCouleurs);

(* ------------------------------------------------------------------------------------
 -- Procedure          : forme(forme: tForme)
 -- Auteur             : Mathis Gourc <gourcmathi@eisti.eu>
 -- Date de creation   : Aucun à Aucun
 --
 -- But                : Donne une forme à un pion
 -- Remarques          : Aucune
 -- Pré conditions     : Aucun
 -- Post conditions    : Aucun
 ------------------------------------------------------------------------------------*)

PROCEDURE forme(forme: tForme);

(* ------------------------------------------------------------------------------------
 -- Fonction          : afficherGrille(regle: tRegle; grille: tGrille) : tGrille
 -- Auteur            : Mathis Gourc <gourcmathi@eisti.eu>
 -- Date de creation  : Aucun à Aucun
 --
 -- But               : Afficher la grille
 -- Remarques         : Aucune
 -- Pré conditions    : Aucun
 -- Post conditions   : Aucun
 ------------------------------------------------------------------------------------*)
	
FUNCTION afficherGrille(regle: tRegle; grille: tGrille) : tGrille;

IMPLEMENTATION

// INITIALISATION DE LA GRILLE

FUNCTION initGrille(regle: tRegle) : tgrille;
VAR
   grille: tGrille;
   taille: real;
   tailleEntiere : Integer;
   i,j: integer;
BEGIN
   taille:=(sqrt(4*(regle.nFormes*regle.nCouleurs*regle.nRepetitions)));
   tailleEntiere := Round(taille);
   SetLength(grille,tailleEntiere,tailleEntiere);
   FOR i := 0 TO tailleEntiere-1 DO
   BEGIN
      FOR j := 0 TO tailleEntiere-1 DO
      BEGIN
	  grille[i,j]:= Nil;
      END;
   END;
   initGrille := grille;
END;


// VERIFICATION D'UN COUP VALIDE


FUNCTION placeLibre(x,y: integer;grille: tGrille) : boolean;
BEGIN
   placeLibre := (grille[x,y]=Nil);
END;



FUNCTION pionPasSeul(x,y: integer;grille: tGrille) : boolean;
VAR
	res: boolean;
BEGIN
	res:=true;
	IF ((grille[x-1,y]=nil) and (grille[x+1,y]=nil) and (grille[x,y-1]=nil) and (grille[x,y+1]=nil)) THEN
	BEGIN
		res:= false;
	END;
	pionPasSeul := res;
END;





FUNCTION verifDroite(x,y: integer;grille: tGrille;pion: pointPion) : boolean;
VAR
	res: boolean;
BEGIN
	res:=true;
	WHILE (grille[x,y+1]<>Nil) DO
	BEGIN
		IF (((pion^.couleur=grille[x,y+1]^.couleur) and (pion^.forme=grille[x,y+1]^.forme)) or ((pion^.couleur<>grille[x,y+1]^.couleur) and (pion^.forme<>grille[x,y+1]^.forme))) THEN
		BEGIN
			res:=false;
		END;
		y:=y+1;
	END;
	verifDroite := res;
END;

FUNCTION verifGauche(x,y: integer;grille: tGrille;pion: pointPion) : boolean;
VAR
	res: boolean;
BEGIN
	res:=true;
	WHILE (grille[x,y-1]<>Nil) DO
	BEGIN
		IF (((pion^.couleur=grille[x,y-1]^.couleur) and (pion^.forme=grille[x,y-1]^.forme)) or ((pion^.couleur<>grille[x,y-1]^.couleur) and (pion^.forme<>grille[x,y-1]^.forme))) THEN
		BEGIN
			res:=false;
		END;
		y:=y-1;
	END;
	verifGauche := res;
END;

FUNCTION verifHaut(x,y: integer;grille: tGrille;pion: pointPion) : boolean;
VAR
	res: boolean;
BEGIN
	
	res:=true;
	WHILE (grille[x-1,y]<>Nil) DO
	BEGIN
		IF (((pion^.couleur=grille[x-1,y]^.couleur) and (pion^.forme=grille[x-1,y]^.forme)) or ((pion^.couleur<>grille[x-1,y]^.couleur) and (pion^.forme<>grille[x-1,y]^.forme))) THEN
		BEGIN
			res:=false;
		END;
		x:=x-1;
	END;
	verifHaut := res;
END;

FUNCTION verifBas(x,y: integer;grille: tGrille;pion: pointPion) : boolean;
VAR
	res: boolean;
BEGIN
	res:=true;
	WHILE (grille[x+1,y]<>Nil) DO
	BEGIN
		IF (((pion^.couleur=grille[x+1,y]^.couleur) and (pion^.forme=grille[x+1,y]^.forme)) or ((pion^.couleur<>grille[x+1,y]^.couleur) and (pion^.forme<>grille[x+1,y]^.forme))) THEN
		BEGIN
			res:=false;
		END;
		x:=x+1;
	END;
	verifBas := res;
END;





FUNCTION verifLineaire(x,y: integer;grille: tGrille;pion: pointPion) : boolean;

BEGIN
	verifLineaire := verifHaut(x,y,grille,pion) and verifBas(x,y,grille,pion) and verifDroite(x,y,grille,pion) and VerifGauche(x,y,grille,pion);
END;

FUNCTION coupValide(x,y: integer;grille: tGrille;pion: pointPion) : boolean;
BEGIN
	coupValide := placeLibre(x,y,grille) and pionPasSeul(x,y,grille) and  verifLineaire(x,y,grille,pion);
END;


// PLACEMENT DES PIONS


FUNCTION placerPremierPion(grille: tGrille; pion: tPion;regle: tRegle) : tGrille;
VAR
    x,y: integer;
    taille: Integer;
    Ppion: pointPion;
BEGIN
	taille:=length(grille[0]);
	x:= taille div 2;
	y:= taille div 2;    
	new(Ppion);
	Ppion^:=pion;
	grille[x,y]:=Ppion;
	placerPremierPion := grille;
END;

FUNCTION placerPion(grille: tGrille; pion: tPion;regle: tRegle) : tGrille;
VAR
   res: tGrille; 
   x,y: integer;
   taille: integer;
   Ppion: pointPion;

BEGIN
   taille:=length(grille[0]);
   y:=(demanderNombre(taille-2,1,'coordonnée x'));
   x:=(demanderNombre(taille-2,1,'coordonnée y'));
   new(Ppion);
   Ppion^ := pion; 
   IF (coupValide(x,y,grille,Ppion)) THEN
   BEGIN
      grille[x,y]:=Ppion;	
      res := grille;
   END
   ELSE
   BEGIN
      res:= grille;
      writeln('Vous ne pouvez pas faire ça !');
   END;
   placerPion:= res;
END;


// DONNER UNE FORME ET UNE COULEUR AUX PION


PROCEDURE couleur(couleur: tCouleurs);

BEGIN
	IF (couleur=tCouleurs(1)) THEN
	BEGIN
		TextColor(1);
	END;
	IF (couleur=tCouleurs(2)) THEN
	BEGIN
		TextColor(2);
	END;
	IF (couleur=tCouleurs(3)) THEN
	BEGIN
		TextColor(4);
	END;
	IF (couleur=tCouleurs(4)) THEN
	BEGIN
		TextColor(15);
	END;
	IF (couleur=tCouleurs(5)) THEN
	BEGIN
		TextColor(8);
	END;
	IF (couleur=tCouleurs(6)) THEN
	BEGIN
		TextColor(14);
	END;
	IF (couleur=tCouleurs(7)) THEN
	BEGIN
		TextColor(5);
	END;
	IF (couleur=tCouleurs(8)) THEN
	BEGIN
		TextColor(6);
	END;
	IF (couleur=tCouleurs(9)) THEN
	BEGIN
		TextColor(13);
	END;
	IF (couleur=tCouleurs(10)) THEN
	BEGIN
		TextColor(12);
	END;
END;


PROCEDURE forme(forme: tForme);

BEGIN
	IF (forme=tForme(1)) THEN
	BEGIN
		write('■');
	END;
	IF (forme=tForme(2)) THEN
	BEGIN
		write('o');
	END;
	IF (forme=tForme(3)) THEN
	BEGIN
		write('▲');
	END;
	IF (forme=tForme(4)) THEN
	BEGIN
		write('★');
	END;
	IF (forme=tForme(5)) THEN
	BEGIN
		write('+');
	END;
	IF (forme=tForme(6)) THEN
	BEGIN
		write('x');
	END;
	IF (forme=tForme(7)) THEN
	BEGIN
		write('♦');
	END;
	IF (forme=tForme(8)) THEN
	BEGIN
		write('♥');
	END;
	IF (forme=tForme(9)) THEN
	BEGIN
		write('♣');
	END;
	IF (forme=tForme(10)) THEN
	BEGIN
		write('@');
	END;
END;
	

// AFFICHER LA GRILLE


FUNCTION afficherGrille(regle: tRegle; grille: tGrille) : tGrille;
VAR
	taille: real;
	tailleEntiere : Integer;
	i,j: integer;
BEGIN
	tailleEntiere := length(grille[0]);
	IF (tailleEntiere = 0) THEN
	BEGIN
		taille:=(sqrt(4*(regle.nFormes*regle.nCouleurs*regle.nRepetitions)));
	    tailleEntiere := Round(taille);
		SetLength(grille,tailleEntiere,tailleEntiere);
	END;
	FOR i := 1 TO tailleEntiere-2 DO
	BEGIN
		FOR j := 1 TO tailleEntiere-2 DO
		BEGIN
			TextColor(White);
			IF (grille[i,j] <> nil) THEN
			BEGIN
				write('[');
				couleur(grille[i,j]^.couleur);
				forme(grille[i,j]^.forme);
				TextColor(White);
				write(']');
			END
			ELSE
			BEGIN
				write('[ ]');
			END;
		END;
		writeln('');
	END;
	afficherGrille := grille;
END;

END.