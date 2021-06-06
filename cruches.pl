/* Ce fichier est encodé en UTF-8 et suit la syntaxe du langage Prolog       */
/* Merci de NE PAS MODIFIER LE SYSTEME D'ENCODAGE                            */

/* Nom du binome :    BEN_CHEIKH - NOM2     										 */
/*           (TODO : remplacez Nom1 et Nom2 par vos noms dans l'ordre alphabétique) */

/*****************************************************************************
*              Modélisation du domaine du problème des cruches
******************************************************************************/


/*****************************************************************************
* Question 0 :  
*
* Proposer une structure permettant de représenter un état pour le problème
* des cruches (nb il n'y a pas de relation à définir - décrire juste la
* structure que vous comptez utiliser, en précisant le sens de chaque argument)
*
* Réponse : 
*			On utilise une structure couple(P,G)
* où... 
	P : volume rempli de la petite cruche
	G : volume rempli de la grande cruche
*            
******************************************************************************/
set_flag(Pmax,5).
set_flag(Gmax,7).

couple(P,G):-
	P =< Pmax,
	P >= 0,
	G =< Gmax,
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
cons_etat_cruche(P, G, couple(P,G)).




/*****************************************************************************
* Question 2 : Ecrire le code du prédicat :

* etat_cruche(?Terme)  qui est vrai si et seulement si Terme est un terme prolog
*                      qui représente bien un état pour le problème des cruches.
******************************************************************************/
etat_cruche(couple(P,G)):-
	



/*****************************************************************************
* Question 3 : Définir un prédicat :

* operateur(?Nom,?Etat,?NEtat)
					qui est vrai si et seulement si Nom est le nom d'un opérateur 
*					applicable pour le problème des cruches, permettant de  
					passer d'un état Etat à un successeur état NEtat.
******************************************************************************/
operateur(vider_petite,couple(P,G),couple(0,G)).
operateur(vider_grande,couple(P,G),couple(0,G)).
operateur(remplir_P,couple(P,G),couple(Pmax,G)).
operateur(remplir_G,couple(P,G),couple(P,Gmax)).





/*****************************************************************************
* Question 4 : Définir le prédicat : 
* but(?Etat)   qui est vrai si et seulement si Etat est un état but pour 
*              le problème des cruches.
******************************************************************************/






