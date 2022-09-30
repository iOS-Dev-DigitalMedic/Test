//
//  HomeViewController.swift
//  Test
//
//  Created by PNT001 on 2022/08/04.
//

import UIKit

class HomeViewController: UIViewController {
    lazy var helloLabel: UILabel = {
       let hl = UILabel()
        hl.text = "안녕하세요."
        hl.font = UIFont.boldSystemFont(ofSize: 35)
        hl.translatesAutoresizingMaskIntoConstraints = false
        hl.textAlignment = .center
        return hl
    }()
    
    lazy var introLabel: UILabel = {
       let il = UILabel()
        il.numberOfLines = 0
        il.text = "오늘 처음 검사를 시작하신다면,\n\"내 검사\"를 개설하기 위해\n먼저 검사유형을 선택해주세요"
        il.translatesAutoresizingMaskIntoConstraints = false
        il.textAlignment = .center
        return il
    }()
    
    lazy var defaultTestButton: UIButton = {
        let dtb = UIButton()
        dtb.translatesAutoresizingMaskIntoConstraints = false
        dtb.setTitle("기본 검사\n(4 문항)", for: .normal)
        dtb.layer.borderColor = UIColor.green.cgColor
        dtb.layer.cornerRadius = 5
        dtb.layer.borderWidth = 2
        dtb.titleLabel?.numberOfLines = 0
        dtb.setTitleColor(UIColor.green, for: .normal)
        dtb.titleLabel?.textAlignment = .center
        return dtb
    }()
    lazy var additionalTestButton: UIButton = {
        let atb = UIButton()
        atb.translatesAutoresizingMaskIntoConstraints = false
        atb.setTitle("기본 + 추가 검사\n(5~7 문항)", for: .normal)
        atb.layer.cornerRadius = 5
        atb.titleLabel?.numberOfLines = 0
        atb.backgroundColor = .green
        atb.setTitleColor(UIColor.white, for: .normal)
        atb.titleLabel?.textAlignment = .center
        return atb
    }()
    lazy var additionalInfoLabel: UILabel = {
        let ail = UILabel()
        ail.translatesAutoresizingMaskIntoConstraints = false
        ail.numberOfLines = 0
        ail.text = "기본 + 추가 검사는 개인 맞춤형 검사로 추가 증상을\n직접 선택 혹은 입력하여 문항을 구성하게 됩니다."
        ail.textAlignment = .center
        ail.textColor = .green
        ail.font = UIFont.boldSystemFont(ofSize: 12)
        return ail
    }()
    
    lazy var yesterdayLabel: UILabel = {
        let yl = UILabel()
        yl.text = "어제"
        yl.font = UIFont.boldSystemFont(ofSize: 35)
        yl.textColor = .black
        yl.translatesAutoresizingMaskIntoConstraints = false
        return yl
    }()
    lazy var howsyourdayLabel: UILabel = {
        let hl = UILabel()
        hl.text = "당신의 하루는\n어떠셨나요 ?"
        hl.font = UIFont.systemFont(ofSize: 35)
        hl.textColor = .black
        hl.translatesAutoresizingMaskIntoConstraints = false
        return hl
    }()
    lazy var profileButton: UIButton = {
        let pb = UIButton()
        pb.translatesAutoresizingMaskIntoConstraints = false
        return pb
    }()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        //Haven't got any test
        setUIs()
        
    }
    
    func setUIs() {
        self.view.addSubview(helloLabel)
        self.view.addSubview(introLabel)
        self.view.addSubview(defaultTestButton)
        self.view.addSubview(additionalTestButton)
        self.view.addSubview(additionalInfoLabel)
        
        defaultTestButton.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -40).isActive = true
        defaultTestButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        defaultTestButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        defaultTestButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        additionalTestButton.topAnchor.constraint(equalTo: defaultTestButton.bottomAnchor, constant: 20).isActive = true
        additionalTestButton.leadingAnchor.constraint(equalTo: defaultTestButton.leadingAnchor).isActive = true
        additionalTestButton.trailingAnchor.constraint(equalTo: defaultTestButton.trailingAnchor).isActive = true
        additionalTestButton.heightAnchor.constraint(equalTo: defaultTestButton.heightAnchor).isActive = true
        
        additionalInfoLabel.topAnchor.constraint(equalTo: additionalTestButton.bottomAnchor, constant: 5).isActive = true
        additionalInfoLabel.leadingAnchor.constraint(equalTo: additionalTestButton.leadingAnchor, constant: 20).isActive = true
        additionalInfoLabel.trailingAnchor.constraint(equalTo: additionalTestButton.trailingAnchor, constant: -20).isActive = true
        additionalInfoLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        introLabel.bottomAnchor.constraint(equalTo: defaultTestButton.topAnchor, constant: -50).isActive = true
        introLabel.leadingAnchor.constraint(equalTo: defaultTestButton.leadingAnchor, constant: 20).isActive = true
        introLabel.trailingAnchor.constraint(equalTo: defaultTestButton.trailingAnchor, constant: -20).isActive = true
        introLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        helloLabel.bottomAnchor.constraint(equalTo: introLabel.topAnchor, constant: -20).isActive = true
        helloLabel.leadingAnchor.constraint(equalTo: introLabel.leadingAnchor, constant: 20).isActive = true
        helloLabel.trailingAnchor.constraint(equalTo: introLabel.trailingAnchor, constant: -20).isActive = true
        helloLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        defaultTestButton.addTarget(self, action: #selector(gotoDefaultTestVC), for: .touchUpInside)
    }
    
    @objc func gotoDefaultTestVC() {
        self.navigationController?.pushViewController(DefaultTestViewController(), animated: true)
    }
    
    func setUIs2() {
        
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
