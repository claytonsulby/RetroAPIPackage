// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(GameList_DTO.self, from: jsonData)

import Foundation

// MARK: - GameListElement_DTO
public struct GameListElement_DTO: Codable {
    
    private var gameID_DTO, consoleID_DTO: PHPHelper.PHPInt?
    private var title_DTO, imageIcon_DTO, consoleName_DTO: String?

    enum CodingKeys: String, CodingKey {
        case title_DTO = "Title"
        case gameID_DTO = "ID"
        case consoleID_DTO = "ConsoleID"
        case imageIcon_DTO = "ImageIcon"
        case consoleName_DTO = "ConsoleName"
    }
}

public typealias GameList_DTO = [GameListElement_DTO]

extension GameListElement_DTO : Game, GameIcon, Console {
    public var gameID: Int? {
        self.gameID_DTO?.value ?? -1
    }
    
    public var title: String {
        self.title_DTO ?? ""
    }
    
    public var imageIconURL: URL? {
        
        if let imageIconURL = self.imageIcon_DTO {
            return URL(string: RetroAPI.baseImageURL + imageIconURL)
        } else {
            return nil
        }
    }
    
    public var consoleID: Int? {
        self.consoleID_DTO?.value ?? -1
    }
    
    public var consoleName: String {
        self.consoleName_DTO ?? ""
    }
    
    
}
