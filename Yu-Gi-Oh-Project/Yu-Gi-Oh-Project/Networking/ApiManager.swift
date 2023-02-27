//
//  ApiManager.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 21/02/23.
//

import Foundation
import Alamofire

final class ApiManager {
    
    private let alamofireManager = Alamofire.Session()
    private var url: String = ""
    
    init(url: String) {
        self.url = url
    }
    
    internal func fetchData(completion: @escaping(_ cardList: CardList?, _ error: NSError?) -> Void) {
        alamofireManager.request(self.url).validate(statusCode: 200..<300).validate(contentType: ["application/json"]).response { response in
            switch response.result {
            case .success:
                guard let jsonData = response.data, response.error == nil else {return}
                do {
                    let cardList = try JSONDecoder().decode(CardList.self, from: jsonData)
                    completion(cardList, nil)
                } catch let error as NSError {
                    completion(nil, error)
                }
            case .failure:
                guard let error = response.error as? NSError else {return}
                completion(nil, error)
            }
        }
    }
}
