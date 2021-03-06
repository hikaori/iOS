//
//  ViewController.swift
//  tableView
//
//  Created by kaori hirata on 2017-09-25.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
    var setBugs = SetBugs.scaryBugSet()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = editButtonItem
    }
    //after came bake from editiong view ,this method will fire
    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Edit ボタンが押された時に行の最後に追加した’Add a New Bug’のセルを表示。Doneボタンが押されたら非表示。
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if editing {
            myTableView.beginUpdates()
            for (section, bugSet) in setBugs.enumerated() {
                let indexPathForNewRow = IndexPath(row: bugSet.bugArray.count, section: section)
                myTableView.insertRows(at: [indexPathForNewRow], with: .automatic)
            }
            myTableView.endUpdates()
            myTableView.setEditing(true, animated: true)
        } else {
            myTableView.beginUpdates()
            for (section, bugSet) in setBugs.enumerated() {
                let indexPathForNewRow = IndexPath(row: bugSet.bugArray.count, section: section)
                myTableView.deleteRows(at: [indexPathForNewRow], with: .automatic)
            }
            myTableView.endUpdates()
            myTableView.setEditing(false, animated: true)
        }
       
    }
    // change left button style(red - /green +)
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        let lastRow = setBugs[indexPath.section].bugArray.count
        // why not '==' ?
        if indexPath.row >= lastRow {
            return .insert
        } else {
            return .delete
        }
    }
    
    //for create section
    func numberOfSections(in tableView: UITableView) -> Int {
        return setBugs.count
    }
    //for ccreate section title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return ScaryBug.scaryFactorToString(scaryFactor: setBugs[section].bugArray[0].howScary)
        
        return setBugs[section].name
    }
    
    // for delete / add bug
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            setBugs[indexPath.section].bugArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
        else if editingStyle == UITableViewCellEditingStyle.insert{
            let newScaryBug = ScaryBug(withName: "New Bug Name", imageName: "", howScary: .Non)
            setBugs[indexPath.section].bugArray.append(newScaryBug)
            tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    // Adding a row by tapping the entire row part01
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if isEditing && indexPath.row < setBugs[indexPath.section].bugArray.count{
            return nil
        }
        else{
            return indexPath
        }
    }
    // Adding a row by tapping the entire row part02
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row >= setBugs[indexPath.section].bugArray.count && isEditing {
            self.tableView(tableView, commit: .insert, forRowAt: indexPath)
        }
    }
    
    /// セルの個数を指定するデリゲートメソッド（必須）
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int{
        // 'Add a New Bug'用にセルを１つ追加
        let adjustment = isEditing ? 1 : 0
        return setBugs[section].bugArray.count + adjustment
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得    
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! CustomTableViewCell
        
        let set =  setBugs[indexPath.section]
        if indexPath.row >= set.bugArray.count {
            //追加したセルに要素（imageName/titleText/descriptionText）の値をセット。
            cell.setCell(imageName: "", titleText: "Add a New Bug", descriptionText: "",rateImage: "")
        } else {
            cell.setCell(imageName:setBugs[indexPath.section].bugArray[indexPath.row].imageName, titleText: setBugs[indexPath.section].bugArray[indexPath.row].name, descriptionText: ScaryBug.scaryFactorToString(scaryFactor: setBugs[indexPath.section].bugArray[indexPath.row].howScary),rateImage: "shockedface2_empty")
        }
        // セルに値を設定
       
        return cell
    }
    

}

