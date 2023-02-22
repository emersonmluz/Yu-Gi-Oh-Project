//
//  ApiManager.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 21/02/23.
//

import Foundation
import Alamofire

class ApiManager {
    
    private let alamofireManager = Alamofire.Session()
    private var url: String = ""
    
    init(url: String) {
        self.url = url
    }
    
    internal func fetchData() {
        alamofireManager.request(self.url).validate(statusCode: 200..<300).validate(contentType: ["application/json"]).response { response in
            switch response.result {
            case .success:
                print("fazer decoder")
            case .failure:
                print("tratar error")
            }
        }
    }
}
