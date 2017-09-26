//
//  ViewController.swift
//  tableView
//
//  Created by kaori hirata on 2017-09-25.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    
    let imageNames = ["centipede.jpg", "ladybug.jpg", "potatoBug.jpg", "wolfSpider.jpg"]
    
    /// 画像のタイトル
    let imageTitles = ["Centipede", "Ladybug", "potatoBug", "wolfSpider"]
    
    /// 画像の説明
    let imageDescriptions = [
        "aaaaaa",
        "bbbbbb",
        "cccccc",
        "dddddd"
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// セルの個数を指定するデリゲートメソッド（必須）
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int{
        return imageNames.count
    }
    
    //各セルの要素を設定する
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        let img = UIImage(named:"\(imageNames[indexPath.row])")
        
        // Tag番号 1 で UIImageView インスタンスの生成
        let imageView = table.viewWithTag(1) as! UIImageView
        imageView.image = img
        
        // Tag番号 ２ で UILabel インスタンスの生成
        let label1 = table.viewWithTag(2) as! UILabel
        label1.text = "No.\(indexPath.row + 1)"
        
        // Tag番号 ３ で UILabel インスタンスの生成
        let label2 = table.viewWithTag(3) as! UILabel
        label2.text = "\(imageDescriptions[indexPath.row])"
        
        return cell
    }
    

}

