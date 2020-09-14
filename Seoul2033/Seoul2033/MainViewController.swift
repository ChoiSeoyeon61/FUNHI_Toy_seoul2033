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
    
    
   override func viewDidLoad() {
         super.viewDidLoad()
       self.choiceTableView.dataSource = self
       self.choiceTableView.delegate = self
         
     }
    
    //현재 페이지 번호
    let pageIndex: Int = 0
     
    // 섹션 수 : 1
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
     }
     //섹션 속 셀 개수 : Choice 어레이 안 Choice 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let currentpage = prologueEP[santaCharacter1.currentPage-1]
        let currentChoice = currentpage.choice.count
        
        return currentChoice
    }
       
       //각 셀 별 내용 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "choiceCell") as! ChoiceTableViewCell
        let list: Choice
        list = prologueEP[0].choice[indexPath.row]
        cell.choiceLable.text = list.choiceText
           
        return cell
    }
    
 
  

    
    @IBAction func goTo0(_ sender: Any) {
    }
    @IBAction func goTo2(_ sender: Any) {
    }
    
       
}

