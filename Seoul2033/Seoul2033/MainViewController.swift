//
//  ViewController.swift
//  Seoul2033
//
//  Created by 손영웅 on 2020/08/31.
//  Copyright © 2020 손영웅. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
  


    @IBOutlet weak var healthImage: UIImageView!
    @IBOutlet weak var mentalImage: UIImageView!
    @IBOutlet weak var moneyImage: UIImageView!
    @IBOutlet weak var pageNumber: UILabel!
    
    @IBOutlet weak var PagescrollView: UIScrollView!
    @IBOutlet weak var choiceTableView: UITableView!
    
    
   
       
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
       }
        //섹션 속 셀 개수
     func numberOfSections(in tableView: UITableView) -> Int {
           
               
        let currentpage = prologueEP[0]
        
        let currentChoice = currentpage.choice.count
        return currentChoice
    }
       
       //각 셀 별 내용
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "choiceCell") as! ChoiceTableViewCell
           // 왜 never used이지..?
           let list: Choice
           list = prologueEP[0].choice[indexPath.row]
           cell.choiceLable.text = list.choiceText
           
        return cell
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
               return CGFloat(50)
             }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }

    
    @IBAction func goTo0(_ sender: Any) {
    }
    @IBAction func goTo2(_ sender: Any) {
    }
    
       
}

