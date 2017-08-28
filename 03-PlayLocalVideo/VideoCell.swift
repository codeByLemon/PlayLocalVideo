//
//  VideoCell.swift
//  03-PlayLocalVideo
//
//  Created by 张延 on 2017/8/28.
//  Copyright © 2017年 com.CocoaLemon.www. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {

    @IBOutlet weak var palyBtn: UIImageView!
    @IBOutlet weak var backImgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
