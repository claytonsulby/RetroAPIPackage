// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(UserFeed_DTO.self, from: jsonData)

import Foundation

// MARK: - UserFeed_DTO
public struct UserFeed_DTO: Codable, Equatable {
    public init(message: String = "", errors: [UserFeed_DTO.Error] = []) {
        self.message = message
        self.errors = errors
    }
    

    let message: String
    let errors: [UserFeed_DTO.Error]
    
    public static func == (lhs: UserFeed_DTO, rhs: UserFeed_DTO) -> Bool {
        return lhs.message == rhs.message &&
        lhs.errors == rhs.errors
    }

}
 
public extension UserFeed_DTO {
    
    struct Error: Codable, Equatable {
        let status: Int
        let code, title: String
        
        public static func == (lhs: UserFeed_DTO.Error, rhs: UserFeed_DTO.Error) -> Bool {
            return lhs.status == rhs.status &&
            lhs.code == rhs.code &&
            lhs.title == rhs.title
        }
    }
    
}
