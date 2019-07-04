//
//  FirestoreDataCenter.swift
//  TryOutFirebase
//
//  Created by Ernest DeFoy on 6/25/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Firebase

protocol FirestoreCollectionManagerProtocol {
	init(collectionReference: CollectionReference)
}

struct FirestoreCollectionManager: FirestoreCollectionManagerProtocol {
	private let collectionReference: CollectionReference
	
	init(collectionReference: CollectionReference) {
		self.collectionReference = collectionReference
	}
	
	func addDocumentData<Model : Encodable>(model: Model) {
		collectionReference.addDocument(model: model)
	}
}


//			guard let lastSnapshot = snapshot.documents.last else {
//				// The collection is empty.
//				return
//			}
			
			// Construct a new query starting after this document,
			// retrieving the next 25 cities.
//			let next = db.collection("cities")
//				.order(by: "population")
//				.start(afterDocument: lastSnapshot)
			
			// Use the query for pagination.
			// ...
//		}
//	}
//}
