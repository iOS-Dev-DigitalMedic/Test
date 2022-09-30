//
//  BarGraphViewController.swift
//  Test
//
//  Created by PNT001 on 2022/08/03.
//

import UIKit

class BarGraphViewController: UIViewController {
    let cellID = "cellIdentifier"
    let calenderView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .yellow
        return cv
    }()
    
    let collectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.showsVerticalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .green
        cv.register(DateCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cellIdentifier")
        return cv
    }()
    
    let graphView: UIView = {
        let bgv = UIView()
        bgv.backgroundColor = .blue
        bgv.translatesAutoresizingMaskIntoConstraints = false
        return bgv
    }()
    
    let testLabel: UILabel = {
        let tl = UILabel()
        tl.text = "기본 검사"
        tl.translatesAutoresizingMaskIntoConstraints = false
        return tl
    }()
    
    let testInfoButton: UIButton = {
        let tib = UIButton()
        //image insert to the button
        tib.backgroundColor = .purple
        tib.translatesAutoresizingMaskIntoConstraints = false
        return tib
    }()
    
    let alertView: UIView = {
        let av = UIView()
        av.translatesAutoresizingMaskIntoConstraints = false
        av.backgroundColor = .green
        return av
    }()
    
    let alertInfoImageView: UIImageView = {
         let aiiv = UIImageView()
        aiiv.translatesAutoresizingMaskIntoConstraints = false
        return aiiv
    }()
    let alertInfoLabel: UILabel = {
        let ail = UILabel()
        ail.translatesAutoresizingMaskIntoConstraints = false
        ail.text = "상세 정보"
        return ail
    }()
    
    let alertInfoConfirmButton: UIButton = {
        let aicb = UIButton()
        aicb.translatesAutoresizingMaskIntoConstraints = false
        aicb.setTitle("확인", for: .normal)
        return aicb
    }()
    
    lazy var barChartView: barGraphView = {
       let barChartView = barGraphView()
        barChartView.frame = CGRect(x: 10, y: 50, width: graphView.frame.size.width - 20, height: 300)
       return barChartView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
            
        setCalenderView()
        
        self.view.addSubview(graphView)
        NSLayoutConstraint.activate([
            graphView.topAnchor.constraint(equalTo: calenderView.bottomAnchor),
            graphView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            graphView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            graphView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        graphView.addSubview(testLabel)
        NSLayoutConstraint.activate([
            testLabel.topAnchor.constraint(equalTo: graphView.topAnchor, constant: 30),
            testLabel.leadingAnchor.constraint(equalTo: graphView.leadingAnchor, constant: 20),
            testLabel.heightAnchor.constraint(equalToConstant: 30),
            testLabel.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        graphView.addSubview(testInfoButton)
        NSLayoutConstraint.activate([
            testInfoButton.topAnchor.constraint(equalTo: testLabel.topAnchor),
            testInfoButton.leadingAnchor.constraint(equalTo: testLabel.trailingAnchor, constant: 10),
            testInfoButton.widthAnchor.constraint(equalToConstant: 30),
            testInfoButton.heightAnchor.constraint(equalToConstant: 30)
            
        ])
        testLabel.backgroundColor = .yellow
        
        
        
        
        
        
        
        
    }
    
    func setCalenderView() {
        self.view.addSubview(calenderView)
        NSLayoutConstraint.activate([
            calenderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            calenderView.heightAnchor.constraint(equalToConstant: 200),
            calenderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            calenderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        calenderView.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: calenderView.topAnchor, constant: 80).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: calenderView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: calenderView.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        barChartView.dataEntries =
           [
              TestData(score: 1, title: "가제1"),
              TestData(score: 5, title: "가제2"),
              TestData(score: 3, title: "수면"),
              TestData(score: 7, title: "전반적 평가"),
           ]
        graphView.addSubview(barChartView)
        
    }
    
    

}


extension BarGraphViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 31
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! DateCollectionViewCell
        cell.dateLabel.text = "111"
        cell.backgroundColor = .red
        return cell
    }
    
}
