//
//  ViewController.swift
//  LogCell
//
//  Created by LiTengFang on 2017/7/19.
//  Copyright © 2017年 LiTengFang. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    
    enum Style {
        case `default`
        case margin
        
        case layoutCustom
        case labelCustom
        
        
        var cell: LogTableViewCell {
            switch self {
            case .default:
                return LogTableViewCell(reuseIdentifier: "cell")
            case .margin:
                //   return LogTableViewCell(reuseIdentifier: "cell")
                
                return LogTableViewCell(reuseIdentifier: "cell", cellLayout: LogTableViewCellLayout(20, edgeInsets: UIEdgeInsets(top: 20,left: 20,bottom: 20,right: 20)))
                
            case .layoutCustom:
                
                return LogTableViewCell(reuseIdentifier: "cell", cellLayout:   LogTableViewCellLayout { rightLabels,leftLabels  in
                    let top = 7
                    let leftMargin = 10
                    let rightMargin = 11
                    let bottom = 12
                    let distance = 15
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
                    
                })
            case .labelCustom:
                
                
                return LogTableViewCell(reuseIdentifier: "cell", cellLayout: LogTableViewCellLayout( updateLabelStyle: { leftLabels, rightLabels in
                    
                    leftLabels.forEach { label  in
                        label.textColor = UIColor.red
                    }
                }))
                
            }
        }
        
    }
    
    let cellStyle: Style
  
    
    
  //  fileprivate var dataSouce: [CellModel]!
    
    
    init(style: UITableViewStyle, cellStyle: Style) {
        self.cellStyle = cellStyle
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: LogTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell") as? LogTableViewCell
        if cell == nil {
            cell = cellStyle.cell
        }
        
        if indexPath.row == 0 {
            cell?.dic = (["name","age","性别"],["XiaoFang","18","男"])
        } else {
            cell?.dic = (["name","age","性别","爱好"],["XiaoFang","18","男","女"])
        }
        
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}

