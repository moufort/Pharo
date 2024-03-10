Class {
	#name : #JavaDoc,
	#superclass : #Object,
	#category : #JavaDoc
}

{ #category : #methods }
JavaDoc class >> GenerateDocWithStream: packageName [
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
						nextPutAll: key;
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
	^ stream contents
]
