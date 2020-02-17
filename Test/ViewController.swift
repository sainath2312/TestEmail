//
//  ViewController.swift
//  Test
//
//  Created by Sainath Gajavada on 17/02/20.
//  Copyright © 2020 Sainath Gajavada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var loginService: LoginService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginService = LoginServiceDelegate(delegate: self)
        // Do any additional setup after loading the view.
    }

    @IBAction func onSubmitBtnClick(_ sender: UIButton) {
        
        loginService.login(withUsername: userName.text, password: password.text)
    }
    
}

extension ViewController: LoginActionService {
    func loginSuccessfull(withUser user: User) {
        showAlert(withTitle: "Success", message: "Hello \(user.name)")
    }
    
    func handle(error: Error) {
        showAlert(withTitle: "Error", message: error.localizedDescription)
    }
}

