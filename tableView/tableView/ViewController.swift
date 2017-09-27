//
//  ViewController.swift
//  tableView
//
//  Created by kaori hirata on 2017-09-25.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {

    
    var setBugs = SetBugs.scaryBugSet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
////         for create section
    func numberOfSections(in tableView: UITableView) -> Int {
        return setBugs.count
    }
    ///  for ccreate section title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return ScaryBug.scaryFactorToString(scaryFactor: setBugs[section].bugArray[0].howScary)
        return setBugs[section].name
    }
    
    // for delete bug
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            setBugs[indexPath.section].bugArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    /// セルの個数を指定するデリゲートメソッド（必須）
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int{
        return setBugs[section].bugArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得    
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! CustomTableViewCell
        
        // セルに値を設定
        cell.setCell(imageName:setBugs[indexPath.section].bugArray[indexPath.row].imageName, titleText: setBugs[indexPath.section].bugArray[indexPath.row].name, descriptionText: ScaryBug.scaryFactorToString(scaryFactor: setBugs[indexPath.section].bugArray[indexPath.row].howScary))
        return cell
    }
    

}

