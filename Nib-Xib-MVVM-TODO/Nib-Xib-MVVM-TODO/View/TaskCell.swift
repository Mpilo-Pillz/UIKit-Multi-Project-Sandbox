//
//  TaskCell.swift
//  Nib-Xib-MVVM-TODO
//
//  Created by Mpilo Pillz on 2023/10/29.
//

import UIKit

class TaskCell: UITableViewCell {
    
    let titleLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.font = UIFont.systemFont(ofSize: 16)
           label.numberOfLines = 0 // Allow multiline text
           return label
       }()

       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           
           // Add UI components to the cell's content view
           contentView.addSubview(titleLabel)
           
           // Define constraints for the UI components
           NSLayoutConstraint.activate([
               titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
               titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
               titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
               titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
           ])
       }

       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
