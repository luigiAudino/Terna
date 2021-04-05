//
//  LoginViewController.swift
//  Terna
//
//  Created by Luigi Audino on 04/04/21.
//

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields

class LoginViewController: UIViewController {
    private var emailTxtFld: MDCFilledTextField!
    private var passwordTxtFld: MDCFilledTextField!
    private var firstBlue = UIColor(red: 0.18, green: 0.37, blue: 0.72, alpha: 1.00)
    private var eyeBtn: UIButton!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var continueBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyleNavBar()
        
        addEmailTxtFld()
        addPasswordTxtFld()

        setStyleLoginBtn()
        setStyleContinueBtn()
    }
    
    @IBAction func loginBtnPress(_ sender: Any) {
    }
    
    @IBAction func continueBtnPress(_ sender: Any) {
    }
    
    func addEmailTxtFld() {
        emailTxtFld = MDCFilledTextField()
        emailTxtFld.delegate = self
        emailTxtFld.label.text = "Email"
        emailTxtFld.label.font = UIFont(name: "Helvetica", size: 7)
        emailTxtFld.setFilledBackgroundColor(.white, for: .normal)
        emailTxtFld.setFilledBackgroundColor(.white, for: .editing)
        emailTxtFld.sizeToFit()
        view.addSubview(emailTxtFld)
        
        emailTxtFld.translatesAutoresizingMaskIntoConstraints = false
        
        emailTxtFld.topAnchor.constraint(equalTo: logoImg.bottomAnchor,constant: 30).isActive = true
        emailTxtFld.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60).isActive = true
        emailTxtFld.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60).isActive = true
    }
    
    func addPasswordTxtFld() {
        passwordTxtFld = MDCFilledTextField()
        passwordTxtFld.delegate = self
        passwordTxtFld.isSecureTextEntry = true
        passwordTxtFld.label.text = "Password"
        passwordTxtFld.setFilledBackgroundColor(.white, for: .normal)
        passwordTxtFld.setFilledBackgroundColor(.white, for: .editing)
        passwordTxtFld.sizeToFit()
        view.addSubview(passwordTxtFld)
        
        passwordTxtFld.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTxtFld.topAnchor.constraint(equalTo: emailTxtFld.bottomAnchor, constant: 15).isActive = true
        passwordTxtFld.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60).isActive = true
        passwordTxtFld.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60).isActive = true
        
        eyeBtn = UIButton(type: .custom)
        eyeBtn.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        eyeBtn.frame = CGRect(x: 20, y: 20, width: 20, height: 20)
        eyeBtn.setImage(UIImage(named: "eyeClosed"), for: .normal)
        
        passwordTxtFld.trailingView = eyeBtn
        passwordTxtFld.trailingViewMode = .always
    }
    
    @objc func showPassword() {
        let imgNamed = passwordTxtFld.isSecureTextEntry ? "eye" : "eyeClosed"
        eyeBtn.setImage(UIImage(named: imgNamed), for: .normal)
        
        passwordTxtFld.isSecureTextEntry = !passwordTxtFld.isSecureTextEntry
    }
    
    func setStyleNavBar() {
        self.navigationController?.navigationBar.barTintColor = firstBlue
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    func setStyleLoginBtn() {
        loginBtn.setTitle("Accedi", for: .normal)
        loginBtn.setTitleColor(.white, for: .normal)
        loginBtn.backgroundColor = firstBlue
        loginBtn.layer.cornerRadius = 10
        loginBtn.layer.borderWidth = 1
        loginBtn.layer.borderColor = UIColor.black.cgColor
    }
    
    func setStyleContinueBtn() {
        continueBtn.setTitle("Continua come ospite", for: .normal)
        continueBtn.setTitleColor(firstBlue, for: .normal)
        continueBtn.backgroundColor = .white
        continueBtn.layer.cornerRadius = 10
        continueBtn.layer.borderWidth = 3
        continueBtn.layer.borderColor = firstBlue.cgColor
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
