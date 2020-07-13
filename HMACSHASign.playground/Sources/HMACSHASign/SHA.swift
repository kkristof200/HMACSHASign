//
//  SHA.swift
//
//  Created by Kristof Kovacs on 7/2/20.
//  Copyright © 2020 Kristof Kovacs. All rights reserved.
//

import Foundation
import CommonCrypto

/**
    Enum of all SHA types that ar currently supported
*/
public enum SHA {
    case sha1, sha224, sha256, sha384, sha512

    /**
        The digest length to use when signing with hmac
    */
    var digestLength: Int {
        switch self {
        case .sha1:   return Int(CC_SHA1_DIGEST_LENGTH)
        case .sha224: return Int(CC_SHA224_DIGEST_LENGTH)
        case .sha256: return Int(CC_SHA256_DIGEST_LENGTH)
        case .sha384: return Int(CC_SHA384_DIGEST_LENGTH)
        case .sha512: return Int(CC_SHA512_DIGEST_LENGTH)
        }
    }

    /**
        The algorithm to use when signing with hmac
    */
    var hmacAlgo: CCHmacAlgorithm {
        switch self {
        case .sha1:   return CCHmacAlgorithm(kCCHmacAlgSHA1)
        case .sha224: return CCHmacAlgorithm(kCCHmacAlgSHA224)
        case .sha256: return CCHmacAlgorithm(kCCHmacAlgSHA256)
        case .sha384: return CCHmacAlgorithm(kCCHmacAlgSHA384)
        case .sha512: return CCHmacAlgorithm(kCCHmacAlgSHA512)
        }
    }
}
