// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(UserFeed_DTO.self, from: jsonData)

import Foundation

// MARK: - UserFeed_DTO
public struct UserFeed_DTO: Codable, Equatable {
    public init(success: Bool? = nil) {
        self.success = success
    }
    
    public var success: Bool?
    
    public static func == (lhs: UserFeed_DTO, rhs: UserFeed_DTO) -> Bool {
        return lhs.success == rhs.success
    }
}
