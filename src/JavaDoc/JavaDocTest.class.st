Class {
	#name : #JavaDocTest,
	#superclass : #TestCase,
	#category : #JavaDoc
}

{ #category : #tests }
JavaDocTest >> testGenerateDoc [

self assert: (JavaDoc GenerateDoc: 'Matrice') equals: 'MyMatrice
	Superclasse :Object
	Sousclasse :
	méthodes Senders:
		 matriceWidth senders :
		    MyMatrice>>#traditionnalToCreuse
		 showCreuse senders :
		    MyMatrice>>#showMatrice
		 creuseToTraditionnal senders :
		    MyMatriceTest>>#testShowTraditionnal
		    MyMatriceTest>>#testCreuseToTraditionnal
		    MyMatriceTest>>#testTraditionnalToCreuse
		 showTraditionnal senders :
		    MyMatrice>>#showMatrice
		 matriceWidth: senders :
		    MyMatrice>>#creuseToTraditionnal
		    MyMatriceTest>>#testShowCreuse
		    MyMatriceTest>>#testShowTraditionnal
		    MyMatriceTest>>#testCreuseToTraditionnal
		    MyMatriceTest>>#testTraditionnalToCreuse
		 showMatrice senders :
		    MyMatriceTest>>#testShowCreuse
		    MyMatriceTest>>#testShowTraditionnal
		 matrice senders :
		    MyMatrice>>#creuseToTraditionnal
		    MyMatriceTest>>#testCreuseToTraditionnal
		    MyMatriceTest>>#testTraditionnalToCreuse
		 matriceHeight senders :
		    MyMatrice>>#traditionnalToCreuse
		 matriceHeight: senders :
		    MyMatrice>>#creuseToTraditionnal
		    MyMatriceTest>>#testShowCreuse
		    MyMatriceTest>>#testShowTraditionnal
		    MyMatriceTest>>#testCreuseToTraditionnal
		    MyMatriceTest>>#testTraditionnalToCreuse
		 matrice: senders :
		    MyMatrice>>#creuseToTraditionnal
		    MyMatrice>>#traditionnalToCreuse
		    MyMatriceTest>>#testShowCreuse
		    MyMatriceTest>>#testShowTraditionnal
		    MyMatriceTest>>#testCreuseToTraditionnal
		    MyMatriceTest>>#testTraditionnalToCreuse
		 traditionnalToCreuse senders :
		    MyMatriceTest>>#testTraditionnalToCreuse
   variables d instance :
		 matrice call :
		    MyMatrice>>#creuseToTraditionnal
		    MyMatriceTest>>#testCreuseToTraditionnal
		    MyMatriceTest>>#testTraditionnalToCreuse
		 matriceHeight call :
		    MyMatrice>>#traditionnalToCreuse
		 matriceWidth call :
		    MyMatrice>>#traditionnalToCreuse
MyMatriceTest
	Superclasse :TestCase
	Sousclasse :
	méthodes Senders:
		 testShowCreuse senders :
		 testShowTraditionnal senders :
		 testCreuseToTraditionnal senders :
		 testTraditionnalToCreuse senders :
   variables d instance :
'.
]
