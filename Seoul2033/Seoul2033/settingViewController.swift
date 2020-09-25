//
//  settingViewController.swift
//  Seoul2033
//
//  Created by 손영웅 on 2020/08/31.
//  Copyright © 2020 손영웅. All rights reserved.
//

import UIKit

class settingViewController: UIViewController {

    
    @IBOutlet var letterSize: UILabel!
    @IBOutlet var rowSize: UILabel!
    @IBOutlet var exampleText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        letterSize.text = String(santa.setting.fontSize)
        exampleText.font = UIFont(name: exampleText.font.fontName, size: CGFloat(santa.setting.fontSize))
    }
    @IBAction func letterSizeMinus(_ sender: Any) {
        santa.setting.fontSize -= 1
        letterSize.text = String(santa.setting.fontSize)
        exampleText.font = UIFont(name: exampleText.font.fontName, size: CGFloat(santa.setting.fontSize))
        }
    @IBAction func letterSizePlus(_ sender: Any) {
        santa.setting.fontSize += 1
        letterSize.text = String(santa.setting.fontSize)
        exampleText.font = UIFont(name: exampleText.font.fontName, size: CGFloat(santa.setting.fontSize))
    }
    @IBAction func rowSizeMinus(_ sender: Any) {
        santa.setting.rowSpacing -= 1
    }
    @IBAction func rowSizePlus(_ sender: Any) {
        santa.setting.rowSpacing += 1
    }
}

