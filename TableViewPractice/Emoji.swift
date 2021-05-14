//
//  Emoji.swift
//  TableViewPractice
//
//  Created by Евгений Березенцев on 14.05.2021.
//

import Foundation

struct Emoji: Codable {
    
    let label: String
    let name: String
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("myEmojis").appendingPathExtension("plist")
    
    static func save(with emojis: [Emoji]) {
        let encoder = PropertyListEncoder()
       let encodedData = try? encoder.encode(emojis)
        try? encodedData?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadEmojis() -> [Emoji]? {
        let decoder = PropertyListDecoder()
        guard let retrivedData = try? Data(contentsOf: archiveURL),let emojis = try? decoder.decode([Emoji].self, from: retrivedData) else { return nil }
        return emojis
    }
    
    static func loadSampleEmojis() -> [Emoji] {
        let emojis = [Emoji(label: "👻", name: "Ghost"),
                      Emoji(label: "😁", name: "Smile"),
                      Emoji(label: "🍎", name: "Apple")]
        return emojis
    }
}
