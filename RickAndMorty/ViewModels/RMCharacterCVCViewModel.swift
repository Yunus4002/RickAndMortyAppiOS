//
//  RMCharacterCVCViewModel.swift
//  RickAndMorty
//
//  Created by Asadbek on 07/01/23.
//

import Foundation

final class  RMCharacterCVCViewModel: Hashable , Equatable{
    
    public let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageUrl: URL?
    
    

    
    //MARK: -> Init
    
    init(
        characterName: String,
        characterStatus: RMCharacterStatus,
        characterImageUrl: URL?
        
        
    ) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
        
    }
    
    public var characterStatusText: String {
        return "Status: \(characterStatus.text)"
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = characterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
            
        }
        task.resume()
    }
    
    //MARK: -> Hashable 
    
    
    /// Hamma datani bir biriga tenglash
    /// - Parameters:
    ///   - lhs: shu
    ///   - rhs: shunga teng boladi
    /// - Returns: <#description#>
    static func == (lhs: RMCharacterCVCViewModel, rhs: RMCharacterCVCViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(characterName)
        hasher.combine(characterStatus)
        hasher.combine(characterImageUrl)
    }
    
    
    
}
