//
//  TitleUtil.swift
//  JSFun
//
//  Created by Clayton Sulby on 4/27/22.
//

import Foundation

fileprivate extension String {
    var titleFlairCharacterSet:CharacterSet {CharacterSet(charactersIn: "[]~-–— \n") }
    func strip() -> String {
        return self.trimmingCharacters(in: titleFlairCharacterSet)
    }
    func slice(from: String, last: String) -> String? {
        guard !from.isEmpty && !last.isEmpty else { return nil }
        if let i = self.firstIndex(of: from.first!),
           let j = self.lastIndex(of: last.last!) {
            return self.substring(with: i..<j)
        }
        return nil
    }
    func slice(fromLast: String, toLast: String) -> String? {
        guard !fromLast.isEmpty && !toLast.isEmpty else { return nil }
        if let i = self.lastIndex(of: fromLast.first!),
           let j = self.lastIndex(of: toLast.last!) {
            let k = self.index(after: j)
            return self.substring(with: i..<k)
        }
        return nil
    }
}

public class ParseUtil {

    public static func parse(title: String) -> String {
        var title = title
        title = title
            .replacingOccurrences(of: parse(flair: title) ?? "", with: "")
            .replacingOccurrences(of: parse(hub: title) ?? "", with: "")
            .replacingOccurrences(of: parse(subset: title) ?? "", with: "")
            .replacingOccurrences(of: parse(console: title) ?? "", with: "")
            .strip()
        return title
    }
    
    public static func parse(flair title: String) -> String? {
        guard title.contains("~") else { return nil }
        return title.slice(from: "~", last: "~")?.strip()
    }
    
    public static func parse(hub title: String) -> String? {
        guard title.starts(with: "[") else { return nil }
        return title.slice(from: "[", to: "-")?.strip()
    }
    
    public static func parse(subset title: String) -> String? {
        guard title.last == "]" else { return nil }
        return title.slice(from: "[", to: "]")?.strip()
    }
    
    public static func parse(publisher title: String?) -> String? {
        guard title != nil else { return nil }
        guard title!.starts(with: "Hack") else { return nil }
        return title!.deletingPrefix("Hack - ").strip()
    }
    
    public static func parse(console title: String) -> String? {
        guard title.last == ")" else { return nil }
        return title.slice(fromLast: "(", toLast: ")")?.strip()
    }
    
    public static func parse(image: String?) -> String? {
        guard let image = image else { return nil }
        guard image.suffix(3).elementsEqual("png") else { return nil }
        if image.contains("/Images/000001.png") || image.contains("/Images/000002.png") { return nil }
        return image
    }
    
    public static func parse(url: String?) -> URL? {
        guard let url = url else { return nil }
        guard url.suffix(3).elementsEqual("png") else { return nil }
        if url.contains("/Images/000001.png") || url.contains("/Images/000002.png") { return nil }
        return URL(string: url)
    }
    
}
