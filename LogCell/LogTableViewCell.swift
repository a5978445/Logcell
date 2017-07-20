//
//  LogTableViewCell.swift
//  LogCell
//
//  Created by LiTengFang on 2017/7/19.
//  Copyright © 2017年 LiTengFang. All rights reserved.
//

import UIKit
import SnapKit


class LogTableViewCell: UITableViewCell {


    var leftLabels = [UILabel]()
    var rightLabels = [UILabel]()
    let cellLayout: LogTableViewCellLayout
    
    init(reuseIdentifier: String?, cellLayout: LogTableViewCellLayout = LogTableViewCellLayout()) {
        self.cellLayout = cellLayout
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    var dic: (titles: [String], values: [String])? {
        didSet {
            
            func addLabels() {
                dic!.titles.forEach {
                    let aLabel = stardardLable()
                    aLabel.text = $0
                    leftLabels.append(aLabel)
                    contentView.addSubview(aLabel)
                }
                
                dic!.values.forEach {
                    let aLabel = stardardLable()
                    aLabel.text = $0
                    rightLabels.append(aLabel)
                    contentView.addSubview(aLabel)
                }
            }
            
         
            
            func updateText() {
                for (index,label) in leftLabels.enumerated() {
                    label.text = dic!.titles[index]
                }
                
                for (index,label) in rightLabels.enumerated() {
                    label.text = dic!.values[index]
                }
                
            }
            
            func removeLabels() {
                leftLabels.forEach {
                    $0.removeFromSuperview()
                }
                
                rightLabels.forEach {
                    $0.removeFromSuperview()
                }
                
                leftLabels.removeAll()
                rightLabels.removeAll()
            }
            
            
            if let aDic = dic {
              //  assert(aDic.titles.count == aDic.values.count)
                
                if oldValue == nil    {
                    addLabels()
                    
                    cellLayout.updateLayout(leftLabels, rightLabels)
                } else if oldValue!.titles.count != aDic.titles.count || oldValue!.values.count != aDic.values.count {
                    removeLabels()
                    addLabels()
                 
                    cellLayout.updateLayout(leftLabels, rightLabels)
                   
                } else {
                    updateText()
                }
                
                
                if let aClosure = cellLayout.updateLabelStyle {
                    aClosure(leftLabels, rightLabels)
                }
            }
            
           
        }
    }
    
    func stardardLable() -> UILabel {
        let aLabel = UILabel()
        return aLabel
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
      //  dic.titles.count
    }
    

}
