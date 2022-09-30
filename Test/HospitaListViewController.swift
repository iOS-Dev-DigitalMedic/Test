//
//  HospitaListViewController.swift
//  Test
//
//  Created by PNT001 on 2022/08/03.
//

import UIKit

class HospitaListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    let data = ["none","aaaaa","bbbbb","ccccc","ddddd","eeeee","fffff"]
    
    var listTableView: UITableView = {
       let ltb = UITableView()
        ltb.backgroundColor = .white
        ltb.translatesAutoresizingMaskIntoConstraints = false
        return ltb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        listTableView.delegate = self
        listTableView.dataSource = self
        
        self.view.addSubview(listTableView)
        
        listTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        listTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        listTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        listTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = data[indexPath.row]
        cell.detailTextLabel?.text = "주소"
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
