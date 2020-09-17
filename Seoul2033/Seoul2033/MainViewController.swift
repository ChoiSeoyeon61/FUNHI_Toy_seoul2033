//
//  ViewController.swift
//  Seoul2033
//
//  Created by 손영웅 on 2020/08/31.
//  Copyright © 2020 손영웅. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
 
     func numberOfSections(in tableView: UITableView) -> Int {
            return 1
         }
         //섹션 속 셀 개수 : Choice 어레이 안 Choice 개수
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            let currentChoice = currentPage.choice.count
            print(currentChoice)
            return currentChoice
        }
           
           //각 셀 별 내용
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "choiceCell") as! ChoiceTableViewCell
            let list: Choice
            list = currentPage.choice[indexPath.row]
            cell.choiceLable.text = list.choiceText
        
            
            return cell
        }
        
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return CGFloat(55)
         }
        
        // 셀 선택되었을 때 행동
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        //캐릭터 현재 페이지 위치를 choice nextPageIndex 이용해서 업데이트함. 1 뺀 이유는 실제 인덱스값이랑 currentPageNumber가 1 차이 나서.
            santaCharacter1.currentPageNumber = currentPage.choice[indexPath.row].nextPageIndex
        // 페이지 storytext를 위 값 이용해 업뎃
            testLable.text = "\(truckSaleEP[santaCharacter1.currentPageNumber].storyText)"
        // 선택지 테이블 뷰 새로고침(이나.. 현재까지 작동 안 되는 중)
      
            self.choiceTableView.reloadData()
         
          
            
        
        // 캐릭터
    //        if prologueEP[santaCharacter1.currentPageNumber].choice.count != 0 {
    //            if prologueEP[santaCharacter1.currentPageNumber].choice[indexPath.row].abilityGive == true {
    //                santaCharacter1.ability += prologueEP[santaCharacter1.currentPageNumber].choice[indexPath.row].ability
    //            } else {
    //                // abilityGive가 false일 때 캐릭터 ability랑 choice ability랑 비교해서 공통인 부분을 캐릭터 ability에서 삭제해야 함.
    //                for i in santaCharacter1.ability{
    //
    //                }
    //            }
    //
    //
    //        }
        }
// 테스트레이블, 체력등 이미지, 페이지 넘버...
    @IBOutlet weak var testLable: UILabel!
    
    @IBOutlet weak var healthImage: UIImageView!
    @IBOutlet weak var mentalImage: UIImageView!
    @IBOutlet weak var moneyImage: UIImageView!
    @IBOutlet weak var pageNumber: UILabel!
    
    @IBOutlet weak var PagescrollView: UIScrollView!
    @IBOutlet weak var choiceTableView: UITableView!
    
    // 뷰디드로드
   override func viewDidLoad() {
         super.viewDidLoad()
       self.choiceTableView.dataSource = self
       self.choiceTableView.delegate = self
    
    // 첫 시작 stroyText.
    
    
    // !!!!!!!!!!!현재 "페이지" 위치!!!!!! / 그런데 이 값이 업데이트가 안 되는 것 같음.. 이유는 santaCharacter1.currentPageNumbe가 반영이 안 되고 있는 것 같은데 이유를 모르겠음.
//    var currentPage = prologueEP[santaCharacter1.currentPageNumber-1]
    

    
    // 섹션 수 : 1
   
    // 셀 비활성화
     

   testLable.text = currentPage.storyText
        
    }
   
   
    var currentPage = truckSaleEP[santaCharacter1.currentPageNumber]
    
    
    func changeCharecterAbility() {
       
       
    }

    func changeCharcterHp() {
        
    }
    
    func onOffChoiceCell() {
          
    }
    
   
    
  

    
    
    
    
    
    
    @IBAction func goTo0(_ sender: Any) {
    }

    @IBAction func goTo2(_ sender: Any) {
    }
    
       
}



