//
//  ViewController.swift
//  Swift-UI
//
//  Created by Ivan Kosenkov on 10.07.2023.
//

import UIKit

class ViewController1: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Контроллер 1"
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(newView)
        view.addSubview(loginField)
        view.addSubview(passwordField)
        view.addSubview(button)
//        navigationController?.pushViewController(NewViewController(), animated: true)
        setupConstraints()
    }
    
    private var imageView: UIImageView = {
        let imageView = UIImageView (image: UIImage(systemName: "person"))
        imageView.frame = CGRect()
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.text = "Авторизация пользователя"
        label.textAlignment = .center
        return label
    }()
    
    private var newView: UIView = {
        let newView = UIView()
        newView.backgroundColor = .cyan
        return newView
    }()
    
    private var loginField: UITextField = {
        let loginField = UITextField()
        loginField.placeholder = "Логин"
        loginField.borderStyle = .line
        return loginField
    }()
    
    private var passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Пароль"
        passwordField.borderStyle = .line
        return passwordField
    }()
    
    private var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Войти", for: .normal)
        button.addTarget(nil, action: #selector(tap), for: .touchUpInside)
        return button
    }()
    
    
    
    func setupConstraints(){
        label.translatesAutoresizingMaskIntoConstraints = false
        newView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        loginField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            label.widthAnchor.constraint(equalToConstant: 300),
            label.heightAnchor.constraint(equalToConstant: 50),
            
            loginField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            loginField.widthAnchor.constraint(equalToConstant: 300),
            loginField.heightAnchor.constraint(equalToConstant: 30),
            
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 5),
            passwordField.widthAnchor.constraint(equalToConstant: 300),
            passwordField.heightAnchor.constraint(equalToConstant: 30),
            
            //            newView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //            newView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            //            newView.widthAnchor.constraint(equalToConstant: 300),
            //            newView.heightAnchor.constraint(equalToConstant: 100),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    @objc func tap() {
        navigationController?.pushViewController(ViewController2(), animated: true)
    }
}

