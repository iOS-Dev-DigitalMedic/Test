//
//  DateCollectionViewCell.swift
//  Test
//
//  Created by PNT001 on 2022/08/04.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {
    var dateLabel: UILabel!
         
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setUpCell()
            setUpLabel()
        }
        
        override init(frame: CGRect) {
            super.init(frame: .zero)
            setUpCell()
            setUpLabel()
        }
            
        func setUpCell() {
            dateLabel = UILabel()
            contentView.addSubview(dateLabel)
            dateLabel.translatesAutoresizingMaskIntoConstraints = false
            dateLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
            dateLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
            dateLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
            dateLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
            }
            
        func setUpLabel() {
            dateLabel.font = UIFont.systemFont(ofSize: 32)
            dateLabel.textAlignment = .center
        }
}
