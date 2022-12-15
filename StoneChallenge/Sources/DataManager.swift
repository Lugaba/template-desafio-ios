//
//  DataManager.swift
//  StoneChallenge
//
//  Created by Luca Hummel on 13/12/22.
//

import Foundation
import UIKit

class DataManager {
    static let shared = DataManager()
    
    var characters: [Character] = []
    var next: String? = "https://rickandmortyapi.com/api/character"
    public let imageCash = NSCache<NSNumber, UIImage>()
    
    private init() {}
    
    func getAllCharacters(_ completion: @escaping (() -> Void)) {
        var url: URL?
        let session: URLSession = URLSession.shared
        
        if let nextURL = self.next {
            url = URL(string: nextURL)!
        } else {
            if self.next == nil {
                print("No more Characters")
                return
            }
        }
        
        guard let url = url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            if error != nil {
                print(String(describing: error?.localizedDescription))
            }
            
            do {
                let apiResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
                self.characters += apiResponse.results
                self.next = apiResponse.info.next
                
                for character in self.characters {
                    self.loadImage(character: character)
                }
                
                DispatchQueue.main.async {
                    completion()
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    public func loadImage(character: Character) {
        guard let url: URL = URL(string: character.image) else {return}
        
        DispatchQueue.global(qos: .utility).async {
            guard let data = try? Data(contentsOf: url) else {return}
            guard let image = UIImage(data: data) else {return}
            self.imageCash.setObject(image, forKey: NSNumber(value: character.id))
        }
        
    }
}
