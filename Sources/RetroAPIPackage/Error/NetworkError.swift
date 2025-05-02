//
//  NetworkError.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/4/24.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible, LocalizedError, Equatable {
    case invalidResponse
    case requestFailed(reason: String)
    
    // Informational responses
    case continue100
    case switchingProtocols
    case processing
    case earlyHints
    
    // Success responses
    case ok
    case created
    case accepted
    case nonAuthoritativeInformation
    case noContent
    case resetContent
    case partialContent
    case multiStatus
    case alreadyReported
    case imUsed
    
    // Redirection responses
    case multipleChoices
    case movedPermanently
    case found
    case seeOther
    case notModified
    case useProxy
    case switchProxy
    case temporaryRedirect
    case permanentRedirect
    
    // Client errors
    case badRequest
    case unauthorized
    case paymentRequired
    case forbidden
    case notFound
    case methodNotAllowed
    case notAcceptable
    case proxyAuthenticationRequired
    case requestTimeout
    case conflict
    case gone
    case lengthRequired
    case preconditionFailed
    case requestEntityTooLarge
    case requestURITooLong
    case unsupportedMediaType
    case requestedRangeNotSatisfiable
    case expectationFailed
    case imATeapot
    case misdirectedRequest
    case unprocessableEntity
    case locked
    case failedDependency
    case tooEarly
    case upgradeRequired
    case preconditionRequired
    case tooManyRequests
    case requestHeaderFieldsTooLarge
    case unavailableForLegalReasons
    
    // Server errors
    case internalServerError
    case notImplemented
    case badGateway
    case serviceUnavailable
    case gatewayTimeout
    case httpVersionNotSupported
    case variantAlsoNegotiates
    case insufficientStorage
    case loopDetected
    case notExtended
    case networkAuthenticationRequired
    
    // Non-standard error codes
    case csrfTokenMissingOrExpired
    case enhanceYourCalm
    case loginTimeout
    case noResponse
    case retryWith
    case blockedByParentalControls
    case clientClosedConnection
    case tooManyIPAddresses
    case requestHeaderTooLarge
    case sslCertificateError
    case sslCertificateRequired
    case httpToHttpsPortError
    case invalidToken
    case clientClosedRequest
    case unknownWebServerError
    case webServerIsDown
    case connectionTimedOut
    case originIsUnreachable
    case timeoutOccurred
    case sslHandshakeFailed
    case invalidSSLCertificate
    case railgunError
    case originDNSError
    case unauthorizedAWSElasticLoadBalancer
    
    // Custom description for each error
    var description: String {
        switch self {
        case .invalidResponse:
            return "Invalid response from the server"
        case .requestFailed(let reason):
            return "Request failed: \(reason)"
            
        // Informational responses
        case .continue100:
            return "Continue"
        case .switchingProtocols:
            return "Switching protocols"
        case .processing:
            return "Processing request"
        case .earlyHints:
            return "Early hints"
        
        // Success responses
        case .ok:
            return "OK"
        case .created:
            return "Resource created successfully"
        case .accepted:
            return "Request accepted but not yet processed"
        case .nonAuthoritativeInformation:
            return "Non-authoritative information"
        case .noContent:
            return "No content available"
        case .resetContent:
            return "Content reset required"
        case .partialContent:
            return "Partial content delivered"
        case .multiStatus:
            return "Multiple status codes"
        case .alreadyReported:
            return "Already reported"
        case .imUsed:
            return "IM used"

        // Redirection responses
        case .multipleChoices:
            return "Multiple choices available"
        case .movedPermanently:
            return "Resource moved permanently"
        case .found:
            return "Resource found"
        case .seeOther:
            return "See other resource"
        case .notModified:
            return "Resource not modified"
        case .useProxy:
            return "Use proxy for request"
        case .switchProxy:
            return "Switch proxy"
        case .temporaryRedirect:
            return "Temporary redirect"
        case .permanentRedirect:
            return "Permanent redirect"
        
        // Client errors
        case .badRequest:
            return "Bad request"
        case .unauthorized:
            return "Unauthorized request"
        case .paymentRequired:
            return "Payment required"
        case .forbidden:
            return "Forbidden request"
        case .notFound:
            return "Resource not found"
        case .methodNotAllowed:
            return "Method not allowed"
        case .notAcceptable:
            return "Not acceptable"
        case .proxyAuthenticationRequired:
            return "Proxy authentication required"
        case .requestTimeout:
            return "Request timeout"
        case .conflict:
            return "Conflict in request"
        case .gone:
            return "Resource is gone"
        case .lengthRequired:
            return "Length required in request"
        case .preconditionFailed:
            return "Precondition failed"
        case .requestEntityTooLarge:
            return "Request entity too large"
        case .requestURITooLong:
            return "Request URI too long"
        case .unsupportedMediaType:
            return "Unsupported media type"
        case .requestedRangeNotSatisfiable:
            return "Requested range not satisfiable"
        case .expectationFailed:
            return "Expectation failed"
        case .imATeapot:
            return "I'm a teapot"
        case .misdirectedRequest:
            return "Misdirected request"
        case .unprocessableEntity:
            return "Unprocessable entity"
        case .locked:
            return "Resource locked"
        case .failedDependency:
            return "Failed dependency"
        case .tooEarly:
            return "Request is too early"
        case .upgradeRequired:
            return "Upgrade required"
        case .preconditionRequired:
            return "Precondition required"
        case .tooManyRequests:
            return "Too many requests"
        case .requestHeaderFieldsTooLarge:
            return "Request header fields too large"
        case .unavailableForLegalReasons:
            return "Unavailable for legal reasons"
            
        // Server errors
        case .internalServerError:
            return "Internal server error"
        case .notImplemented:
            return "Feature not implemented"
        case .badGateway:
            return "Bad gateway"
        case .serviceUnavailable:
            return "Service unavailable"
        case .gatewayTimeout:
            return "Gateway timeout"
        case .httpVersionNotSupported:
            return "HTTP version not supported"
        case .variantAlsoNegotiates:
            return "Variant also negotiates"
        case .insufficientStorage:
            return "Insufficient storage"
        case .loopDetected:
            return "Loop detected"
        case .notExtended:
            return "Not extended"
        case .networkAuthenticationRequired:
            return "Network authentication required"
        
        // Non-standard error codes
        case .csrfTokenMissingOrExpired:
            return "CSRF token missing or expired"
        case .enhanceYourCalm:
            return "Enhance your calm (Rate limiting)"
        case .loginTimeout:
            return "Login timeout"
        case .noResponse:
            return "No response from server"
        case .retryWith:
            return "Retry with different request"
        case .blockedByParentalControls:
            return "Blocked by parental controls"
        case .clientClosedConnection:
            return "Client closed the connection"
        case .tooManyIPAddresses:
            return "Too many IP addresses in request"
        case .requestHeaderTooLarge:
            return "Request header too large"
        case .sslCertificateError:
            return "SSL certificate error"
        case .sslCertificateRequired:
            return "SSL certificate required"
        case .httpToHttpsPortError:
            return "HTTP request sent to HTTPS port"
        case .invalidToken:
            return "Invalid token"
        case .clientClosedRequest:
            return "Client closed the request"
        case .unknownWebServerError:
            return "Unknown error from web server"
        case .webServerIsDown:
            return "Web server is down"
        case .connectionTimedOut:
            return "Connection timed out"
        case .originIsUnreachable:
            return "Origin is unreachable"
        case .timeoutOccurred:
            return "Timeout occurred"
        case .sslHandshakeFailed:
            return "SSL handshake failed"
        case .invalidSSLCertificate:
            return "Invalid SSL certificate"
        case .railgunError:
            return "Railgun error"
        case .originDNSError:
            return "Origin DNS error"
        case .unauthorizedAWSElasticLoadBalancer:
            return "Unauthorized (AWS Elastic Load Balancer)"
        }
    }
    
    var errorDescription: String? {
        return description
    }
}

