//
//  GameTableViewCell.swift
//  MySportsApp
//
//  Created by Matthew Trahan on 3/24/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var homeTeam: UILabel!
    @IBOutlet weak var awayTeam: UILabel!
    @IBOutlet weak var homeRecord: UILabel!
    @IBOutlet weak var awayRecord: UILabel!
    @IBOutlet weak var gameTime: UILabel!
    @IBOutlet weak var gameDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
