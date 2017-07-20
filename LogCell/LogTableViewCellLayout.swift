//
//  LogTableViewCellLayout.swift
//  LogCell
//
//  Created by LiTengFang on 2017/7/20.
//  Copyright © 2017年 LiTengFang. All rights reserved.
//

import UIKit

class LogTableViewCellLayout {
   
    
    let distance: CGFloat
    
    let edgeInsets:UIEdgeInsets
    private(set) var  updateLayout: ([UILabel],[UILabel]) -> ()
    private(set) var  updateLabelStyle: (([UILabel],[UILabel]) -> ())?
    
    
    init(_ distance: CGFloat = 10, edgeInsets: UIEdgeInsets = UIEdgeInsets(top: 12, left: 14, bottom: 12, right: 14), updateLayout: @escaping (([UILabel],[UILabel]) -> ()), updateLabelStyle: (([UILabel],[UILabel]) -> ())? = nil) {
        
        self.distance = distance
        self.edgeInsets = edgeInsets
        self.updateLayout = updateLayout
        self.updateLabelStyle = updateLabelStyle
    }
    
    init(_ distance: CGFloat = 10, edgeInsets: UIEdgeInsets = UIEdgeInsets(top: 12, left: 14, bottom: 12, right: 14), updateLabelStyle: (([UILabel],[UILabel]) -> ())? = nil) {
        
        self.distance = distance
        self.edgeInsets = edgeInsets
        self.updateLabelStyle = updateLabelStyle
        self.updateLayout = { leftLabels, rightLabels in
            let top = edgeInsets.top
            let leftMargin = edgeInsets.left
            let rightMargin = edgeInsets.right
            let bottom = edgeInsets.bottom
            for i in 0..<leftLabels.count {
                if i == 0 {
                    
                    leftLabels[i].snp.makeConstraints { make in
                        make.top.equalTo(top)
                        make.left.equalTo(leftMargin)
                    }
                    
                    
                    
                } else if i + 1 == leftLabels.count {
                    leftLabels[i].snp.makeConstraints { make in
                        make.top.equalTo(leftLabels[i - 1].snp.bottom).offset(distance)
                        make.left.equalTo(leftMargin)
                        make.bottom.equalToSuperview().offset(-bottom)
                    }
                } else {
                    leftLabels[i].snp.makeConstraints { make in
                        make.top.equalTo(leftLabels[i - 1].snp.bottom).offset(distance)
                        make.left.equalTo(leftMargin)
                    }
                }
            }
            for i in 0..<leftLabels.count {
                rightLabels[i].snp.makeConstraints { make in
                    make.top.equalTo(leftLabels[i])
                    make.right.equalToSuperview().offset(-rightMargin)
                }
            }
        }
    }
    
    
}
