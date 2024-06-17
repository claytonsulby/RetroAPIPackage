// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
public struct FriendsList_DTO: Codable, Equatable {
    public init(success: Bool? = nil, friends: [Friend_DTO]? = nil, error: String? = nil) {
        self.success = success
        self.friends = friends
        self.error = error
    }
    
    public var success: Bool?
    public var friends: [Friend_DTO]?
    public var error: String?

    enum CodingKeys: String, CodingKey {
        case success = "Success"
        case friends = "Friends"
        case error = "Error"
    }
    
    public static func == (lhs: FriendsList_DTO, rhs: FriendsList_DTO) -> Bool {
        return lhs.success == rhs.success &&
            lhs.friends == rhs.friends &&
            lhs.error == rhs.error
    }
}

// MARK: - Friend
public struct Friend_DTO: Codable, Equatable {
    public init(friend: String? = nil, raPoints: Int? = nil, lastSeen: String? = nil, id: Int? = nil) {
        self.friend = friend
        self.raPoints = raPoints
        self.lastSeen = lastSeen
        self.id = id
    }
    
    public var friend, lastSeen: String?
    public var id, raPoints: Int?

    enum CodingKeys: String, CodingKey {
        case friend = "Friend"
        case raPoints = "RAPoints"
        case lastSeen = "LastSeen"
        case id = "ID"
    }
    
    public static func == (lhs: Friend_DTO, rhs: Friend_DTO) -> Bool {
        return lhs.friend == rhs.friend &&
            lhs.raPoints == rhs.raPoints &&
            lhs.lastSeen == rhs.lastSeen &&
            lhs.id == rhs.id
    }
}
