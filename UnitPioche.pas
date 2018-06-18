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
 -- Pré conditions    : une pioche vide, un set de regles(a envoyer deux fois)
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

(* ------------------------------------------------------------------------------------
 -- Fonction          : tirerPion(pioche: pointPioche; numeroCase: Integer): tPion
 -- Auteur            : Guillaume Quentin
 -- Date de creation  : 01 June 2018 (Friday) 16:03
 --
 -- But               : Tirer un pion aléatoir de la pioche et le retourner
 -- Pré conditions    : Une pioche initialisée
 -- Post conditions   : Tirer un pion aléatoir de la pioche et le retourner
 ------------------------------------------------------------------------------------*)
FUNCTION tirerPion(pioche: pointPioche; numeroCase: Integer): tPion;

(* ------------------------------------------------------------------------------------
 -- Fonction          : supprPioche(pioche: pointPioche; numeroCase: Integer): pioche
 -- Auteur            : Guillaume Quentin
 -- Date de creation  : 01 June 2018 (Friday) 16:45
 --
 -- But               : Supprimer une case d'une pioche
 -- Pré conditions    : Une pioche non vide et un numéro de case
 -- Post conditions   : Supprimer une case d'une pioche
 ------------------------------------------------------------------------------------*)
FUNCTION supprPioche(pioche: pointPioche; debutPioche: pointPioche; numeroCase: Integer): pointPioche;

IMPLEMENTATION


FUNCTION initPion(pion: tPion; valeur: tRegle): tPion;
BEGIN
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

FUNCTION supprPioche(pioche: pointPioche; debutPioche: pointPioche; numeroCase: Integer): pointPioche;
VAR
    res, temp: pointPioche;
BEGIN
   IF(numeroCase <= pioche^.nombre) THEN
   BEGIN
        IF(pioche^.nombre = 1) THEN
        BEGIN
            res:= pioche^.next;
            Dispose(pioche);
        END
        ELSE
        BEGIN
            pioche^.nombre:= pioche^.nombre - 1;
            res:= pioche;
        END;
    END
    ELSE
    BEGIN
        IF(pioche^.next = Nil) THEN
        BEGIN
            writeln('ERREUR, nombre incorrect');
            res:= debutPioche;
        END
        ELSE
        BEGIN
            IF(numeroCase <= pioche^.next^.nombre + pioche^.nombre) THEN
            BEGIN
                IF(pioche^.next^.nombre = 1) THEN
                BEGIN
                    temp:= pioche^.next^.next;
                    Dispose(pioche^.next);
                    pioche^.next:= temp;
                END
                ELSE
                BEGIN
                    pioche^.next^.nombre:= pioche^.next^.nombre - 1;
                END;
                res:= debutPioche;
            END
            ELSE
            BEGIN
                res:= supprPioche(pioche^.next, debutPioche, numeroCase - pioche^.nombre);
            END;
       END;
   END;
   supprPioche:= res;
END;

FUNCTION tirerPion(pioche: pointPioche; numeroCase: Integer): tPion;
VAR
    res: tPion;
BEGIN
	IF(numeroCase > pioche^.nombre) AND (pioche^.next<>Nil) THEN
    BEGIN
        res:= tirerPion(pioche^.next, numeroCase - pioche^.nombre);
    END
    ELSE IF ((pioche^.next=Nil) AND (numeroCase > pioche^.nombre)) OR (numeroCase <= 0) THEN
    BEGIN
        writeln('ERREUR: pioche erroné');
    END
    ELSE
    BEGIN
        res:= pioche^.pion;
    END;
    tirerPion:= res;
END;

END.
