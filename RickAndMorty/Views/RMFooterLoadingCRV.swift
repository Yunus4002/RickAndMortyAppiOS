//
//  RMFooterLoadingCRV.swift
//  RickAndMorty
//
//  Created by Asadbek on 10/01/23.
//

import UIKit

final class RMFooterLoadingCRV: UICollectionReusableView {
        
    static let idenfifier: String = "RMFooterLoadingCRV"
    
    static func nib() -> UINib {
        UINib(nibName: "RMFooterLoadingCRV", bundle: nil)
        
    }
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(spinner)
        addConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
        
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),

        ])
    }
    public func startAnimating() {
        spinner.startAnimating()
    }
    
}
