// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
public struct FriendsList_DTO: Codable {
    public var success: Bool?
    public var friends: [Friend_DTO]?
    public var error: String?

    enum CodingKeys: String, CodingKey {
        case success = "Success"
        case friends = "Friends"
        case error = "Error"
    }
}

// MARK: - Friend
public struct Friend_DTO: Codable {
    public var friend, raPoints, lastSeen, id: String?

    enum CodingKeys: String, CodingKey {
        case friend = "Friend"
        case raPoints = "RAPoints"
        case lastSeen = "LastSeen"
        case id = "ID"
    }
}
