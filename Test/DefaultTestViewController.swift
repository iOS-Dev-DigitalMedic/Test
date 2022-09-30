//
//  DefaultTestViewController.swift
//  Test
//
//  Created by PNT001 on 2022/08/04.
//

import UIKit

class DefaultTestViewController: UIViewController {
    
    
    let defaultTestTextLabel: UILabel = {
        let dttl = UILabel()
        dttl.text = "기본 검사"
        dttl.textColor = .white
        dttl.layer.cornerRadius = 20
        dttl.layer.borderWidth = 1
        dttl.layer.borderColor = UIColor.clear.cgColor
        dttl.backgroundColor = .lightGray
        dttl.textAlignment = .center
        dttl.translatesAutoresizingMaskIntoConstraints = false
        return dttl
    }()
    
    let startTestTextLabel: UILabel = {
        let sttl = UILabel()
        sttl.text = "검사시작"
        sttl.font = UIFont.boldSystemFont(ofSize: 30)
        sttl.textColor = .black
        sttl.textAlignment = .center
        sttl.translatesAutoresizingMaskIntoConstraints = false
        return sttl
    }()
    
    let pushTheButtonTextLabel: UILabel = {
        let pbt = UILabel()
        pbt.text = "버튼을 눌러주세요."
        pbt.font = UIFont.systemFont(ofSize: 30)
        pbt.textAlignment = .center
        pbt.textColor = .black
        pbt.translatesAutoresizingMaskIntoConstraints = false
        return pbt
    }()
    
    let startTestButton: UIButton = {
        let stb = UIButton()
        stb.translatesAutoresizingMaskIntoConstraints = false
        stb.setTitle("검사시작", for: .normal)
        stb.layer.cornerRadius = 5
        stb.layer.borderColor = UIColor.black.cgColor
        stb.layer.borderWidth = 1
        stb.setTitleColor(UIColor.black, for: .normal)
        stb.setTitleShadowColor(UIColor.black, for: .normal)
        return stb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        setUIs()
        
    }
    
    func setUIs() {
        self.view.addSubview(defaultTestTextLabel)
        defaultTestTextLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        defaultTestTextLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        defaultTestTextLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        defaultTestTextLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.view.addSubview(startTestTextLabel)
        startTestTextLabel.topAnchor.constraint(equalTo: defaultTestTextLabel.bottomAnchor, constant: 50).isActive = true
        startTestTextLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        startTestTextLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        startTestTextLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.view.addSubview(pushTheButtonTextLabel)
        pushTheButtonTextLabel.topAnchor.constraint(equalTo: startTestTextLabel.bottomAnchor, constant: 10).isActive = true
        pushTheButtonTextLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pushTheButtonTextLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        pushTheButtonTextLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.view.addSubview(startTestButton)
        startTestButton.topAnchor.constraint(equalTo: pushTheButtonTextLabel.bottomAnchor, constant: 50).isActive = true
        startTestButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        startTestButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        startTestButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
