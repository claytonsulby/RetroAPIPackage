//
//  PHPHelper.swift
//  JSFun
//
//  Created by Clayton Sulby on 4/4/21.
//

import Foundation


public enum PHPHelper {
    
    ///Can be an integer, string, or boolean.
    public enum JSONPrimitiveType: Codable, Equatable {
        case integer(Int)
        case string(String)
        case bool(Bool)

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let x = try? container.decode(Int.self) {
                self = .integer(x)
                return
            }
            if let x = try? container.decode(String.self) {
                self = .string(x)
                return
            }
            if let x = try? container.decode(Bool.self) {
                self = .bool(x)
                return
            }
            throw DecodingError.typeMismatch(JSONPrimitiveType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for NumAchieved"))
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .integer(let x):
                try container.encode(x)
            case .string(let x):
                try container.encode(x)
            case .bool(let x):
                try container.encode(x)
            }
        }
        
        public var string:String? {
            switch self {
            case .integer(let x):
                return String(x)
            case .string(let x):
                return x
            case .bool(_):
                return nil
            }
        }
        
        public var int:Int? {
            switch self {
            case .integer(let x):
                return x
            case .string(let x):
                return Int(x) ?? 0
            case .bool(_):
                return nil
            }
        }
        
        public var bool:Bool? {
            switch self {
            case .integer(_):
                return nil
            case .string(let x):
                return Bool(x)
            case .bool(let x):
                return x
            }
        }
        
    }
    
    public enum AchievementMapper: Codable, Equatable  {
        
        case gameExtended([String: GameExtended_DTO.Achievement_DTO])
        case gameInfoAndUserProgress([String: GameExtended_DTO.Achievement_DTO])
        case userSummary([String:[String:UserSummary_DTO.Achievement_DTO]])
        case anythingArray([JSONAny])

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let x = try? container.decode([String: GameExtended_DTO.Achievement_DTO].self) {
                self = .gameExtended(x)
                return
            }
            if let x = try? container.decode([String: GameExtended_DTO.Achievement_DTO].self) {
                self = .gameInfoAndUserProgress(x)
                return
            }
            if let x = try? container.decode([String:[String:UserSummary_DTO.Achievement_DTO]].self) {
                self = .userSummary(x)
                return
            }
            if let x = try? container.decode([JSONAny].self) {
                self = .anythingArray(x)
                return
            }
            throw DecodingError.typeMismatch(GameExtended_DTO.Achievement_DTO.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Achievements"))
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .gameExtended(let x):
                try container.encode(x)
            case .gameInfoAndUserProgress(let x):
                try container.encode(x)
            case .userSummary(let x):
                try container.encode(x)
            case .anythingArray(let x):
                try container.encode(x)
            }
        }
        
        public static func == (lhs: PHPHelper.AchievementMapper, rhs: PHPHelper.AchievementMapper) -> Bool {
            return lhs.gameExtended == rhs.gameExtended ||
                lhs.userSummary == rhs.userSummary
        }
        
        public var gameExtended:[GameExtended_DTO.Achievement_DTO]? {
            
            switch self {
            case .gameExtended(let x):
                let achievements = x.map({ (key:String, achievement: GameExtended_DTO.Achievement_DTO) -> GameExtended_DTO.Achievement_DTO in
                    achievement
                })
                return achievements
            case .gameInfoAndUserProgress(let x):
                let achievements = x.map({ (key:String, achievement: GameExtended_DTO.Achievement_DTO) -> GameExtended_DTO.Achievement_DTO in
                    achievement
                })
                return achievements
            case .userSummary(_):
                return nil
            case .anythingArray(_):
                return []
            }

        }
        
        public var userSummary:[UserSummary_DTO.Achievement_DTO]? {

            switch self {
            case .gameExtended(_):
                return nil
            case .gameInfoAndUserProgress(_):
                return nil
            case .userSummary(let x):
                let achievements = x.map { (key:String, value: [String : UserSummary_DTO.Achievement_DTO]) in
                    value.map { (key: String, value: UserSummary_DTO.Achievement_DTO) in
                        value
                    }
                }.reduce([], +)
                return achievements
            case .anythingArray(_):
                return []
            }

        }
        
    }

}

public class JSONCodingKey: CodingKey {
    let key: String

    required public init?(intValue: Int) {
        return nil
    }

    required public init?(stringValue: String) {
        key = stringValue
    }

    public var intValue: Int? {
        return nil
    }

    public var stringValue: String {
        return key
    }
}

public class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}


public class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
