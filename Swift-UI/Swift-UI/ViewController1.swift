//
//  ViewController.swift
//  Swift-UI
//
//  Created by Ivan Kosenkov on 10.07.2023.
//

import UIKit
import WebKit

class ViewController1: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(webView)
        
        let url = URL(string: "https://oauth.vk.com/authorize?client_id=51700917&redirect_uri=http://oauth.vk.com/blank.html&scope=6&display=mobile&response_type=token")
        webView.load(URLRequest(url: url!))
        
//        setupViews2()
    }
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: view.frame)
        webView.navigationDelegate = self
        return webView
    }()
    
    private func setupViews2(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        contentView.addSubview(loginField)
        contentView.addSubview(passwordField)
//        contentView.addSubview(button)
        setupConstraints()
    }
    
    private func setupViews(){
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(loginField)
        view.addSubview(passwordField)
//        view.addSubview(button)
        setupConstraints()
    }
    
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    private lazy var contentView : UIView = {
        let contentView = UIView()
        contentView.frame.size = contentSize
        return contentView
    }()
    
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
    
//    private var button: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .black
//        button.setTitleColor(.white, for: .normal)
//        button.setTitle("Войти", for: .normal)
//        button.addTarget(nil, action: #selector(tap), for: .touchUpInside)
//        return button
//    }()
    
    
    
    func setupConstraints(){
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        loginField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
//        button.translatesAutoresizingMaskIntoConstraints = false
        
        
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
            
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
//            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
//            button.widthAnchor.constraint(equalToConstant: 150),
//            button.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    func tap() {
        navigationController?.pushViewController(ViewController2(), animated: true)
        
        let tabBarController = UITabBarController()
        let tabFriends = UINavigationController(rootViewController: ViewControllerFriends())
        let tabGroup = UINavigationController(rootViewController: ViewControllerGroups())
        let tabPhotos = UINavigationController(rootViewController: ViewControllerPhotos())
        
        tabFriends.tabBarItem.title = "Friends"
        tabGroup.tabBarItem.title = "Groups"
        tabPhotos.tabBarItem.title = "Photos"

        let controllers = [tabFriends, tabGroup,tabPhotos]
        tabBarController.viewControllers = controllers
                                               
        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let firstWindow = firstScene.windows.first
                else {
            return
        }
            firstWindow.rootViewController = tabBarController
    }
}

extension ViewController1: WKNavigationDelegate{
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0 .components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        NetworkService.token = params["access_token"]!
        NetworkService.userID = params["user_id"]!
        decisionHandler(.cancel)
        webView.removeFromSuperview()
        tap()
    }
}
