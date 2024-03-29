//
//  ViewController.swift
//  insta-clone
//
//  Created by Kevin Ferrandiz Izquierdo on 2019-06-18.
//  Copyright © 2019 Kevin Ferrandiz Izquierdo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let emailTextField: UITextField = {
        
        let tf = UITextField();
        tf.translatesAutoresizingMaskIntoConstraints = false;
        tf.placeholder = "Email";
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03);
        tf.borderStyle = .roundedRect;
        tf.font = UIFont.systemFont(ofSize: 14);
        //listen for change in input
        tf.addTarget(self, action: #selector(handleTextInputChanged), for: .editingChanged);
        return tf;
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField();
        tf.translatesAutoresizingMaskIntoConstraints = false;
        tf.placeholder = "Password";
        //hide characters as user enters password
        tf.isSecureTextEntry = true;
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03);
        tf.borderStyle = .roundedRect;
        tf.font = UIFont.systemFont(ofSize: 14);
        //listen for change in input
        tf.addTarget(self, action: #selector(handleTextInputChanged), for: .editingChanged);
        return tf;
    }()
    
    let loginButton: UIButton = {
        
        let button = UIButton(type: .system);
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.setTitle("Login", for: .normal);
        button.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244);
        button.layer.cornerRadius = 5;
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14);
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside);
        button.isEnabled = false;
        return button;
    }()
    
    let signUpButton: UIButton = {
        
        let button = UIButton(type: .system);
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.setTitle("Sign Up", for: .normal);
        button.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244);
        button.layer.cornerRadius = 5;
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14);
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside);
        button.isEnabled = false;
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews();
        // Do any additional setup after loading the view.
    }
    
    fileprivate func setUpViews(){
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, signUpButton]);

        //needed to show all arranged Subviews
        stackView.distribution = .fillEqually;
        
        stackView.axis = .vertical;
        
        stackView.spacing = 15;
        
        view.addSubview(stackView);
        
      stackView.anchor(top: view.topAnchor, paddingTop: 200, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 40, right: view.rightAnchor, paddingRight: -40, width: 0, height: 200);
    }
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, paddingTop: CGFloat, bottom: NSLayoutYAxisAnchor?, paddingBottom: CGFloat, left: NSLayoutXAxisAnchor?, paddingLeft: CGFloat, right: NSLayoutXAxisAnchor?, paddingRight: CGFloat, width: CGFloat, height: CGFloat){
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true;
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true;
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true;
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true;
        }
        
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true;
        }
        
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true;
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false;
        
        //Putting the constraints inside NSLayoutConstraint.activate([]) is the same as writing the .isActive = true
        //at the end of each constraint
        //        NSLayoutConstraint.activate([
        //            //constraints
        //            stackView.heightAnchor.constraint(equalToConstant: 200)
        //            ])
    }
}

