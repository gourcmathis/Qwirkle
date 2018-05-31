(* ------------------------------------------------------------------------------------
 -- Fichier           : UnitPioche.pas
 -- Auteurs           : Guillaume Quentin
 -- Date de creation  : 30 May 2018 (Wednesday) 12:12
 --
 -- But               : Gerer la pioche du projet
 -- Compilation       : fpc
 -- Edition des liens : fpc
 -- Execution         : shell
 ------------------------------------------------------------------------------------*)
 UNIT UnitPioche;

 INTERFACE
 	Uses ProjUnit, Crt, SysUtils, TypInfo;

(* ------------------------------------------------------------------------------------
 -- Fonction          : initPioche(pioch: tPioche; regles: tRegle)
 -- Auteur            : Guillaume Quentin
 -- Date de creation  : 31 May 2018 (Thursday) 08:32
 --
 -- But               : Initialiser la pioche du jeu
 -- Pré conditions    : 
 -- Post conditions   : 
 ------------------------------------------------------------------------------------*)
FUNCTION initPioche(pioch: pointPioche; valMax, valeur: tRegle): pointPioche;

(* ------------------------------------------------------------------------------------
 -- Fonction          : initPion(pion: tPion)
 -- Auteur            : Guillaume Quentin
 -- Date de creation  : 31 May 2018 (Thursday) 08:49
 --
 -- But               : Initialiser un pion de la pioche individuellement
 -- Pré conditions    : Un pion non-initialisé et un tRegles correspondant au numéro de la
 						forme et de la couleur du pion
 -- Post conditions   : Initialiser un pion de la pioche individuellement
 ------------------------------------------------------------------------------------*)
FUNCTION initPion(pion: tPion; valeur: tRegle): tPion;

IMPLEMENTATION


FUNCTION initPion(pion: tPion; valeur: tRegle): tPion;
BEGIN
	pion.val.pointsV:= 0;
	pion.val.pointsH:= 0;
	pion.forme:= tForme(valeur.nFormes);
	pion.couleur:= tCouleurs(valeur.nCouleurs);

	initPion:= pion;
END;


FUNCTION initPioche(pioch: pointPioche; valMax, valeur: tRegle): pointPioche;
VAR
   newPioche, res: ^tPioche;
BEGIN
    IF(valeur.nFormes > 0) OR (valeur.nCouleurs > 0) THEN
    BEGIN
    	IF(valeur.nFormes = 0) THEN
    	BEGIN
    		newPioche:= pioch;
    		valeur.nCouleurs:= 0;
    	END
    	ELSE IF(valeur.nCouleurs > 0) THEN
    	BEGIN
			new(newPioche);
			newPioche^.nombre:= valMax.nRepetitions;
			newPioche^.pion:= initPion(newPioche^.pion, valeur);
			newPioche^.next:= pioch;
			valeur.nCouleurs:= valeur.nCouleurs - 1;
    	END
    	ELSE
    	BEGIN
    		valeur.nCouleurs:= valMax.nCouleurs;
			valeur.nFormes:= valeur.nFormes - 1;
			newPioche:= pioch;
    	END;
    	res:= initPioche(newPioche, valMax, valeur);
    END
    ELSE
    BEGIN
    	res:=pioch;
    END;
    initPioche:= res;
END;

END.