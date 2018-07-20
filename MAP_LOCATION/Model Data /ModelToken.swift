//
//  FetchToken.swift
//  MAP_LOCATION
//
//  Created by Đỗ Hoàng Vũ on 7/19/18.
//  Copyright © 2018 Đỗ Hoàng Vũ. All rights reserved.
//

import Foundation
typealias JSON = Dictionary<AnyHashable, Any>

class Token {
    var token : String?
    init?(dict: JSON) {
        guard let token = dict["body"] as? String else {return}
        self.token = token
    }
}

