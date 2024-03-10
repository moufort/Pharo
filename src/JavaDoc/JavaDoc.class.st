"
La classe JavaDoc permet de faire de la documentation de toutes les classe à partir d'un package.

La méthode GenerateDoc: prend un package en paramétre, et affiche pour chaque classe du package :

le nom de la classe,
	La super classe,
	Les sous classes,
	Les méthodes senders avec :
		Les noms de méthodes:
			Les senders de la méthodes
	Les varaible d'instance avec:
		Les méthodes qui appellent la variable.
		
GenerateDoc est une méthodes de class, il n'y a pas besoin de crée une instance pour l'utiliser, pour ce faire, il faut juste faire :
JavaDoc GenerateDoc: 'Le nom du package'.

Attention, la méthode peut prendre du temps pour des Packages trés remplie.
"
Class {
	#name : #JavaDoc,
	#superclass : #Object,
	#category : #JavaDoc
}

{ #category : #methods }
JavaDoc class >> GenerateDoc: packageName [
	| package classes stream |
	package := packageName asPackage.
	classes := package classes.
	stream := WriteStream on: String new.
	classes
		do: [ :class | 
			stream
				nextPutAll: class name;
				nextPut: Character cr;
				"Super classe"
					nextPutAll: '	Superclasse :';
				nextPutAll: class superclass name;
				nextPut: Character cr;
				"Sous classe"
					nextPutAll: '	Sousclasse :';
				nextPut: Character cr.
			class
				allSubclassesDo: [ :subClasses | 
					stream
						nextPutAll: '      ';
						nextPutAll: subClasses name;
						nextPut: Character cr ].

			"Méthode et senders"
			stream
				nextPutAll: '	méthodes Senders:';
				nextPut: Character cr.
			class methodDict
				keysAndValuesDo: [ :key :value | 
					stream
						nextPutAll: '		 ';
						nextPutAll: key printString;
						nextPutAll: ' senders :';
						nextPut: Character cr.
					(SystemNavigation default allSendersOf: key)
						do: [ :sender | 
							stream
								nextPutAll: '		    ';
								nextPutAll: sender name;
								nextPut: Character cr ] ].

			"Variable d'instance"
			stream
				nextPutAll: '   variables d instance :';
				nextPut: Character cr.
			class instVarNames
				do: [ :inst | 
					stream
						nextPutAll: '		 ';
						nextPutAll: inst;
						nextPutAll: ' call :';
						nextPut: Character cr.
					(SystemNavigation default allCallsOn: inst)
						do: [ :call | 
							stream
								nextPutAll: '		    ';
								nextPutAll: call name;
								nextPut: Character cr ] ] ].
	stream close.
	^ stream contents
]
