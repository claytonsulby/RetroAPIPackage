//
//  PHPHelper.swift
//  JSFun
//
//  Created by Clayton Sulby on 4/4/21.
//

import Foundation


public enum PHPHelper {
    
    public enum PHPInt: Codable, Equatable {
        case integer(Int)
        case string(String)
        
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
            throw DecodingError.typeMismatch(PHPInt.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for PHPInt"))
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .integer(let x):
                try container.encode(x)
            case .string(let x):
                try container.encode(x)
            }
        }
        
        public var decoded:Int? {
            switch self {
            case .integer(let x):
                return x
            case .string(let x):
                return Int(x)
            }
        }
        
        public static func == (lhs: PHPHelper.PHPInt, rhs: PHPHelper.PHPInt) -> Bool {
            return lhs.decoded == rhs.decoded
        }
        
    }
    
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
            throw DecodingError.typeMismatch(JSONPrimitiveType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONPrimitiveType"))
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
                return Int(x)
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

public class JSONAny: Codable, Equatable {
    
    public enum Value: Codable, Equatable {
        case bool(Bool)
        case int64(Int64)
        case double(Double)
        case string(String)
        case null
        
        public init(from decoder: Decoder) throws {
            if let boolValue = try? decoder.singleValueContainer().decode(Bool.self) {
                self = .bool(boolValue)
            } else if let intValue = try? decoder.singleValueContainer().decode(Int64.self) {
                self = .int64(intValue)
            } else if let doubleValue = try? decoder.singleValueContainer().decode(Double.self) {
                self = .double(doubleValue)
            } else if let stringValue = try? decoder.singleValueContainer().decode(String.self) {
                self = .string(stringValue)
            } else if try decoder.singleValueContainer().decodeNil() {
                self = .null
            } else {
                throw DecodingError.typeMismatch(Value.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Unsupported type"))
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .bool(let boolValue):
                try container.encode(boolValue)
            case .int64(let intValue):
                try container.encode(intValue)
            case .double(let doubleValue):
                try container.encode(doubleValue)
            case .string(let stringValue):
                try container.encode(stringValue)
            case .null:
                try container.encodeNil()
            }
        }
    }
    
    public static func == (lhs: JSONAny, rhs: JSONAny) -> Bool {
        return lhs.value == rhs.value
    }
    
    let value: Value
    
    public init(value: Value) {
        self.value = value
    }
    
    public required init(from decoder: Decoder) throws {
        self.value = try Value(from: decoder)
    }
    
    public func encode(to encoder: Encoder) throws {
        try value.encode(to: encoder)
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
