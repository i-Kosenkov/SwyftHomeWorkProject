//
//  viewControllerFriends.swift
//  Swift-UI
//
//  Created by Ivan Kosenkov on 10.07.2023.
//

import UIKit

extension ViewControllerPhotos: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{3}

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        guard let cell = cell else {
            return UITableViewCell()
        }
        return cell
    }
}

class ViewControllerPhotos: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Photos"
            
        tableView.dataSource = self
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        setupConstraints()
    }

    private var tableView = UITableView(frame: .zero, style: .grouped)

    func setupConstraints(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
}
