//
//  RepoTableViewCell.swift
//  NetworkingBasic2
//
//  Created by Derrick Park on 2017-10-19.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    @IBOutlet weak var repoId: UILabel!
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoLang: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupCell(repo: Repository) {
        self.repoId.text = String(repo.id)
        self.repoName.text = repo.name
        self.repoLang.text = repo.language
    }

}
