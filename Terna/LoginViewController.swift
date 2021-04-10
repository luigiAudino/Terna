//
//  LoginViewController.swift
//  Terna
//
//  Created by Luigi Audino on 09/04/21.
//

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_FilledTextAreasTheming
import MaterialComponents.MaterialTextControls_FilledTextFieldsTheming

class LoginViewController: UIViewController {
    private var emailTxtFld: MDCFilledTextField!
    private var passwordTxtFld: MDCFilledTextField!
    private var eyeBtn: UIButton!
    private var users = [User]()
    private let containerScheme = MDCContainerScheme()

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
        
        loadUser()
    }
    
    @IBAction func loginBtnPress(_ sender: Any) {

//        self.performSegue(withIdentifier: "GoToHome", sender: nil)
        
//        if(false && !isEmptyUser()) {
        if(!isEmptyUser()) {
            if(checkUser()) {
                print("OK")
                setStyle(textField: emailTxtFld)
                setStyle(textField: passwordTxtFld)
                
                Singleton.shared.setUser(user: User(email: emailTxtFld.text!, password: passwordTxtFld.text!))
                self.performSegue(withIdentifier: "GoToHome", sender: nil)

            }
            else {
                print("KO")
                setStyleError(textField: emailTxtFld, errorMessage: "Email non valida")
                setStyleError(textField: passwordTxtFld, errorMessage: "Email non valida")
            }
        }
    }
    
    @IBAction func continueBtnPress(_ sender: Any) {
    }
    
    func addEmailTxtFld() {
        emailTxtFld = MDCFilledTextField()
        emailTxtFld.delegate = self
        emailTxtFld.label.text = "Email"
      
        setStyle(textField: emailTxtFld)
        
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
        
        setStyle(textField: passwordTxtFld)
        
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
    
    private func setStyle(textField: MDCFilledTextField) {
        textField.applyTheme(withScheme: containerScheme)
        textField.leadingAssistiveLabel.text = ""
        textField.label.font = UIFont(name: "Lato-Regular", size: 15)
        textField.setFilledBackgroundColor(.white, for: .normal)
        textField.setFilledBackgroundColor(.white, for: .editing)
    }
    
    @objc func showPassword() {
        let imgNamed = passwordTxtFld.isSecureTextEntry ? "eye" : "eyeClosed"
        eyeBtn.setImage(UIImage(named: imgNamed), for: .normal)
        
        passwordTxtFld.isSecureTextEntry = !passwordTxtFld.isSecureTextEntry
    }
    
    func setStyleNavBar() {
        self.navigationController?.navigationBar.barTintColor = Color.firstBlue
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    func setStyleLoginBtn() {
        loginBtn.setTitle("Accedi", for: .normal)
        loginBtn.setTitleColor(.white, for: .normal)
        loginBtn.backgroundColor = Color.firstBlue
        loginBtn.layer.cornerRadius = 10
        loginBtn.layer.borderWidth = 1
        loginBtn.layer.borderColor = UIColor.black.cgColor
    }
    
    func setStyleContinueBtn() {
        continueBtn.setTitle("Continua come ospite", for: .normal)
        continueBtn.setTitleColor(Color.firstBlue, for: .normal)
        continueBtn.backgroundColor = .white
        continueBtn.layer.cornerRadius = 10
        continueBtn.layer.borderWidth = 3
        continueBtn.layer.borderColor = Color.firstBlue.cgColor
    }
    
    private func loadUser() {
        BusinessManager.readUsersMock { (users) in
            self.users = users
        }
    }
    
    //True -> Empty, False -> Not empty
    private func isEmptyUser() -> Bool{
        var isEmpty = false
        
        if(checkEmptyEmail()) {
            isEmpty = true
        }
        
        if(checkEmptyPassword()) {
            isEmpty = true
        }
        
        return isEmpty
    }
    
    private func checkEmptyEmail() -> Bool{
        var isEmpty = false
        
        if(emailTxtFld == nil || emailTxtFld.text?.isEmpty ?? true) {
            setStyleError(textField: emailTxtFld, errorMessage: "Campo obbligatorio")
            isEmpty = true
        }
        else {
            setStyle(textField: emailTxtFld)
        }
        
        return isEmpty
    }
    
    private func setStyleError(textField: MDCFilledTextField, errorMessage: String) {
        textField.applyErrorTheme(withScheme: containerScheme)
        textField.leadingAssistiveLabel.text = "Campo obbligatorio"
        textField.setFilledBackgroundColor(.white, for: .normal)
        textField.setFilledBackgroundColor(.white, for: .editing)
    }
    
    private func checkEmptyPassword() -> Bool{
        var isEmpty = false
        
        if(passwordTxtFld == nil || passwordTxtFld.text?.isEmpty ?? true) {
            setStyleError(textField: passwordTxtFld, errorMessage: "Campo obbligatorio")
            isEmpty = true
        }
        else {
            setStyle(textField: passwordTxtFld)
        }
        
        return isEmpty
    }
    
    private func checkUser() -> Bool {
        var foundIt = false
        
        for user in users {
            if(user.email.lowercased() == emailTxtFld.text?.lowercased() && user.password == passwordTxtFld.text) {
                foundIt = true
                break
            }
        }
        
        return foundIt
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
