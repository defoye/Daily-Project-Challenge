//
//  FirebaseEndpoint.swift
//  StockFetch
//
//  Created by Ernest DeFoy on 6/26/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation
import FirebaseFirestore

fileprivate enum FirestoreCollection : String {
	case symbols = "symbols"
}

fileprivate enum FirestoreDocumentId : String {
	case topPick = "topPick"
	case weeklyPerformers = "weeklyPerformers"
	case testDocument = "testDocument"
}

public struct Quote: Decodable {
	let symbol: String
	let price: Double
	
//	enum Symbol: String, CodingKey {
//		case symbol = "symbol"
//	}
}

public protocol StockFetchFirestoreAPIProtocol {
	var topPickRef: DocumentReference { get }
	var testDocumentRef: DocumentReference { get }
	var quotesDocumentRef: DocumentReference { get }

	// TODO: temp.
	func fetchQutoes()
}

class StockFetchFirestoreAPI: StockFetchFirestoreAPIProtocol {
	var topPickRef: DocumentReference
	var testDocumentRef: DocumentReference
	var quotesDocumentRef: DocumentReference
	
	init() {
		let db = Firestore.firestore()
		
		let symbolsCollectionId: String = FirestoreCollection.symbols.rawValue
		let symbolsCollection: CollectionReference = db.collection(symbolsCollectionId)
		
		let topPickDocumentId: String = FirestoreDocumentId.topPick.rawValue
		let testDocumentDocumentId: String = FirestoreDocumentId.testDocument.rawValue
		let quotesDocumentId: String = "TwarM3j3ZPKDhY8BZfsf"
		
		self.topPickRef = symbolsCollection.document(topPickDocumentId)
		self.testDocumentRef = symbolsCollection.document(testDocumentDocumentId)
		self.quotesDocumentRef = symbolsCollection.document(quotesDocumentId)
	}
}

extension StockFetchFirestoreAPI {
	public func fetchQutoes() {
		self.quotesDocumentRef.fetch { (quotes: [Quote]?) in
			guard let quotes: [Quote] = quotes else { return }
			print(quotes)
		}
//		let APIResponse: [Quote] = try decoder.decode([Quote], from: data)
	}
}

extension DocumentSnapshot {
	
	func decodedSnapshot<Model: Decodable>() -> Model? {
		do {
			guard let data = self.data() else {
				print("Problem getting document data")
				return nil
			}
			let json = try JSONSerialization.data(withJSONObject: data, options: [])
			do {
				let model = try JSONDecoder().decode(Model.self, from: json)
				print(model)
				return model
			} catch let err {
				print("Decoding Error: \(err)")
			}
		} catch let err {
			print("Serialization Error: \(err)")
		}
		
		return nil
	}
}

extension DocumentReference {
	public func fetch<Model : Decodable>(completion: @escaping (Model?) -> Void) {
		
		self.getDocument { (document, error) in
			if let document = document, document.exists {
				let dataDescription: String = document.data().map(String.init(describing:)) ?? "nil"
				print("Document data: \(dataDescription)")
				completion(document.decodedSnapshot())
			} else {
				print("Document does not exist")
			}
		}
		
		completion(nil)
	}
}

//enum AlphaAdvantageNetworkEnvironment {
//	case alphaAdvantageEnvironment
//}
//
//public enum AlphaAdvantageAPI {
//	case timeSeriesIntraday(function: String, symbol: String, interval: String)
//}
//
//extension AlphaAdvantageAPI: EndPointType {
//
//	var environmentBaseURL : String {
//		switch AlphaAdvantageDataManager.environment {
//		case .alphaAdvantageEnvironment: return "https://www.alphavantage.co/"
//		}
//	}
//
//	var baseURL: URL {
//		guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
//		return url
//	}
//
//	var path: String {
//		switch self {
//		case .timeSeriesIntraday:
//			return "query"
//		}
//	}
//
//	var httpMethod: HTTPMethod {
//		return .get
//	}
//
//	var task: HTTPTask {
//		switch self {
//		case .timeSeriesIntraday(let function, let symbol, let interval):
//			return .requestParameters(bodyParameters: nil,
//									  urlParameters: ["function":function,
//													  "symbol":symbol,
//													  "interval":interval,
//													  "apikey":AlphaAdvantageDataManager.AlphaAdvantageAPIKey])
//		default:
//			return .request
//		}
//	}
//
//	var headers: HTTPHeaders? {
//		return nil
//	}
//}
