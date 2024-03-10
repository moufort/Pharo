"
La classe MyMatrice permet de d'afficher des matrices creuse et des matrices traditionnelle, ainsi qu'elle permet de les convertir entre ces 2 formes.

Une matrice creuse est une matrice standard mais qui contient beaucoup de 0. Ici elles sont représenter avec des tableaux à deux dimensions, une valeur par case.
Une matrice traditionnelle est une matrice ou toute les valeurs différente de 0 sont rangée avec leur coordonée dans le tableau, ainsi, on évite de prendre trop de place quand il y a de trés nombreux 0 dans la matrice. Ici elles sont stocké dans des tableaux à 2 dimensions, avec 2 colonnes : la premiére pour un objet Point, la seconde pour la valeur, contenant la position x et la position y.

Dans cette classe, il n'y a que des méthodes et des variables d'instances. Les instances possédent une matrice, une hauteur et une largeur.
Lors de l'initialisations, vous pouvez donner une matrice avec la fonction matrice:, si elle est creuse, il n'y a pas besoin de spécifier la taille, si elle est traditionnelle, alors il faut spécifier la taille de la matrice, dans les cas ou il y aurait des lignes et des colonnes remplie de 0.

Pour convertir une matrice creuse en matrice traditionnelle, vous pouvez utiliser la fonction creuseToTraditionnal, pour faire le contraire il y a la fonction traditionnalToCreuse. Ces méthodes changent leur variable matrice, et renvoit la nouvelle matrice.

Pour afficher les matrices, il existe la fonction showMatrice, qui vérifie si la première colonne de la première ligne est un point, si c'est le cas, elle appellent la méthode showTraditionnal pour afficher les matrices traditionnelles, sinon elle apelle showCreuse.

Exemple pour le playgroud :

""| matrice test |

Transcript clear.

matrice := #( #(1 0 2) #(0 0 3) #(0 4 0) #(0 0 5)).
test := MyMatrice new.
test matrice: matrice.
test matriceHeight: matrice size.
test matriceWidth: (matrice at: 1) size.

Transcript show: test showMatrice; cr.

test creuseToTraditionnal.

Transcript show: test showMatrice; cr.

test traditionnalToCreuse .

Transcript show: test showMatrice; cr.""
"
Class {
	#name : #MyMatrice,
	#superclass : #Object,
	#instVars : [
		'matrice',
		'matriceHeight',
		'matriceWidth'
	],
	#category : #Matrice
}

{ #category : #accessing }
MyMatrice >> creuseToTraditionnal [
	| newMatrice |
	"Je crée une nouvelle liste pour contenir toute mes valeurs"
	newMatrice := OrderedCollection new.
	self matriceHeight: matrice size.
	self matriceWidth: (matrice at: 1) size.
	self matrice
		keysAndValuesDo: [ :ligne :each | 
			each
				keysAndValuesDo: [ :colonne :each2 | 
					each2 = 0
						ifFalse: [ newMatrice add: (Array new: 2).
							newMatrice last at: 1 put: colonne @ ligne.
							newMatrice last at: 2 put: each2 ] ] ].
	"Pour chaque valeur, si la valeur est différente de 0, alors ajoute dans matrice un tableau avec un point pour les coordonnée et une valeur"
	self matrice: newMatrice.
	^ newMatrice
]

{ #category : #accessing }
MyMatrice >> matrice [
	^ matrice
]

{ #category : #accessing }
MyMatrice >> matrice: newMatrice [
	matrice := newMatrice
]

{ #category : #accessing }
MyMatrice >> matriceHeight [
	^ matriceHeight
]

{ #category : #accessing }
MyMatrice >> matriceHeight: newMatriceHeight [
	matriceHeight := newMatriceHeight
]

{ #category : #accessing }
MyMatrice >> matriceWidth [
	^ matriceWidth
]

{ #category : #accessing }
MyMatrice >> matriceWidth: newMatriceWidth [
	matriceWidth := newMatriceWidth 
]

{ #category : #showing }
MyMatrice >> showCreuse [
	
	| stream |
	
	stream := WriteStream on: String new.
	stream nextPutAll: 'Matrice Creuse'; nextPut: Character cr.
	matrice do: [ :ligne |
		ligne do: [ :colonne | 
			stream nextPutAll: colonne printString; 
			nextPutAll: ' '.
			 ].
		stream nextPut: Character cr.
		].
	
	stream close.
	
	^ stream contents
	

]

{ #category : #showing }
MyMatrice >> showMatrice [

	((matrice at:1) at:1) isPoint ifTrue: [ ^ self showTraditionnal ]
	ifFalse: [ ^ self showCreuse ]
	

]

{ #category : #showing }
MyMatrice >> showTraditionnal [
	
	| stream |
	
	stream := WriteStream on: String new.
	stream nextPutAll: 'Matrice Traditionnelle'; nextPut: Character cr.
	stream nextPutAll: 'X  Y  Valeur'; nextPut: Character cr.
	matrice do: [ :ligne |
		stream nextPutAll: ((ligne at:1) x) printString;
		nextPutAll: '  ';
		nextPutAll: ((ligne at:1) y) printString;
		nextPutAll: '  ';
		nextPutAll: (ligne at:2) printString;
		nextPut: Character cr.
		].
	
	stream close.
	
	^ stream contents
	

]

{ #category : #accessing }
MyMatrice >> traditionnalToCreuse [
	| newMatrice newLine i |
	"Je crée une nouvelle liste contenant 'height' ligne pour contenir toute mes valeurs"
	newMatrice := Array new: self matriceHeight.
	"j'initialise un compteur à 1"
	i := 1.
	newMatrice
		keysAndValuesDo: [ :ligne :each | 
			newLine := Array new: self matriceWidth.
			newLine
				keysAndValuesDo: [ :colonne :each2 | 
					i <= matrice size
						ifFalse: [ newLine at: colonne put: 0 ]
						ifTrue: [ colonne @ ligne = ((matrice at: i) at: 1)
								ifTrue: [ newLine at: colonne put: ((matrice at: i) at: 2).
									i := i + 1 ]
								ifFalse: [ newLine at: colonne put: 0 ] ] ].
			newMatrice at: ligne put: newLine ].
	"Pour chaque ligne, initialisé une nouvelle ligne"
	"Si i à dépasser la taille de la matrice initial, alors il n'y a plus aucune valeur à récupérer, on compléte avec des 0."
	"Si le point colonne@ligne est égale au point du point actuellement recherché, alors ajouté la valeur associé, sinon ajouté 0."
	"Ajouter la ligne à la nouvelle matrice"
	self matrice: newMatrice.
	^ newMatrice
]
