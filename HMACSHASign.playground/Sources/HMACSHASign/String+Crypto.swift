//
//  String+Crypto.swift
//
//  Created by Kristof Kovacs on 7/2/20.
//  Copyright © 2020 Kristof Kovacs. All rights reserved.
//

import Foundation

/**
    Hmac related extensions for `Strting`
*/
public extension String {
    /**
    Creates a hmac signature with the selected salt and sha algo

    - Parameters:
        - salt: The salt to use for signing
        - sha: The sha algo  to use for signing

    - Returns: A hmac signed `Strting` with the selected algo
    */
    func hmacSign(_ salt: String, _ sha: SHA) -> String? {
        guard let messageData = self.data, let secretData = salt.data else { return nil }

        return messageData.hmacSign(secretData, sha).hex
    }

    /**
    Converts a string to data

    - Returns: A Data representation of self
    */
    var data: Data? {
        return data(using: .utf8)
    }

    /**
    Hexdigests a string

    - Returns: A hex-digested version of self
    */
    var hex: String? {
        return self.data?.hex
    }
}
