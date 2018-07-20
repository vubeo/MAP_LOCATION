//
//  _FetchToken.swift
//  MAP_LOCATION
//
//  Created by Đỗ Hoàng Vũ on 7/19/18.
//  Copyright © 2018 Đỗ Hoàng Vũ. All rights reserved.
//

import Foundation
import UIKit

public class FetchToken {
    
    var _token = String()
    
    // ----------login FaKE---------------
    func postAction() {
        let Url = String(format: "http://192.168.1.67/revivemap/public/api/auth/login")
        guard let serviceUrl = URL(string: Url) else { return }
        //        let loginParams = String(format: LOGIN_PARAMETERS1, "test", "Hi World")
        let parameterDictionary = ["email": "thang@gmail.com",
                                   "password" : "111111"]
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    let dictContaintObject = json as! Dictionary<String,Any>
                    let token = dictContaintObject["body"] as! String
                    self._token = token
                    UserDefaults.standard.set(token, forKey: "Token")
                    print(self._token)
                }catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}

