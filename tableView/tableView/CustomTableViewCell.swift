//
//  CustomTableViewCell.swift
//  tableView
//
//  Created by kaori hirata on 2017-09-25.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myTitleLabel: UILabel!
    @IBOutlet weak var myDescriptionLabel: UILabel!
    @IBOutlet weak var myRate: UIImageView!
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// 画像・タイトル・説明文を設定するメソッド
    func setCell(imageName: String, titleText: String, descriptionText: String, rateImage:String) {
        myImageView.image = UIImage(named: imageName)
        myTitleLabel.text = titleText
        myDescriptionLabel.text = descriptionText
        myRate.image = UIImage(named: rateImage)
    }

}
