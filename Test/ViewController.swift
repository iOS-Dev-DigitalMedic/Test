//
//  ViewController.swift
//  Test
//
//  Created by PNT001 on 2022/08/02.
//

import UIKit

class ViewController: UIViewController {
    
    var logoImgView: UIImageView = {
        let liv = UIImageView()
        
        return liv
    }()
    var dobLabel: UILabel = {
        let dl = UILabel()
        dl.text = "생년월일"
        return dl
    }()
    var phoneLabel: UILabel = {
        let pl = UILabel()
        pl.text = "휴대폰번호"
        return pl
    }()
    var checkImgView: UIImageView = {
        let civ = UIImageView()

        return civ
    }()
    var checkImgLabel: UILabel = {
        let cil = UILabel()
        cil.text = "자동로그인"
        return cil
    }()
    var signInBtn: UIButton = {
        let sib = UIButton()
        sib.setTitle("로그인", for: .normal)
        sib.layer.cornerRadius = 25
        return sib
    }()
    var signUpBtn: UIButton = {
        let sub = UIButton()
        sub.setTitle("회원가입", for: .normal)
        sub.layer.borderWidth = 0
        return sub
    }()
    var dobTextField: UITextField = {
        let dtf = UITextField()
        dtf.placeholder = " 19750105"
        return dtf
    }()
    var phoneTextField: UITextField = {
       let ptf = UITextField()
        ptf.placeholder = " 01012345678"
        return ptf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        setElements()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let bottomLine1 = CALayer()
        let width = phoneTextField.frame.size.width
        let y = phoneTextField.frame.size.height

        bottomLine1.frame = CGRect(x: 0.0, y: y, width: width, height: 1.0)

        bottomLine1.backgroundColor = UIColor.lightGray.cgColor
        phoneTextField.borderStyle = UITextField.BorderStyle.none
        phoneTextField.layer.addSublayer(bottomLine1)
        
        let bottomLine2 = CALayer()

        bottomLine2.frame = CGRect(x: 0.0, y: y, width: width, height: 1.0)

        bottomLine2.backgroundColor = UIColor.lightGray.cgColor
        dobTextField.borderStyle = UITextField.BorderStyle.none
        dobTextField.layer.addSublayer(bottomLine2)
    }
    
    func setElements() {

        logoImgView.translatesAutoresizingMaskIntoConstraints = false
        dobLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        checkImgView.translatesAutoresizingMaskIntoConstraints = false
        checkImgLabel.translatesAutoresizingMaskIntoConstraints = false
        signInBtn.translatesAutoresizingMaskIntoConstraints = false
        signUpBtn.translatesAutoresizingMaskIntoConstraints = false
        dobTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(logoImgView)
        self.view.addSubview(dobLabel)
        self.view.addSubview(phoneLabel)
        self.view.addSubview(checkImgView)
        self.view.addSubview(checkImgLabel)
        self.view.addSubview(signInBtn)
        self.view.addSubview(signUpBtn)
        self.view.addSubview(dobTextField)
        self.view.addSubview(phoneTextField)
        
        phoneTextField.bottomAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        phoneTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        phoneTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        phoneTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        
        phoneLabel.leadingAnchor.constraint(equalTo: phoneTextField.leadingAnchor).isActive = true
        phoneLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        phoneLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        phoneLabel.bottomAnchor.constraint(equalTo: phoneTextField.topAnchor, constant: 0).isActive = true
        
        dobTextField.leadingAnchor.constraint(equalTo: phoneTextField.leadingAnchor).isActive = true
        dobTextField.trailingAnchor.constraint(equalTo: phoneTextField.trailingAnchor).isActive = true
        dobTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        dobTextField.bottomAnchor.constraint(equalTo: phoneLabel.topAnchor, constant: -10).isActive = true
        
        dobLabel.leadingAnchor.constraint(equalTo: dobTextField.leadingAnchor).isActive = true
        dobLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        dobLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        dobLabel.bottomAnchor.constraint(equalTo: dobTextField.topAnchor, constant: 0).isActive = true
        
        checkImgView.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 10).isActive = true
        checkImgView.leadingAnchor.constraint(equalTo: phoneTextField.leadingAnchor).isActive = true
        checkImgView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        checkImgView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        checkImgLabel.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 10).isActive = true
        checkImgLabel.leadingAnchor.constraint(equalTo: checkImgView.trailingAnchor, constant: 5).isActive = true
        checkImgLabel.heightAnchor.constraint(equalTo: checkImgView.heightAnchor).isActive = true
        checkImgLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        signInBtn.topAnchor.constraint(equalTo: checkImgView.bottomAnchor, constant: 30).isActive = true
        signInBtn.leadingAnchor.constraint(equalTo: phoneTextField.leadingAnchor).isActive = true
        signInBtn.trailingAnchor.constraint(equalTo: phoneTextField.trailingAnchor).isActive = true
        signInBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        signUpBtn.topAnchor.constraint(equalTo: signInBtn.bottomAnchor, constant: 30).isActive = true
        signUpBtn.leadingAnchor.constraint(equalTo: signInBtn.leadingAnchor, constant: 100).isActive = true
        signUpBtn.trailingAnchor.constraint(equalTo: signInBtn.trailingAnchor, constant: -100).isActive = true
        signUpBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        logoImgView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logoImgView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        logoImgView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        logoImgView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        signUpBtn.addTarget(self, action: #selector(gotoSignUpVC), for: .touchUpInside)
        

        
        
        
//        phoneTextField.backgroundColor = .red
//        phoneLabel.backgroundColor = .green
//        dobTextField.backgroundColor = .black
//        dobLabel.backgroundColor = .cyan
//
//
//        logoImgView.backgroundColor = .blue
        checkImgView.backgroundColor = .lightGray
//        checkImgLabel.backgroundColor = .darkGray
//
        signInBtn.backgroundColor = .purple
        signUpBtn.backgroundColor = .red
//
        logoImgView.backgroundColor = .magenta
        
    }
    

    @objc func gotoSignUpVC() {
        navigationController?.pushViewController(SignUpViewController(), animated: true)
//        navigationController?.pushViewController(BarGraphViewController(), animated: true)

    }
    


}