extension NetworkError {
    
    static func from(statusCode: Int) -> NetworkError {
        switch statusCode {
        // Informational responses
        case 100: return .continue100
        case 101: return .switchingProtocols
        case 102: return .processing
        case 103: return .earlyHints
        
        // Success responses
        case 200: return .ok
        case 201: return .created
        case 202: return .accepted
        case 203: return .nonAuthoritativeInformation
        case 204: return .noContent
        case 205: return .resetContent
        case 206: return .partialContent
        case 207: return .multiStatus
        case 208: return .alreadyReported
        case 226: return .imUsed
        
        // Redirection responses
        case 300: return .multipleChoices
        case 301: return .movedPermanently
        case 302: return .found
        case 303: return .seeOther
        case 304: return .notModified
        case 305: return .useProxy
        case 306: return .switchProxy
        case 307: return .temporaryRedirect
        case 308: return .permanentRedirect
        
        // Client errors
        case 400: return .badRequest
        case 401: return .unauthorized
        case 402: return .paymentRequired
        case 403: return .forbidden
        case 404: return .notFound
        case 405: return .methodNotAllowed
        case 406: return .notAcceptable
        case 407: return .proxyAuthenticationRequired
        case 408: return .requestTimeout
        case 409: return .conflict
        case 410: return .gone
        case 411: return .lengthRequired
        case 412: return .preconditionFailed
        case 413: return .requestEntityTooLarge
        case 414: return .requestURITooLong
        case 415: return .unsupportedMediaType
        case 416: return .requestedRangeNotSatisfiable
        case 417: return .expectationFailed
        case 418: return .imATeapot
        case 421: return .misdirectedRequest
        case 422: return .unprocessableEntity
        case 423: return .locked
        case 424: return .failedDependency
        case 425: return .tooEarly
        case 426: return .upgradeRequired
        case 428: return .preconditionRequired
        case 429: return .tooManyRequests
        case 431: return .requestHeaderFieldsTooLarge
        case 451: return .unavailableForLegalReasons
        
        // Server errors
        case 500: return .internalServerError
        case 501: return .notImplemented
        case 502: return .badGateway
        case 503: return .serviceUnavailable
        case 504: return .gatewayTimeout
        case 505: return .httpVersionNotSupported
        case 506: return .variantAlsoNegotiates
        case 507: return .insufficientStorage
        case 508: return .loopDetected
        case 510: return .notExtended
        case 511: return .networkAuthenticationRequired
        
        // Non-standard status codes
        case 419: return .csrfTokenMissingOrExpired
        case 420: return .enhanceYourCalm
        case 440: return .loginTimeout
        case 444: return .noResponse
        case 449: return .retryWith
        case 450: return .blockedByParentalControls
        case 460: return .clientClosedConnection
        case 463: return .tooManyIPAddresses
        case 494: return .requestHeaderTooLarge
        case 495: return .sslCertificateError
        case 496: return .sslCertificateRequired
        case 497: return .httpToHttpsPortError
        case 498: return .invalidToken
        case 499: return .clientClosedRequest
        case 520: return .unknownWebServerError
        case 521: return .webServerIsDown
        case 522: return .connectionTimedOut
        case 523: return .originIsUnreachable
        case 524: return .timeoutOccurred
        case 525: return .sslHandshakeFailed
        case 526: return .invalidSSLCertificate
        case 527: return .railgunError
        case 530: return .originDNSError
        case 561: return .unauthorizedAWSElasticLoadBalancer

        default:
            return .requestFailed(reason: "Unknown error with status code \(statusCode)")
        }
    }
}

extension NetworkError {
    
    func canBeRetried() -> Bool {
        switch self {
        case .requestTimeout,
             .tooManyRequests,
             .serviceUnavailable,
             .gatewayTimeout,
             .badGateway,
             .connectionTimedOut,
             .retryWith,
             .originIsUnreachable,
             .sslHandshakeFailed,
             .temporaryRedirect,
             .webServerIsDown,
             .earlyHints:
            return true
            
        default:
            return false
        }
    }
    
}
