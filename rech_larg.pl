/* Ce fichier est encodé en UTF-8 et suit la syntaxe du langage Prolog      */
/* Merci de NE PAS MODIFIER LE SYSTEME D'ENCODAGE     */

/* Ce fichier est encodé en UTF-8 et suit la syntaxe du langage Prolog      */
/* Merci de NE PAS MODIFIER LE SYSTEME D'ENCODAGE     */


/* Nom du binome :    BEN CHEIKH - EZZAHERY     										 */
/*           (TODO : remplacez Nom1 et Nom2 par vos noms dans l'ordre alphabétique) */

/*****************************************************************************
*					          PARTIE 4
*
* L'algorithme de recherche en profondeur s'implémente tres facilement en Prolog
* car la stratégie de preuve mise en oeuvre par le démonstrateur de Prolog
* suit elle même une stratégie en profondeur.
* 
* Le codage de l'algorithme de recherche en largeur est un peu moins direct
* car on a besoin de pouvoir connaitre tous les successeurs d'un état.
*
* Pour cela il existe un prédicat prédéfini en prolog, qui permet de trouver
* toutes les solutions d'un but. Ce prédicat s'appelle findall/3.
*
******************************************************************************/


/*****************************************************************************
1) lisez la documentation de ce prédicat en tapant help(findall/3)
     et testez le sur des exemples simples pour bien comprendre comment
     fonctionne ce prédicat.
******************************************************************************/
lives_in(belladen, belfort).
lives_in(soukaina, paris).
lives_in(ahmed, toulouse).
lives_in(youssef, paris).
lives_in(ayoub, paris).

/*en tapant findall(X,lives_in(X,paris),L). ca renvoit
L = [soukaina, youssef, ayoub].*/


/*****************************************************************************
* 2) Pour connaître tous les succeseurs d'un état E il suffira alors 
* d'utiliser :
*      	...
*       findall(NE, operateur(OP,E,NE), Successeurs)
*       ....
*
* > vérifiez cela manuellement sur quelques états des cruches et/ou du taquin
* > nb : à la place de NE, vous pouvez aussi mettre n'importe quel terme qui contient NE.
******************************************************************************/
/*Par exemple: en exécutant findall(NE,operateur(OP,etat(0,0),NE),Succ). ca renvoit: 
Succ = [etat(5, 0), etat(0, 7)].


en exécutant findall(NE,operateur(OP,etat(0,1),NE),Succ). ca renvoit: 
Succ = [etat(0, 0), etat(5, 1), etat(0, 7), etat(1, 0)].

*/

/*****************************************************************************
* 3) Le codage de l'algorithme de recherche en larguer nécessite alors
* de construire le graphe de recherche et sa frontière.
* une façon simple de représenter la structure de ce graphe est de 
* représenter chaque noeud par une structure de la forme : 
*
*      nd(E, Pere) 
* 
* où - E est l'état associé au noeud
*    - Pere est le noeud parent de ce noeud (ou nil si le noeud correspond à l'état initial)
* 
* On peut alors représenter la frontière simplement par une liste de noeuds.
* mais pour garantir que l'exploration s'effectue bien en largeur il faudra bien
* veiller à développer à chaque étape, le noeud le plus ancien parmi ceux de la frontière
* (attention à la façon dont vous rajoutez des noeuds à la frontière).
******************************************************************************/
nd(E, nil):-
     etat_cruche(E).
nd(E,Pere):-
     etat_cruche(E),
     Pere = nd(E1,_),
     operateur(_,E1,E).



 
 
 
 
 
/*****************************************************************************
* Definir le prédicat :
* rech_larg(+E,-Sol,-NNA,-NND) 
*		qui construit un chemin solution Sol depuis l'état E, en construisant le graphe
*        de recherche suivant une stratégie en largeur d'abord.
*		-NNA,-NND sont des entiers correspondants respectivement au nombre de noeuds
*		 apparus et développés 
*
* nb : Vous aurez besoin de définir 
*		- une procédure auxiliaire, qui explicite la frontière du graphe et les états déjà
*		- developpés et effectue la recherche
*		- une procédure auxiliaire qui reconstruit le chemin solution lorsqu'un état but a été atteint.
******************************************************************************/


rech_larg(E,Sol,NNA,NND):-
     rech_larg_aux([nd(E,nil)],NoeudBut,[],NNA,NND),
     recon(NoeudBut,Sol1),
     reverse(Sol1,Sol).


rech_larg_aux([nd(E,Pere)|_],nd(E,Pere),_,1,0):-
     but(E).

rech_larg_aux([Nd|Frnt],NoeudBut,Develp,NNA,NND):-
     Nd = nd(E,_),
     findall(nd(Succ,Nd),(operateur(_,E,Succ),\+ member(Succ,[E|Develp])),Successeurs),
     append(Frnt,Successeurs,NFrnt),
     rech_larg_aux(NFrnt,NoeudBut,[E|Develp],NNNA,NNND),
     length(Successeurs,Length),
     NNA is NNNA+Length,
     NND is NNND+1.

recon(nd(E,nil),[E]).
recon(nd(E,Pere),[E|Sol]):-
     recon(Pere,Sol).









