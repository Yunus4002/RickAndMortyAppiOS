//
//  RMCharacterInfoCVCViewModel.swift
//  RickAndMorty
//
//  Created by Asadbek on 02/02/23.
//

import Foundation


final class RMCharacterInfoCVCViewModel {
    
    public let value: String
    public let title: String
    
    init(
        value: String,
        title: String
    ) {
        self.title = title
        self.value = value
    }
}
