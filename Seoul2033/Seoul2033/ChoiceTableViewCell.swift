//
//  ChoiceTableViewCell.swift
//  Seoul2033
//
//  Created by 최서연 on 2020/09/04.
//  Copyright © 2020 손영웅. All rights reserved.
//

import UIKit

class ChoiceTableViewCell: UITableViewCell {

    @IBOutlet weak var choiceLable: UILabel!
    
    // 셀 높이 지정 함수

    
    // 기본 함수? 정확히는 모름
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        choiceLable.font = UIFont(name: choiceLable.font.fontName, size: CGFloat(santa.setting.fontSize))
        // Configure the view for the selected state
    }
    func choiceLabelUpdate(){
        choiceLable.font = UIFont(name: choiceLable.font.fontName, size: CGFloat(santa.setting.fontSize))
    }
    // 섹션개수
    
  

}
