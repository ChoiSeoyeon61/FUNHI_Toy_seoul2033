//
//  storyTableViewCell.swift
//  Seoul2033
//
//  Created by 손영웅 on 2020/09/23.
//

import UIKit

class storyTableViewCell: UITableViewCell {

    
    @IBOutlet var storyImage: UIImageView!
    
    @IBOutlet var storyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(image : String, text: String){
        //storyImage.isHidden = true
        //페이지 인덱스값 올려서 넘기기 & 다음 페이지 없으면(666이면) 에피소드 넘기고 페이지인덱스값 0 만들기
        //에피소드 글씨 크기 컨트롤하기
        storyLabel.font = UIFont(name: storyLabel.font.fontName, size: CGFloat(santa.setting.fontSize))
        //에피소드 넘기기
         storyImage.isHidden = false
            storyImage.image = UIImage(named: image)
            storyLabel.text = "\(text)"
    }
    
    func storyLabelUpdate(size : Int){
        storyLabel.font = UIFont(name: storyLabel.font.fontName, size: CGFloat(santa.setting.fontSize))
    }
}
