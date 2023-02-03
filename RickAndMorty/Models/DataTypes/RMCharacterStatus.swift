//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Asadbek on 29/12/22.
//

import Foundation


enum RMCharacterStatus: String, Codable {
    
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
    
    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
