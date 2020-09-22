//
//  ViewController.swift
//  Seoul2033
//
//  Created by 손영웅 on 2020/08/31.
//  Copyright © 2020 손영웅. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
 
    
        //섹션 : 1개
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
         }
         //섹션 속 셀 개수 : Choice 개수
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            let currentChoice = santa.gameCharacter.currentPage().choice.count
            print(currentChoice)
            return currentChoice
        }
           
        //각 셀 별 내용 : 텍스트 띄우기
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "choiceCell") as! ChoiceTableViewCell
            let list: Choice
            list = santa.gameCharacter.currentPage().choice[indexPath.row]
            cell.choiceLable.text = list.choiceText
        
            
            return cell
        }
    
//셀 높이
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return CGFloat(55)
        }

   
// 아웃렛
    @IBOutlet weak var testLable: UILabel!
    
    @IBOutlet weak var healthImage: UIImageView!
    @IBOutlet weak var mentalImage: UIImageView!
    @IBOutlet weak var moneyImage: UIImageView!
    @IBOutlet weak var pageNumber: UILabel!
    
    @IBOutlet weak var PagescrollView: UIScrollView!
    @IBOutlet weak var choiceTableView: UITableView!
    @IBOutlet weak var abilityLable: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var mentalLable: UILabel!
    @IBOutlet weak var moneyLable: UILabel!
    
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.choiceTableView.dataSource = self
        self.choiceTableView.delegate = self
    
        healthLabel.text = "체력"
        mentalLable.text = "멘탈"
            moneyLable.text = "돈"
    
        testLable.text = santa.gameCharacter.currentPage().storyText
        pageNumber.text = "\(santa.gameCharacter.pageIndex)"
        abilityLable.text = "\(santa.gameCharacter.ability)"
    
        healthImage.image = UIImage(named: "health3")
        mentalImage.image = UIImage(named: "mental3")
        moneyImage.image = UIImage(named: "money3")
        
        
        // 현재 보유 능력 레이블에 띄우기(뜨긴 뜨는데.. String으로 안 듬)
        for ability in santa.gameCharacter.ability {
        
        abilityStringVer += [ability.abilityNamed()]
        }
        abilityLable.text = "\(abilityStringVer)"
    
    }
   
    
   
    
   
    
      
    
    
    func onOffChoiceCell() {
          
    }
    // 페이지 업데이트
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        // 체력 / 멘탈 / 돈 데이터 업뎃
        santa.gameCharacter.health += santa.gameCharacter.currentPage().choice[indexPath.row].health
        santa.gameCharacter.mental += santa.gameCharacter.currentPage().choice[indexPath.row].mental
        santa.gameCharacter.money += santa.gameCharacter.currentPage().choice[indexPath.row].money
        
        // 능력 주기 or 뺏기
        if santa.gameCharacter.currentPage().choice[indexPath.row].ability != [] {
            if santa.gameCharacter.currentPage().choice[indexPath.row].abilityGive == true {
                santa.gameCharacter.ability += santa.gameCharacter.currentPage().choice[indexPath.row].ability
            } else {
                for lable in santa.gameCharacter.ability.enumerated() {
                    if lable.element == santa.gameCharacter.currentPage().choice[indexPath.row].ability[0] {
                        santa.gameCharacter.ability.remove(at: lable.offset)
                    }
                }
            }
               
        }
        
        // 현재 보유 능력 레이블에 띄우기(뜨긴 뜨는데.. String으로 안 듬)
        for ability in santa.gameCharacter.ability {
        
        abilityStringVer += [ability.abilityNamed()]
        }
        abilityLable.text = "\(abilityStringVer)"
        print(abilityStringVer)
        
        // 체력 / 멘탈 / 돈 이미지 업뎃
        healthImage.image = UIImage(named: "health\(santa.gameCharacter.health)")
        mentalImage.image = UIImage(named: "mental\( santa.gameCharacter.mental)")
        moneyImage.image = UIImage(named: "money\(santa.gameCharacter.money)")
        santa.gameCharacter.pageIndex += 1
       
        //현 에피소드의 페이지 인덱스값
        santa.gameCharacter.currentEpPageIndex = santa.gameCharacter.currentPage().choice[indexPath.row].nextPageIndex
        
        // 페이지 storytext를 위 값 이용해 업뎃
        testLable.text = "\(santa.gameCharacter.currentPage().storyText)"
        pageNumber.text = "\(santa.gameCharacter.pageIndex)"
        abilityLable.text = "\(santa.gameCharacter.ability)"
        
       
       
       
        
        //tableView 업뎃
        self.choiceTableView.reloadData()
     
      
       
        
        
        }
    
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
        
  

    
    
    
    
    
    
    @IBAction func goTo0(_ sender: Any) {
    }

    @IBAction func goTo2(_ sender: Any) {
    }
    
       
}



