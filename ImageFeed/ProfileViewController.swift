//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Аркадий Червонный on 18.10.2025.
//
import UIKit

final class ProfileViewController: UIViewController {
    let nameLabel = UILabel()
    let usernameLabel = UILabel()
    let descriptionLabel = UILabel()
    let profileImage = UIImageView()
    let exitButton = UIButton.systemButton(
                with: UIImage(named: "Exit")!,
                target: self,
                action: #selector(Self.didTapExitButton)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfileImage()
        setupNameLabel()
        setupExitButton()
        setupUsernameLabel()
        setupDescriptionLabel()
        
    }
    
    @objc
    private func didTapExitButton(_ sender: Any) {
    }
    
    private func setupNameLabel() {
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Екатерина Новикова"
        nameLabel.font = .systemFont(ofSize: 23, weight: .bold)
        nameLabel.textColor = .white
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 8)
            ])
    }
    
    private func setupUsernameLabel() {
        view.addSubview(usernameLabel)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        usernameLabel.text = "@ekaterina_nov"
        usernameLabel.textColor = .gray
        usernameLabel.font = .systemFont(ofSize: 13)
        
        NSLayoutConstraint.activate([
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupDescriptionLabel() {
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.text = "Hello, world!"
        descriptionLabel.textColor = .white
        descriptionLabel.font = .systemFont(ofSize: 13)
        
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupProfileImage() {
        view.addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.image = UIImage(named: "profilePhoto")
        
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: 70),
            profileImage.heightAnchor.constraint(equalToConstant: 70),
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32)
        ])
    }
    
    private func setupExitButton() {
        view.addSubview(exitButton)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.tintColor = .red
        
        NSLayoutConstraint.activate([
        exitButton.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor),
        exitButton.widthAnchor.constraint(equalToConstant: 44),
        exitButton.heightAnchor.constraint(equalToConstant: 44),
        exitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
