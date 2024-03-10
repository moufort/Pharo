Class {
	#name : #MyMatriceTest,
	#superclass : #TestCase,
	#category : #Matrice
}

{ #category : #tests }
MyMatriceTest >> testCreuseToTraditionnal [

| matrice test |

matrice := #( #(1 0 2) #(0 0 3) #(0 4 0) #(0 0 5)).
test := MyMatrice new.
test matrice: matrice.
test matriceHeight: matrice size.
test matriceWidth: (matrice at: 1) size.
test creuseToTraditionnal.
self assert: (test matrice) size equals: 5. 
self assert: ((test matrice at:1) at: 1) equals: 1@1.
self assert: ((test matrice at:5) at: 1) equals: 3@4. 
self assert: ((test matrice at:1) at: 2) equals: 1. 
self assert: ((test matrice at:5) at: 2) equals: 5.
]

{ #category : #tests }
MyMatriceTest >> testShowCreuse [

| matrice test |

matrice := #( #(1 0 2) #(0 0 3) #(0 4 0) #(0 0 5)).
test := MyMatrice new.
test matrice: matrice.
test matriceHeight: matrice size.
test matriceWidth: (matrice at: 1) size.
self assert: test showMatrice equals: 'Matrice Creuse
1 0 2 
0 0 3 
0 4 0 
0 0 5 
'. 
]

{ #category : #tests }
MyMatriceTest >> testShowTraditionnal [

| matrice test |

matrice := #( #(1 0 2) #(0 0 3) #(0 4 0) #(0 0 5)).
test := MyMatrice new.
test matrice: matrice.
test matriceHeight: matrice size.
test matriceWidth: (matrice at: 1) size.
test creuseToTraditionnal.
self assert: test showMatrice equals: 'Matrice Traditionnelle
X  Y  Valeur
1  1  1
3  1  2
3  2  3
2  3  4
3  4  5
'. 
]

{ #category : #tests }
MyMatriceTest >> testTraditionnalToCreuse [

| matrice test |

matrice := #( #(1 0 2) #(0 0 3) #(0 4 0) #(0 0 5)).
test := MyMatrice new.
test matrice: matrice.
test matriceHeight: matrice size.
test matriceWidth: (matrice at: 1) size.
test creuseToTraditionnal.
test traditionnalToCreuse.
self assert: test matrice equals: #( #(1 0 2) #(0 0 3) #(0 4 0) #(0 0 5))
]
