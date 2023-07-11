//
//  CellFriends.swift
//  Swift-UI
//
//  Created by Ivan Kosenkov on 11.07.2023.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    private var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Hello world!"
        return label
    }()
    
    private var image: UIImageView = {
        let image = UIImageView (image: UIImage(systemName: "person"))
        image.frame = CGRect()
        return image
    }()
    
    private func setupView() {
        contentView.addSubview(label)
        contentView.addSubview(image)
        setupConstraints()
    }
    
    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor), label.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 10) ,image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor), image.widthAnchor.constraint(equalToConstant: 35), image.heightAnchor.constraint(equalToConstant: 35)])
    }
    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
