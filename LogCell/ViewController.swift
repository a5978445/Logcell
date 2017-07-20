//
//  ViewController.swift
//  DecoratorPatternCell
//
//  Created by LiTengFang on 2017/7/18.
//  Copyright © 2017年 LiTengFang. All rights reserved.
//

import UIKit


struct CellModel {
    var title: String?
    var imageName: String?
    var response: () -> Void
    
}

class ViewController: UITableViewController {

    
    fileprivate var dataSouce: [CellModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dataSouce =  [CellModel(title: "默认风格", imageName: nil, response:{[unowned self] in
            
            self.navigationController?.pushViewController(DetailTableViewController(style: .plain, cellStyle: .default), animated: true)
            print("push 页面")
        }),
                      CellModel(title: "自定义边距风格", imageName: nil, response: {[unowned self] in
                        
                        self.navigationController?.pushViewController(DetailTableViewController(style: .plain, cellStyle: .margin), animated: true)
                      }),
                      CellModel(title: "自定义布局风格", imageName: nil ,response: {[unowned self] in
                        
                       self.navigationController?.pushViewController(DetailTableViewController(style: .plain, cellStyle: .layoutCustom), animated: true)
                      }),
                      CellModel(title: "自定义label样式风格", imageName: nil ,response: {[unowned self] in
                        
                        self.navigationController?.pushViewController(DetailTableViewController(style: .plain, cellStyle: .labelCustom), animated: true)
                      })
                   
            
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSouce.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? =  tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = dataSouce[indexPath.row].title
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataSouce[indexPath.row].response()
        
    }

}

