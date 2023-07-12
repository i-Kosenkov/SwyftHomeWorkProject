//
//  CellPhotos.swift
//  Swift-UI
//
//  Created by Ivan Kosenkov on 11.07.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private var image1: UIImageView = {
        let image = UIImageView (image: UIImage(systemName: "heart"))
        image.frame = CGRect()
        return image
    }()
    
    private var image2: UIImageView = {
        let image = UIImageView (image: UIImage(systemName: "heart.fill"))
        image.frame = CGRect()
        return image
    }()
    
    private func setupView() {
        contentView.addSubview(image1)
        contentView.addSubview(image2)
        setupConstraints()
    }
    
    private func setupConstraints() {
        image1.translatesAutoresizingMaskIntoConstraints = false
        image2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            image1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            image1.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -10),
            image1.heightAnchor.constraint(equalTo: image1.widthAnchor),
            image1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            image1.centerYAnchor.constraint(equalTo: centerYAnchor),
//            image1.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            image1.widthAnchor.constraint(equalToConstant: 100),
            image1.heightAnchor.constraint(equalToConstant: 100),
                                     
//            image2.centerYAnchor.constraint(equalTo: centerYAnchor),
//            image2.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
//            image2.widthAnchor.constraint(equalToConstant: 100),
//            image2.heightAnchor.constraint(equalToConstant: 100),
            
            image2.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 10),
            image2.widthAnchor.constraint(equalTo: image1.widthAnchor),
            image2.heightAnchor.constraint(equalTo: image1.heightAnchor),
            image2.topAnchor.constraint(equalTo: image1.topAnchor)
        ])
    }
    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

