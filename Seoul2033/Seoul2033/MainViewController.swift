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
     
            let list: Choice = santa.gameCharacter.currentPage().choice[indexPath.row]
//            if list.needAbility != nil {
//                ChoiceTableViewCell.SelectionStyle = .none
//                tableView.allowsSelection = false
//            }
            let cell = tableView.dequeueReusableCell(withIdentifier: "choiceCell") as! ChoiceTableViewCell
           
           
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
        
        // 체력 / 멘탈 / 돈 글자 지정
        healthLabel.text = "체력"
        mentalLable.text = "멘탈"
        moneyLable.text = "돈"
        
        // 게임 본문 & 쪽넘버 & 능력창 String 업뎃
        testLable.text = santa.gameCharacter.currentPage().storyText
        pageNumber.text = "\(santa.gameCharacter.pageIndex)"
        abilityLable.text = "\(santa.gameCharacter.ability)"
        
        // 체력 / 멘탈 / 돈 이미지 업뎃
        healthImage.image = UIImage(named: "health3")
        mentalImage.image = UIImage(named: "mental3")
        moneyImage.image = UIImage(named: "money3")
        
        
        // 현재 보유 능력 레이블에 띄우기(뜨긴 뜨는데.. String으로 안 듬)
        for ability in santa.gameCharacter.ability {
        
        abilityStringVer += [ability.abilityNamed()]
        }
        abilityLable.text = "\(abilityStringVer)"
    
    }
   
    
    func checkHaveNeedAbility() {
       
    }
    
   
    
      
    
    
    func onOffChoiceCell() {
          
    }
    
    
    // 페이지 업데이트
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let santaNeed = santa.gameCharacter.currentPage().choice[indexPath.row].needAbility
        if santaNeed == [] || Seoul2033.checkHaveNeedAbility(needAbilitys: santaNeed, myAbilitys: santa.gameCharacter.ability) == true {
            
      
        // 체력 / 멘탈 / 돈 데이터 업뎃
        santa.gameCharacter.health += santa.gameCharacter.currentPage().choice[indexPath.row].health
        santa.gameCharacter.mental += santa.gameCharacter.currentPage().choice[indexPath.row].mental
        santa.gameCharacter.money += santa.gameCharacter.currentPage().choice[indexPath.row].money
        
        // 체력 / 멘탈 / 돈 이미지 업뎃
        healthImage.image = UIImage(named: "health\(santa.gameCharacter.health)")
        mentalImage.image = UIImage(named: "mental\(santa.gameCharacter.mental)")
        moneyImage.image = UIImage(named: "money\(santa.gameCharacter.money)")
        
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
// 프롤로그EP 내에서 랜덤한 능력 주는 페이지로 이동할 때 해당 능력 캐릭터에게 추가해주기
        //첫 번째 능력 추가해주기
        if santa.gameCharacter.currentEpisodeIndex == 0 && santa.gameCharacter.currentEpPageIndex == 2 {
            if santa.gameCharacter.currentPage().choice[indexPath.row].nextPageIndex == 3 {
            santa.gameCharacter.ability += [.leadership]
          } else if santa.gameCharacter.currentPage().choice[indexPath.row].nextPageIndex == 4 {
            santa.gameCharacter.ability += [.pureFace]
          } else if santa.gameCharacter.currentPage().choice[indexPath.row].nextPageIndex == 5 {
            santa.gameCharacter.ability += [.gameSkill]
          }
            
          //두 번째 능력 추가해주기
          } else if santa.gameCharacter.currentEpisodeIndex == 0 && santa.gameCharacter.currentEpPageIndex == 6 {
        if santa.gameCharacter.currentPage().choice[indexPath.row].nextPageIndex == 7 {
            santa.gameCharacter.ability += [.english]
          } else if santa.gameCharacter.currentPage().choice[indexPath.row].nextPageIndex == 8 {
            santa.gameCharacter.ability += [.machineEngineering]
          } else if santa.gameCharacter.currentPage().choice[indexPath.row].nextPageIndex == 9 {
            santa.gameCharacter.ability += [.nimble]
          }
        }

        // 현재 보유 능력 AbilityLable에 띄우기(뜨긴 뜨는데.. String으로 안 듬)
        abilityStringVer = []
        for ability in santa.gameCharacter.ability {
        abilityStringVer += [ability.abilityNamed()]
        }
        // 현재 표시되는 방법 : ["능력", "능력"]. 수정 필요!!!
        abilityLable.text = "\(abilityStringVer)"
        print(abilityStringVer)
        
       
        santa.gameCharacter.pageIndex += 1
        
       
        
        //페이지 인덱스값 올려서 넘기기 & 다음 페이지 없으면(666이면) 에피소드 넘기고 페이지인덱스값 0 만들기
        santa.gameCharacter.currentEpPageIndex = santa.gameCharacter.currentPage().choice[indexPath.row].nextPageIndex
        if santa.gameCharacter.currentEpPageIndex == 666 {
            santa.gameCharacter.currentEpisodeIndex = getRandomEpNumber(epList: RealFullStory, currentEpIndex: santa.gameCharacter.currentEpisodeIndex)
            santa.gameCharacter.currentEpPageIndex = 0
            
        }
        
        // 페이지 storytext & 쪽넘버 & 능력창 String 업뎃
        testLable.text = "\(santa.gameCharacter.currentPage().storyText)"
        pageNumber.text = "\(santa.gameCharacter.pageIndex)"
        abilityLable.text = "\(abilityStringVer)"
        
        
        
        //활성화하려면 능력이 필요한 선택지 활성화/비활성화 여부 결정하기
        
        
        //tableView 업뎃
        self.choiceTableView.reloadData()
        }  else {
            
        }
        }
    
    
    @IBAction func goTo0(_ sender: Any) {
    }

    @IBAction func goTo2(_ sender: Any) {
    }
    
       
}



