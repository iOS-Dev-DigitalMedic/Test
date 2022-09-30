//
//  SignUpViewController.swift
//  Test
//
//  Created by PNT001 on 2022/08/02.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var isUserTypeButtonClicked = false
    
    let userTypeData = ["연구참가자용","( 외래 / 병동 ) 환자용","그 외 사용자용"]

    let userTypeTableView: UITableView = {
        let uttv = UITableView()
        uttv.translatesAutoresizingMaskIntoConstraints = false
        uttv.layer.borderWidth = 2
        return uttv
    }()
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .white
        return sv
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    //Labels
    var dobLabel: UILabel = {
        let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.text = "생년월일"
        dl.font = UIFont.boldSystemFont(ofSize: 18)
        return dl
    }()
    
    var genderLabel: UILabel = {
        let gl = UILabel()
        gl.translatesAutoresizingMaskIntoConstraints = false
        gl.text = "성별"
        gl.font = UIFont.boldSystemFont(ofSize: 18)
        return gl
    }()
    
    var phoneLabel: UILabel = {
        let pl = UILabel()
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = "핸드폰번호"
        pl.font = UIFont.boldSystemFont(ofSize: 18)
        return pl
    }()
    
    var belongingLabel: UILabel = {
        let bl = UILabel()
        bl.translatesAutoresizingMaskIntoConstraints = false
        bl.text = "소속기관 및 사용자 유형 선택"
        bl.font = UIFont.boldSystemFont(ofSize: 18)
        return bl
    }()
    
    var clauseLabel: UILabel = {
        let cl = UILabel()
        cl.translatesAutoresizingMaskIntoConstraints = false
        cl.text = "약관 동의"
        return cl
    }()
    
    var allAgreementLabel: UILabel = {
        let al = UILabel()
        al.translatesAutoresizingMaskIntoConstraints = false
        al.text = "전체 동의"
        return al
    }()
    
    var serviceClauseLabel: UILabel = {
        let scl = UILabel()
        scl.translatesAutoresizingMaskIntoConstraints = false
        scl.textColor = .lightGray
        scl.text = "서비스 이용약관 동의"
        return scl
    }()
    
    var privacyClauseLabel: UILabel = {
        let pcl = UILabel()
        pcl.translatesAutoresizingMaskIntoConstraints = false
        pcl.textColor = .lightGray
        pcl.text = "개인정보처리방침 동의"
        return pcl
    }()
    
    var ageOver19Label: UILabel = {
        let aol = UILabel()
        aol.translatesAutoresizingMaskIntoConstraints = false
        aol.textColor = .lightGray
        aol.text = "만 19세 이상 확인"
        return aol
    }()
    
    var informForPhoneLabel: UILabel = {
       let ipl = UILabel()
        ipl.translatesAutoresizingMaskIntoConstraints = false
        ipl.textColor = .red
        ipl.font = ipl.font.withSize(14)
        ipl.text = "- 없이 숫자만 입력해주세요."
        return ipl
    }()
    
    var detailForBelongingLabel: UILabel = {
        let dbl = UILabel()
        dbl.translatesAutoresizingMaskIntoConstraints = false
        dbl.textColor = .lightGray
        dbl.font = dbl.font.withSize(14)
        dbl.text = "일반 사용자는 소속기관 미지정으로 선택하세요"
        return dbl
    }()
    
    // Buttons
    var manRadioBoxButton: UIButton = {
        let mrb = UIButton()
        mrb.translatesAutoresizingMaskIntoConstraints = false
        mrb.setTitle("남", for: .normal)
        mrb.setTitleColor(UIColor.lightGray, for: .normal)
        return mrb
    }()
    
    var womanRadioBoxButton: UIButton = {
        let wrb = UIButton()
        wrb.translatesAutoresizingMaskIntoConstraints = false
        wrb.setTitle("여", for: .normal)
        wrb.setTitleColor(UIColor.lightGray, for: .normal)
        return wrb
    }()
    
    var signUpConfirmButton: UIButton = {
        let scb = UIButton()
        scb.translatesAutoresizingMaskIntoConstraints = false
        scb.setTitle("가입하기", for: .normal)
        scb.backgroundColor = UIColor( red: CGFloat(50/255.0), green: CGFloat(168/255.0), blue: CGFloat(82/255.0), alpha: CGFloat(1.0) )
        scb.layer.cornerRadius = 5
        return scb
    }()
    
    var selfAuthButton: UIButton = {
        let sab = UIButton()
        sab.translatesAutoresizingMaskIntoConstraints = false
        sab.setTitle("본인인증", for: .normal)
        sab.setTitleColor(UIColor.orange, for: .normal)
        sab.layer.borderColor = UIColor.orange.cgColor
        sab.layer.borderWidth = 2
        sab.layer.cornerRadius = 5
        return sab
    }()
    
    var selectHospitalButton: UIButton = {
       let shb = UIButton()
        shb.translatesAutoresizingMaskIntoConstraints = false
        shb.setTitle("소속기관 선택", for: .normal)
        shb.setTitleColor(UIColor.black, for: .normal)
        shb.contentHorizontalAlignment = .left
        shb.titleEdgeInsets = UIEdgeInsets.init(top: 10, left: 20, bottom: 10, right: 10)
        shb.layer.borderColor = UIColor.lightGray.cgColor
        shb.layer.borderWidth = 2
        shb.layer.cornerRadius = 10
        return shb
    }()
    
    var userTypeButton: UIButton = {
        let utb = UIButton()
        utb.translatesAutoresizingMaskIntoConstraints = false
        utb.setTitle("사용자 유형 선택", for: .normal)
        utb.setTitleColor(UIColor.lightGray, for: .normal)
        utb.contentHorizontalAlignment = .left
        utb.titleEdgeInsets = UIEdgeInsets.init(top: 10, left: 20, bottom: 10, right: 10)
        utb.layer.borderColor = UIColor.lightGray.cgColor
        utb.layer.borderWidth = 2
        utb.layer.cornerRadius = 10
        return utb
    }()
    
    var askAgreementButton: UIButton = {
        let aab = UIButton()
        aab.translatesAutoresizingMaskIntoConstraints = false
        aab.setTitle("귀하의 소중한 데이터를 연구개발 및 서비스 향상을 위한 목적으로 사용하는데 동의하십니까?", for: .normal)
        aab.setTitleColor(UIColor.black, for: .normal)
        aab.titleLabel?.numberOfLines = 0
        aab.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        return aab
    }()
    
    var allAgreementButton: UIButton = {
        let aab = UIButton()
        aab.translatesAutoresizingMaskIntoConstraints = false
        aab.layer.borderWidth = 3
        aab.layer.borderColor = UIColor.lightGray.cgColor
        return aab
    }()
    
    var serviceClauseButton: UIButton = {
        let scb = UIButton()
        scb.translatesAutoresizingMaskIntoConstraints = false
        scb.layer.borderWidth = 3
        scb.layer.borderColor = UIColor.lightGray.cgColor
        return scb
    }()
    
    var privacyClauseButton: UIButton = {
        let pcb = UIButton()
        pcb.translatesAutoresizingMaskIntoConstraints = false
        pcb.layer.borderWidth = 3
        pcb.layer.borderColor = UIColor.lightGray.cgColor
        return pcb
    }()
    
    var ageOver19Button: UIButton = {
        let aob = UIButton()
        aob.translatesAutoresizingMaskIntoConstraints = false
        aob.layer.borderWidth = 3
        aob.layer.borderColor = UIColor.lightGray.cgColor
        return aob
    }()
    // TextField
    var dobTextField: UITextField = {
        let dtf = UITextField()
        dtf.translatesAutoresizingMaskIntoConstraints = false
        dtf.placeholder = "19740127"
        dtf.keyboardType = .numberPad
        return dtf
    }()
    
    var phoneTextField: UITextField = {
        let ptf = UITextField()
        ptf.translatesAutoresizingMaskIntoConstraints = false
        ptf.placeholder = "핸드폰번호를 입력해주세요"
        ptf.keyboardType = .numberPad
        return ptf
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
 
        self.view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = .lightGray

        setScrollView()
        addItemsOnTheView()
        setAutoLayOutsFortheDobAndGenderSection()
        setAutoLayOutsForthePhoneSection()
        setBelongingsAndTypeSection()
        setAgreementSection()
        setAutoLayOutsForConfirmButton()
        
        addTargetToButton()
        
        
        self.view.addSubview(userTypeTableView)
        userTypeTableView.dataSource = self
        userTypeTableView.delegate = self
        userTypeTableView.topAnchor.constraint(equalTo: userTypeButton.bottomAnchor).isActive = true
        userTypeTableView.leadingAnchor.constraint(equalTo: userTypeButton.leadingAnchor).isActive = true
        userTypeTableView.trailingAnchor.constraint(equalTo: userTypeButton.trailingAnchor).isActive = true
        userTypeTableView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        userTypeTableView.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        let dobLineLayer = CALayer()
        dobLineLayer.frame = CGRect(x: dobTextField.frame.origin.x, y: dobTextField.frame.origin.y + dobTextField.frame.size.height, width: dobTextField.frame.size.width, height: 1)
        dobLineLayer.backgroundColor = UIColor.lightGray.cgColor
        contentView.layer.addSublayer(dobLineLayer)
        
        let phoneLineLayer = CALayer()
        phoneLineLayer.frame = CGRect(x: phoneTextField.frame.origin.x, y: phoneTextField.frame.origin.y + allAgreementButton.frame.size.height, width: phoneTextField.frame.size.width, height: 1)
        phoneLineLayer.backgroundColor = UIColor.lightGray.cgColor
        contentView.layer.addSublayer(phoneLineLayer)
        
        let horizontalLineLayer = CALayer()
        horizontalLineLayer.frame = CGRect(x: 40, y: allAgreementButton.frame.origin.y + allAgreementButton.frame.size.height + 10, width: self.view.frame.size.width - 80, height: 1)
        horizontalLineLayer.backgroundColor = UIColor.lightGray.cgColor
        contentView.layer.addSublayer(horizontalLineLayer)
    }
    
    func setScrollView() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor)
        ])
        
        contentView.heightAnchor.constraint(equalToConstant: 900).isActive = true
        
        let contentViewCenterY = contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        contentViewCenterY.priority = .defaultLow

        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow

        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentViewCenterY,
            contentViewHeight
        ])
        
    }

    func addItemsOnTheView() {
        
        //labels
        contentView.addSubview(dobLabel)
        contentView.addSubview(phoneLabel)
        contentView.addSubview(clauseLabel)
        contentView.addSubview(genderLabel)
        contentView.addSubview(belongingLabel)
        contentView.addSubview(ageOver19Label)
        contentView.addSubview(allAgreementLabel)
        contentView.addSubview(privacyClauseLabel)
        contentView.addSubview(serviceClauseLabel)
        contentView.addSubview(informForPhoneLabel)
        contentView.addSubview(detailForBelongingLabel)
        contentView.addSubview(signUpConfirmButton)
        
        //buttons
        contentView.addSubview(manRadioBoxButton)
        contentView.addSubview(womanRadioBoxButton)
        contentView.addSubview(selfAuthButton)
        contentView.addSubview(userTypeButton)
        contentView.addSubview(askAgreementButton)
        contentView.addSubview(ageOver19Button)
        contentView.addSubview(allAgreementButton)
        contentView.addSubview(privacyClauseButton)
        contentView.addSubview(serviceClauseButton)
        contentView.addSubview(selectHospitalButton)
        contentView.addSubview(signUpConfirmButton)
        
        //textfields
        contentView.addSubview(phoneTextField)
        contentView.addSubview(dobTextField)
    }
    
    func setAutoLayOutsFortheDobAndGenderSection() {
        
        dobLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50).isActive = true
        dobLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        dobLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        dobLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        genderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: self.view.frame.size.width / 2).isActive = true
        genderLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        genderLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        genderLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        dobTextField.leadingAnchor.constraint(equalTo: dobLabel.leadingAnchor, constant: 0).isActive = true
        dobTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        dobTextField.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -10).isActive = true
        dobTextField.topAnchor.constraint(equalTo: dobLabel.bottomAnchor, constant: 10).isActive = true

        manRadioBoxButton.leadingAnchor.constraint(equalTo: genderLabel.leadingAnchor).isActive = true
        manRadioBoxButton.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10).isActive = true
        manRadioBoxButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        manRadioBoxButton.widthAnchor.constraint(equalToConstant: self.view.frame.width / 5).isActive = true

        womanRadioBoxButton.leadingAnchor.constraint(equalTo: manRadioBoxButton.trailingAnchor, constant: 10).isActive = true
        womanRadioBoxButton.topAnchor.constraint(equalTo: manRadioBoxButton.topAnchor).isActive = true
        womanRadioBoxButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        womanRadioBoxButton.widthAnchor.constraint(equalToConstant: self.view.frame.width / 5).isActive = true
    }
    
    func setAutoLayOutsForthePhoneSection() {
        phoneLabel.leadingAnchor.constraint(equalTo: dobLabel.leadingAnchor).isActive = true
        phoneLabel.heightAnchor.constraint(equalTo: dobLabel.heightAnchor).isActive = true
        phoneLabel.widthAnchor.constraint(equalTo: dobLabel.widthAnchor).isActive = true
        phoneLabel.topAnchor.constraint(equalTo: dobTextField.bottomAnchor, constant: 30).isActive = true
        
        phoneTextField.leadingAnchor.constraint(equalTo: dobLabel.leadingAnchor).isActive = true
        phoneTextField.heightAnchor.constraint(equalTo: dobTextField.heightAnchor).isActive = true
        phoneTextField.widthAnchor.constraint(equalToConstant: self.view.frame.size.width * 0.5).isActive = true
        phoneTextField.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 10).isActive = true
        
        selfAuthButton.leadingAnchor.constraint(equalTo: phoneTextField.trailingAnchor, constant: 10).isActive = true
        selfAuthButton.topAnchor.constraint(equalTo: phoneTextField.topAnchor).isActive = true
        selfAuthButton.heightAnchor.constraint(equalTo: phoneTextField.heightAnchor).isActive = true
        selfAuthButton.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.25).isActive = true
        
        informForPhoneLabel.leadingAnchor.constraint(equalTo: dobLabel.leadingAnchor, constant: 10).isActive = true
        informForPhoneLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        informForPhoneLabel.widthAnchor.constraint(equalTo: phoneTextField.widthAnchor).isActive = true
        informForPhoneLabel.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 5).isActive = true
    }
    
    func setBelongingsAndTypeSection() {
        belongingLabel.topAnchor.constraint(equalTo: informForPhoneLabel.bottomAnchor, constant: 50).isActive = true
        belongingLabel.widthAnchor.constraint(equalToConstant:self.view.frame.width * 0.7).isActive = true
        belongingLabel.leadingAnchor.constraint(equalTo: dobLabel.leadingAnchor).isActive = true
        belongingLabel.heightAnchor.constraint(equalTo: dobLabel.heightAnchor).isActive = true
        
        detailForBelongingLabel.topAnchor.constraint(equalTo: belongingLabel.bottomAnchor, constant: 10).isActive = true
        detailForBelongingLabel.leadingAnchor.constraint(equalTo: dobLabel.leadingAnchor).isActive = true
        detailForBelongingLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        detailForBelongingLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8).isActive = true
        
        selectHospitalButton.topAnchor.constraint(equalTo: detailForBelongingLabel.bottomAnchor, constant: 10).isActive = true
        selectHospitalButton.leadingAnchor.constraint(equalTo: dobLabel.leadingAnchor).isActive = true
        selectHospitalButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        selectHospitalButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -self.view.frame.width * 0.1).isActive = true
        
        userTypeButton.topAnchor.constraint(equalTo: selectHospitalButton.bottomAnchor, constant: 10).isActive = true
        userTypeButton.leadingAnchor.constraint(equalTo: dobLabel.leadingAnchor).isActive = true
        userTypeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        userTypeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -self.view.frame.width * 0.1).isActive = true
        
        askAgreementButton.topAnchor.constraint(equalTo: userTypeButton.bottomAnchor, constant: 10).isActive = true
        askAgreementButton.leadingAnchor.constraint(equalTo: userTypeButton.leadingAnchor, constant: 5).isActive = true
        askAgreementButton.trailingAnchor.constraint(equalTo: userTypeButton.trailingAnchor, constant: -5).isActive = true
        askAgreementButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setAgreementSection() {
        clauseLabel.topAnchor.constraint(equalTo: askAgreementButton.bottomAnchor, constant: 30).isActive = true
        clauseLabel.leadingAnchor.constraint(equalTo: dobLabel.leadingAnchor).isActive = true
        clauseLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        clauseLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        allAgreementButton.topAnchor.constraint(equalTo: clauseLabel.bottomAnchor, constant: 10).isActive = true
        allAgreementButton.leadingAnchor.constraint(equalTo: dobLabel.leadingAnchor, constant: 10).isActive = true
        allAgreementButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        allAgreementButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        allAgreementLabel.topAnchor.constraint(equalTo: clauseLabel.bottomAnchor, constant: 10).isActive = true
        allAgreementLabel.leadingAnchor.constraint(equalTo: allAgreementButton.trailingAnchor, constant: 10).isActive = true
        allAgreementLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        allAgreementLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //Draw Gray line
        
        serviceClauseButton.topAnchor.constraint(equalTo: allAgreementLabel.bottomAnchor, constant: 20).isActive = true
        serviceClauseButton.leadingAnchor.constraint(equalTo: dobLabel.leadingAnchor, constant: 30).isActive = true
        serviceClauseButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        serviceClauseButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        privacyClauseButton.topAnchor.constraint(equalTo: serviceClauseButton.bottomAnchor, constant: 10).isActive = true
        privacyClauseButton.leadingAnchor.constraint(equalTo: dobLabel.leadingAnchor, constant: 30).isActive = true
        privacyClauseButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        privacyClauseButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        ageOver19Button.topAnchor.constraint(equalTo: privacyClauseButton.bottomAnchor, constant: 10).isActive = true
        ageOver19Button.leadingAnchor.constraint(equalTo: dobLabel.leadingAnchor, constant: 30).isActive = true
        ageOver19Button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ageOver19Button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        serviceClauseLabel.topAnchor.constraint(equalTo: serviceClauseButton.topAnchor).isActive = true
        serviceClauseLabel.leadingAnchor.constraint(equalTo: serviceClauseButton.trailingAnchor, constant: 10).isActive = true
        serviceClauseLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        serviceClauseLabel.heightAnchor.constraint(equalTo: serviceClauseButton.heightAnchor).isActive = true
        
        privacyClauseLabel.topAnchor.constraint(equalTo: privacyClauseButton.topAnchor).isActive = true
        privacyClauseLabel.leadingAnchor.constraint(equalTo: privacyClauseButton.trailingAnchor, constant: 10).isActive = true
        privacyClauseLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        privacyClauseLabel.heightAnchor.constraint(equalTo: privacyClauseButton.heightAnchor).isActive = true
        
        ageOver19Label.topAnchor.constraint(equalTo: ageOver19Button.topAnchor).isActive = true
        ageOver19Label.leadingAnchor.constraint(equalTo: ageOver19Button.trailingAnchor, constant: 10).isActive = true
        ageOver19Label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        ageOver19Label.heightAnchor.constraint(equalTo: ageOver19Button.heightAnchor).isActive = true
    }
    
    func setAutoLayOutsForConfirmButton() {
        signUpConfirmButton.topAnchor.constraint(equalTo: ageOver19Label.bottomAnchor, constant: 20).isActive = true
        signUpConfirmButton.leadingAnchor.constraint(equalTo: dobLabel.leadingAnchor).isActive = true
        signUpConfirmButton.trailingAnchor.constraint(equalTo: userTypeButton.trailingAnchor).isActive = true
        signUpConfirmButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func addTargetToButton() {
        selectHospitalButton.addTarget(self, action: #selector(clickSelectHospitalButton), for: .touchUpInside)
        selfAuthButton.addTarget(self, action: #selector(startVerificationProcess), for: .touchUpInside)
        userTypeButton.addTarget(self, action: #selector(manageUserTypeMenu), for: .touchUpInside)
        signUpConfirmButton.addTarget(self, action: #selector(clickSignUpButton), for: .touchUpInside)
    }
    
    @objc func clickSelectHospitalButton() {
        navigationController?.pushViewController(HospitaListViewController(), animated: true)
    }
    
    @objc func startVerificationProcess() {
        if verifyPhoneNumber(phoneTextField.text) {
            //start the verification process
        } else {
            // alert a message to the user that the phone number the user input is invalid
            
        }
    }
    
    func verifyPhoneNumber(_ phoneNumber: String?) -> Bool {
        return true
    }
    
    @objc func manageUserTypeMenu() {
        manageUserTypeTable()
        isUserTypeButtonClicked = !isUserTypeButtonClicked
    }
    
    @objc func clickSignUpButton() {
        //verifying process
        
        //go to next vc
        let nextVC = tabBarViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func manageUserTypeTable() {
        if isUserTypeButtonClicked {
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.05, options: .curveLinear
                            , animations: {
                self.userTypeTableView.isHidden = false
            })
        } else {
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.05, options: .curveLinear
                            , animations: {
                self.userTypeTableView.isHidden = true
            })
        }
    }
}

extension SignUpViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = userTypeData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
