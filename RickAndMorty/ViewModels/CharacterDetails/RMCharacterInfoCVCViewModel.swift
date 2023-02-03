//
//  RMCharacterInfoCVCViewModel.swift
//  RickAndMorty
//
//  Created by Asadbek on 02/02/23.
//

import Foundation
import UIKit

final class RMCharacterInfoCVCViewModel {
    
    private let type: `Type`
    public let value: String
    
    static let dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
        formatter.timeZone = .current
        return formatter
    }()
    static let shortdateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.timeZone = .current
        return formatter
    }()

    
    
    public var title: String {
        type.displayTitle
    }
    public var displayValue: String {
        
        if value.isEmpty { return "None"}
        
        if let date = Self.dateFormatter.date(from: value),
           type == .created {
            return Self.shortdateFormatter.string(from: date)
            
        }
          return value
    }
    
    public var iconImage: UIImage? {
        return type.iconImage
    }
    
    public var tintColor: UIColor {
        return type.tintColor
    }
    
    
    
    
    
    enum `Type`: String {
        case status
        case gender
        case type
        case species
        case origin
        case location
        case created
        case epsiodeCount
        
        
        var tintColor: UIColor {
            switch self {
            case .status:
                return .systemRed
            case .gender:
                return .systemBlue
            case .type:
                return .systemRed
            case .species:
                return .systemYellow
            case .origin:
                return .systemRed
            case .location:
                return .gray
            case .created:
                return .systemRed
            case .epsiodeCount:
                return .systemBlue
            }
            
        }
        
        
        var iconImage: UIImage? {
            switch self {
            case .status:
                return UIImage(systemName: "person")
            case .gender:
                return UIImage(systemName: "bell")
            case .type:
                return UIImage(systemName: "trash")
            case .species:
                return UIImage(systemName: "globe")
            case .origin:
                return UIImage(systemName: "globe")
            case .location:
                return UIImage(systemName: "globe")
            case .created:
                return UIImage(systemName: "globe")
            case .epsiodeCount:
                return UIImage(systemName: "globe")
                
            }
        }
        
        
        
        var displayTitle: String {
            switch self {
            case .status,
                 .gender,
                 .type,
                 .species,
                 .origin,
                 .location,
                 .created:
                return rawValue.uppercased()
            case .epsiodeCount:
                return "CHARACTER COUNT"
                
            }
        }
    }
    
    
    
    
    
    
    init(
        type: `Type`,
        value: String
        
    ) {
        self.value = value
        self.type = type
    }
}
