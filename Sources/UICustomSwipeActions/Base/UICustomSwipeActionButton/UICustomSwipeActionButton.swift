//
//  UICustomSwipeActionButton.swift
//  
//
//  Created by Seb Vidal on 18/11/2023.
//

import UIKit

class UICustomSwipeActionButton: UIView {
    // MARK: - Private Properties
    private var backgroundView: UIView!
    private var imageView: UIImageView!
    
    // MARK: - Public Properties
    override var alpha: CGFloat {
        get {
            return backgroundView.alpha
        } set {
            backgroundView.alpha = newValue
        }
    }
    
    override var backgroundColor: UIColor? {
        get {
            return backgroundView.backgroundColor
        } set {
            backgroundView.backgroundColor = newValue
        }
    }
    
    var image: UIImage? = nil {
        didSet {
            imageView.image = image?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 24))
        }
    }
    
    // MARK: - init(frame:)
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.backgroundColor = .systemBackground
        setupBackgroundView()
        setupImageView()
    }
    
    // MARK: - init?(coder:)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupBackgroundView() {
        backgroundView = UIView()
        backgroundView.backgroundColor = .systemRed
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupImageView() {
        imageView = UIImageView()
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    // MARK: - layoutSubviews()
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerCurve = .circular
        layer.cornerRadius = frame.width / 2
        backgroundView.layer.cornerCurve = .circular
        backgroundView.layer.cornerRadius = frame.width / 2
    }
}
