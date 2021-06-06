/* Ce fichier est encodé en UTF-8 et suit la syntaxe du langage Prolog      */
/* Merci de NE PAS MODIFIER LE SYSTEME D'ENCODAGE     */


/* Nom du binome :    NOM1 - NOM2     										 */
/*           (TODO : remplacez Nom1 et Nom2 par vos noms dans l'ordre alphabétique) */


/*****************************************************************************
* On suppose que l'on dispose d'un domaine de problème, caractérisé par 
*
*  - une relation operateur/3
*  - une relation but/1
*
* On souhaite coder un algorithme de recherche de chemin solution de faisant 
* aucune autre hypothèse que celle de la modélisation du domaine du problème
* a l'aide des relations précédentes.
*
* Définir les relations suivantes : 
******************************************************************************/




/*****************************************************************************
* rprof(+Etat,-Solution)	 qui est vrai si et seulement si Solution est une suite
*					         d'états caractérisant un chemin solution depuis Etat
*						     vers un état du But.
******************************************************************************/
rprof(Etat,[Etat]):-
    but(Etat).
rprof(Etat,[Etat|Sol]):-
    operateur(Op,Etat,Etat1),
    rprof(Etat1,Sol).


/*****************************************************************************
* rprof_ss_cycle(+Etat,-Solution)	  qui est vrai si et seulement si Solution est 
*			une suite d'états sans cycle, caractérisant un chemin solution depuis
*			Etat vers un état du But.
******************************************************************************/
test_app(X,[Y|L]):-
    X==Y,
    !.
test_app(X,[Y|L]):-
    X\==Y,
    test_app(X,L).
rprof_ss_cycle(Etat,[Etat]):-
    but(Etat).    
rprof_ss_cycle(Etat,[Etat|Sol]):-
    operateur(Op,Etat,Etat1),
    \+ test_app(Etat,Sol),
    rprof_ss_cycle(Etat1,Sol).




/*****************************************************************************
* Une nouvelle version de ce prédicat permettant limiter
* la profondeur de recherche.
*  
* rprof_bornee(+Etat,-Solution,+ProfMax)
*     qui est vrai si et seulement si Solution est une suite d'au plus ProfMax
*	  états caractérisant un chemin solution depuis Etat vers un état du But.
******************************************************************************/
rprof_bornee(Etat,[Etat],_):-
    but(Etat).
rprof_bornee(Etat,[Etat|Sol],ProfMax):-
    ProfMax>0,
    operateur(Op,Etat,Etat1),
    ProfMax1 is ProfMax-1,
    rprof_bornee(Etat1,Sol,ProfMax1).       





/*****************************************************************************
* rprof_incr(+Etat,-Solution,+ProfMax)
*     qui est vrai si et seulement si Solution est une suite d'au plus ProfMax
*	  états caractérisant recherchée suivant une stratégie de recherche itérative
*     à profondeur incrémentale.
******************************************************************************/
rprof_incr(Etat,[Etat],_):-
    but(Etat).
rprof_incr(Etat,Sol,ProfMax):-
    rprof        



