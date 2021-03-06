/* Ce fichier est encodé en UTF-8 et suit la syntaxe du langage Prolog       */
/* Merci de NE PAS MODIFIER LE SYSTEME D'ENCODAGE                            */

/* Nom du binome :    BEN_CHEIKH - EZZAHERY     				    */
/*           (TODO : remplacez Nom1 et Nom2 par vos noms dans l'ordre alphabétique) */

/*****************************************************************************
*              Modélisation du domaine du problème des cruches
******************************************************************************/

inf5(P):-
	P=5. 

inf7(G):-
	G=7.
	
/*****************************************************************************
* Question 0 :  
*
* Proposer une structure permettant de représenter un état pour le problème
* des cruches (nb il n'y a pas de relation à définir - décrire juste la
* structure que vous comptez utiliser, en précisant le sens de chaque argument)
*
* Réponse : 
*			On utilise une structure etat(P,G)
* où... 
	P : volume rempli de la petite cruche
	G : volume rempli de la grande cruche
*            
******************************************************************************/
etat(P,G):-
	inf5(Pmax),
	P=<Pmax,
	P >= 0,
	inf7(Gmax),
	G=<Gmax,
	G >= 0.

/*****************************************************************************
* Question 1 : Définir un prédicat constructeur/accesseur, permettant de faire
* abstraction de la structure que vous avez choisie (et d'automatiser les tests)
* cons_etat_cruche(?P, ?G, ?Etat)  
	qui est vrai si et seulement si Etat correspond au terme
	modélisant un état du domaine des cruches dans lequel 
	- le contenu de la petite cruche est P
	- le contenu de la grande cruche est G
******************************************************************************/
cons_etat_cruche(P, G, etat(P,G)):-
	inf5(Pmax),
	P=<Pmax,
	P >= 0,
	inf7(Gmax),
	G=<Gmax,
	G >= 0.



/*****************************************************************************
* Question 2 : Ecrire le code du prédicat :
* etat_cruche(?Terme)  qui est vrai si et seulement si Terme est un terme prolog
*                      qui représente bien un état pour le problème des cruches.
******************************************************************************/
etat_cruche(etat(P,G)):-
	inf5(Pmax),
	P=<Pmax,
	P >= 0,
	inf7(Gmax),
	G=<Gmax,
	G >= 0.
	



/*****************************************************************************
* Question 3 : Définir un prédicat :
* operateur(?Nom,?Etat,?NEtat)
					qui est vrai si et seulement si Nom est le nom d'un opérateur 
*					applicable pour le problème des cruches, permettant de  
					passer d'un état Etat à un successeur état NEtat.
******************************************************************************/
operateur(vider_P,etat(P,G),etat(0,G)):-
    inf5(Pmax),
	P>0.
operateur(vider_G,etat(P,G),etat(P,0)):-
    inf7(Gmax),
	G>0.
operateur(remplir_P,etat(P,G),etat(Pmax,G)):-
	inf5(Pmax),
	P<Pmax.
operateur(remplir_G,etat(P,G),etat(P,Gmax)):-
	inf7(Gmax),
	G<Gmax.
operateur(transverser_P_G,etat(P,G),etat(Pn,Gn)):-
    inf7(Gmax),
    P>0,
    G<Gmax,
    Y is P+G,
    min(Y,Gmax,Gn),
    Pn is P+G-Gn.
operateur(transverser_G_P,etat(P,G),etat(Pn,Gn)):-
    Y is P+G,
    inf5(Pmax),
    G>0,
    P<Pmax,
    min(Y,Pmax,Pn),
    Gn is P+G-Pn.
min(X,Y,Y):-
    X>=Y,
    !.
min(X,_,X).




/*****************************************************************************
* Question 4 : Définir le prédicat : 
* but(?Etat)   qui est vrai si et seulement si Etat est un état but pour 
*              le problème des cruches.
******************************************************************************/
but(etat(4,_)).
but(etat(_,4)).






