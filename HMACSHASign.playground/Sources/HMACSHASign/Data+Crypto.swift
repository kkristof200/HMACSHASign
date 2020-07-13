//
//  Data+Crypto.swift
//
//  Created by Kristof Kovacs on 7/2/20.
//  Copyright © 2020 Kristof Kovacs. All rights reserved.
//

import Foundation
import CommonCrypto

/**
    Hmac related extensions for `Data`
*/
public extension Data {
    /**
    Creates a hmac signature with the selected salt and sha algo.

    - Parameters:
        - salt: The salt to use for signing
        - sha: The sha algo  to use for signing

    - Returns: A hmac signed `Data` with the selected algo
    */
    func hmacSign(_ salt: Data, _ sha: SHA) -> Data {
        let signature = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: sha.digestLength)
        defer { signature.deallocate() }

        self.withUnsafeBytes { messageBytes in
            salt.withUnsafeBytes { saltBytes in
                CCHmac(sha.hmacAlgo, saltBytes.baseAddress, salt.count, messageBytes.baseAddress, self.count, signature)
            }
        }

        return Data(bytes: signature, count: sha.digestLength)
    }

    /**
    Hexdigests a data

    - Returns: A hex-digested `String` version of self
    */
    var hex: String {
        return map { String(format: "%02x", $0) }.reduce("", +)
    }
}
