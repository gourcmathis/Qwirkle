(* ------------------------------------------------------------------------------------
-- Fichier           : ProjUnit.pas
-- Auteurs           : Guillaume Quentin
-- Date de creation  : 22 May 2018 (Tuesday) 12:53
--
-- But               : Contenir les structures du projet
-- Compilation       : fpc
-- Edition des liens : fpc
-- Execution         : shell
------------------------------------------------------------------------------------*)
UNIT ProjUnit;
INTERFACE
 	Uses Crt, SysUtils, TypInfo;
 	
 	//énumération de formes
 	type tForme = (Carre=1, Rond, Triangle, Etoile, Plus, Fois, Losange, Coeur, Trefle, Arobase);

 	//énumération de couleurs
 	type tCouleurs = (Bleu=1, Vert, Rouge, Blanc, Noir, Jaune, Magenta, Cyan, Rose, Orange);

 	//Joueur humain ou IA
 	type HorR = (Humain, Robot);

 	//Les valeurs des pions
 	type
 		tVal = record
 		pointsV: Integer;
 		pointsH: Integer;
 		end;

 	//Les Pions
 	type
 		tPion = record
 		forme: tForme;
 		couleur: tCouleurs;
 		val: tVal;
 		end;

 	//La pioche
 	type
 		tPioche = record
 		next: ^tPioche;
 		pion: tPion;
 		nombre: Integer;
 		end;

 	//Les règles du jeu
 	type
 		tRegle = record
 		nFormes: integer;
 		nCouleurs: integer;
 		nRepetitions: integer;
 		nJoueurs: integer;
 		end;

 	//La main
 	type
 		tMain = record
 		next: ^tMain;
 		pion: tPion;
 		end;

 	 //pointeur vers une pioche
 	type pointPioche = ^tPioche;

 	//pointeur vers un pion
 	type pointPion = ^tPion;

 	//Pointeur main
 	type ptrmain=^tMain;

 	//Le joueur
 	type
 		tJoueur = record
 		nom: String;
 		age: Integer;
 		points: Integer;
 		main: tMain;
 		typeJoueur: HorR;
 		end;

 	//Liste de joueurs
 	type 
 		tListeJoueur = record
 		next: ^tListeJoueur;
 		joueur: tJoueur;
 		end;

 	//Grille de jeu
 	type tGrille = ARRAY OF ARRAY OF pointPion;

 	//Jeu
 	type
 		tJeu = record
 		Pioche: tPioche;
 		grille: tGrille;
 		listeJoueurs: tListeJoueur;
 		parametres: tRegle;
 		nbPioche: Integer;
 		end;
	
	//Main du joueur
	type
    	Resinitmain=record
    	main:ptrmain;
    	pioche:pointPioche;
    	nbpiece:integer;
    	end;


 		(* ------------------------------------------------------------------------------------
		-- Fonction          : demanderNombre(max, min: Integer; text: String): Integer
		-- Auteur            : Guillaume Quentin
 		-- Date de creation  : 16 May 2018 (Wednesday) 10:29
		--
	    -- But               : Renvoyer un nombre entré par l'utilisateur
		-- Pré conditions    : min, max: bornes de selections telles que min<max
 					           text: Précision sur l'utilité du nombre entré.
		-- Post conditions   : Renvoyer un nombre entré par l'utilisateur
 		------------------------------------------------------------------------------------*)
 		FUNCTION demanderNombre(max, min: Integer; text: String): Integer;

 		(* ------------------------------------------------------------------------------------
		 -- Fonction          : demanderNombre(minMax: Integer; biggerLesser: boolean; text: String): Integer
		 -- Auteur            : Guillaume Quentin
		 -- Date de creation  : 16 May 2018 (Wednesday) 10:46
		 --
		 -- Remarque          : Surcharge de demanderNombre.
		 -- But               : Renvoyer un nombre entré par l'utilisateur(plus petit ou plus grand
 								que minMax)
		 -- Pré conditions    : minMax: Un nombre
 								biggerLesser: un booléen. True: le nombre entré doit être plus grand
 								que minMax, False: le nombre doit être plus petit
		 -- Post conditions   : Renvoyer un nombre entré par l'utilisateur(plus petit ou plus grand
		 						que minMax)
		 ------------------------------------------------------------------------------------*)
		FUNCTION demanderNombre(minMax: Integer; biggerLesser: boolean; text:String): Integer;


IMPLEMENTATION


	FUNCTION demanderNombre(max, min: Integer; text: String): Integer;
	VAR
		res: Integer;
	BEGIN
		REPEAT
			writeln('Rentrez un nombre comprit entre ', min, ' et ', max, ' (', text,')');
			readln(res);
		UNTIL(res>=min) AND (res<=max);
		demanderNombre:= res;
	END;


	FUNCTION demanderNombre(minMax: Integer; biggerLesser: boolean; text:String): Integer;
	VAR
		res: Integer;
	BEGIN
		IF(biggerLesser) THEN
		BEGIN
			REPEAT
				writeln('Rentrez un nombre plus grand que ', minMax, ' (', text,')');
				readln(res);
			UNTIL(res>=minMax);
		END
		ELSE
		BEGIN
			REPEAT
				writeln('Rentrez un nombre plus petit que ', minMax, ' (', text,')');
				readln(res);
			UNTIL(res<=minMax);
		END;
		demanderNombre:= res;
	END;
end.
 	
