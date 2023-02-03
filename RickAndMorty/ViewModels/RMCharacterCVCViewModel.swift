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
        
        RMImageLoader.shared.downloadImage(url, completion: completion)
    }
    
    //MARK: -> Hashable 
    
    
    /// Hamma datani bir biriga tenglash
    /// - Parameters:
    ///   - lhs: <#lhs description#>
    ///   - rhs: <#rhs description#>
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
