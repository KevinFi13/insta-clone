//
//  HomePage.swift
//  insta-clone
//
//  Created by Kevin Ferrandiz Izquierdo on 2019-06-19.
//  Copyright © 2019 Kevin Ferrandiz Izquierdo. All rights reserved.
//

import UIKit

class HomePage: UIViewController {
    
    let emailTextField: UITextField = {
        
        let tf = UITextField();
        tf.placeholder = "Email";
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03);
        tf.borderStyle = .roundedRect;
        tf.font = UIFont.systemFont(ofSize: 14);
        tf.translatesAutoresizingMaskIntoConstraints = false;
        //listen for change in input
        tf.addTarget(self, action: #selector(handleTextInputChanged), for: .editingChanged);
        return tf;
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField();
        tf.placeholder = "Password";
        //hide characters as user enters password
        tf.isSecureTextEntry = true;
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03);
        tf.borderStyle = .roundedRect;
        tf.font = UIFont.systemFont(ofSize: 14);
        tf.translatesAutoresizingMaskIntoConstraints = false;
        //listen for change in input
        tf.addTarget(self, action: #selector(handleTextInputChanged), for: .editingChanged);
        return tf;
    }()
    
    let loginButton: UIButton = {
        
        let button = UIButton(type: .system);
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside);
        return button;
    }()
    
    let signUpButton: UIButton = {
        
        let button = UIButton(type: .system);
        button.setTitle("Sign Up", for: .normal);
        button.backgroundColor = UIColor(displayP3Red: 149, green: 204, blue: 244, alpha: 1);
        button.layer.cornerRadius = 5;
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14);
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside);
        
        return button;
    }()
    
    
    @objc func handleTextInputChanged(){
        let isFormValid = emailTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0;
        
        if isFormValid {
            //enable button and change color
            signUpButton.isEnabled = true;
            signUpButton.backgroundColor = UIColor.rgb(red: 17, green: 154, blue: 237);
        }else{
            //disable button and change color
            signUpButton.isEnabled = false;
            signUpButton.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244);
        }
    }
    
    
    //MARK: Button Functions
    @objc func handleLogin(){
        
        guard let email = emailTextField.text, email.count > 0 else {return};
        guard let password = passwordTextField.text, password.count > 0 else {return};
        
    }
    
    @objc func handleSignUp(){
        
        guard let email = emailTextField.text, email.count > 0 else {return};
        guard let password = passwordTextField.text, password.count > 0 else {return};
        
    }
    
    fileprivate func setUpViews(){
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, signUpButton]);
        
        
        
        //needed to show all arranged Subviews
        stackView.distribution = .fillEqually;
        
        stackView.axis = .vertical;
        
        stackView.spacing = 10;
        
        view.addSubview(stackView);
        
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true;
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true;
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true;
        stackView.heightAnchor.constraint(equalToConstant: 240);
        
        view.addSubview(stackView);
        
    }
    
    
}
