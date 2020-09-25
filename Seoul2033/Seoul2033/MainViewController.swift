//
//  ViewController.swift
//  Seoul2033
//
//  Created by 손영웅 on 2020/08/31.
//  Copyright © 2020 손영웅. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
   
    
    override func viewWillAppear(_ animated: Bool) {
        mainStoryTableView.allowsSelection = false
        
    }
 //섹션 : 1개
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
         }
    
         //섹션 속 셀 개수 : Choice 개수
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            var intToReturn : Int = 0
            if tableView == mainStoryTableView{
                let story = labelArrayInTable.count
                intToReturn = story
            } else if tableView == choiceTableView{
                let currentChoice = santa.gameCharacter.currentPage().choice.count
                print(currentChoice)
                intToReturn = currentChoice
            }
            return intToReturn
        }
           
        //각 셀 별 내용 : 텍스트 띄우기
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cellToReturn = UITableViewCell()
            if tableView == mainStoryTableView{
                let storyCell = tableView.dequeueReusableCell(withIdentifier: "storyCell", for: indexPath) as! storyTableViewCell
                let storyLine: String = labelArrayInTable[indexPath.row]
                let storyImage: String = imageArrayInTable[indexPath.row]
                storyCell.storyLabelUpdate(size: santa.setting.fontSize)
                storyCell.update(image: storyImage, text: storyLine)
                 cellToReturn = storyCell
                
            } else if tableView == choiceTableView{
                let list: Choice = santa.gameCharacter.currentPage().choice[indexPath.row]
    //            if list.needAbility != nil {
    //                ChoiceTableViewCell.SelectionStyle = .none
    //                tableView.allowsSelection = false
    //            }
                let cell = tableView.dequeueReusableCell(withIdentifier: "choiceCell") as! ChoiceTableViewCell
                cell.choiceLable.text = list.choiceText
                cell.choiceLabelUpdate()
                
                cellToReturn = cell
            }
            return cellToReturn
        }
    
//셀 높이
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            var height = 0
            if tableView == mainStoryTableView{
                self.mainStoryTableView.rowHeight = UITableView.automaticDimension
                height = Int(UITableView.automaticDimension)
            } else if tableView == choiceTableView{
                height = 55
            }
            return CGFloat(height)
        }

   
// 아웃렛
 
    
    @IBOutlet weak var healthImage: UIImageView!
    @IBOutlet weak var mentalImage: UIImageView!
    @IBOutlet weak var moneyImage: UIImageView!
    @IBOutlet weak var pageNumber: UILabel!
    
    @IBOutlet weak var PagescrollView: UIScrollView!
    @IBOutlet weak var choiceTableView: UITableView!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var mentalLable: UILabel!
    @IBOutlet weak var moneyLable: UILabel!
    @IBOutlet var tabOpenButton: UIButton!
    @IBOutlet var tabCloseButton: UIButton!
    @IBOutlet var abilityPanel: UIView!
    @IBOutlet var abilityLabel: UILabel!
    @IBOutlet var mainStoryTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.choiceTableView.dataSource = self
        self.choiceTableView.delegate = self
        self.mainStoryTableView.dataSource = self
        self.mainStoryTableView.delegate = self
        
        // 체력 / 멘탈 / 돈 글자 지정
        healthLabel.text = "체력"
        mentalLable.text = "멘탈"
        moneyLable.text = "돈"
        
        // 게임 본문 & 쪽넘버 & 능력창 String 업뎃
        //testLable.text = santa.gameCharacter.currentPage().storyText
        mainStoryTableView.reloadData()
        pageNumber.text = "\(santa.gameCharacter.pageIndex)"

        tabOpenButton.setTitle("\(santa.gameCharacter.ability)", for: .normal)
        abilityLabel.text = "\(santa.gameCharacter.ability)"
        abilityLabel.text = "\(santa.gameCharacter.ability)"
    
        // 체력 / 멘탈 / 돈 이미지 업뎃
        healthImage.image = UIImage(named: "health3")
        mentalImage.image = UIImage(named: "mental3")
        moneyImage.image = UIImage(named: "money3")
        
        
        // 현재 보유 능력 레이블에 띄우기(뜨긴 뜨는데.. String으로 안 듬)
        for ability in santa.gameCharacter.ability {
            
        //메인 스토리 테이블뷰 속 어레이에 값 넣기
        labelArrayInTable.append(santa.gameCharacter.currentPage().storyText)
        imageArrayInTable.append(santa.gameCharacter.currentPage().storyImage ?? "noImage")
           
    
        abilityStringVer += [ability.abilityNamed()]
        }
        tabOpenButton.setTitle("\(abilityStringVer)", for: .normal)
        abilityLabel.text = "\(abilityStringVer)"
        //santa.gameCharacter.currentEpPageIndex += 1
        self.mainStoryTableView.rowHeight = UITableView.automaticDimension
        self.mainStoryTableView.estimatedRowHeight = 200
    
    }
   //하단 바 클릭하면 패널 올라오기
    @IBAction func tabOpen(_ sender: Any) {
        abilityPanel.isHidden = false
        tabOpenButton.isHidden = true
    }
    @IBAction func tabClose(_ sender: Any) {
        abilityPanel.isHidden = true
        tabOpenButton.isHidden = false
    }
  //메인 스토리 테이블뷰 어레이
    var labelArrayInTable : [String] = ["핵전쟁으로 세상이 멸망하고 난 뒤 서울은 폐허가 되었지만 몇몇 현명한 사람들은 누구에게도 들키지 않을 곳에 은신처를 만드는 데 성공했습니다. \n당신 부모님도 마찬가지였죠. 당신은 이 인구 100명도 채 안 되는 작은 마을에서 자랐습니다, 이 곳 사람들은 감자와 고구마 같은 것들을 키우며 오순도순 살아가고 있습니다."]
    var imageArrayInTable : [String] = ["ex"]
    
  //메인 스토리 테이블뷰 업데이트하기
    
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.labelArrayInTable.count-1, section: 0)
            self.mainStoryTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
   //게임 재시작하기
    @IBAction func restartGame(_ sender: Any) {
        // 체력/멘탈/돈/페이지인덱스/능력/풀에피소드/현재 에피, 에피 내 인덱스 초기화
        santa.gameCharacter.health = 3
        santa.gameCharacter.mental = 3
        santa.gameCharacter.money = 2
        santa.gameCharacter.pageIndex = 1
        santa.gameCharacter.ability.removeAll()
        RealFullStory = [prologueEP,woodEP,truckSaleEP]
        santa.gameCharacter.currentEpisodeIndex = 0
        santa.gameCharacter.currentEpPageIndex = 0
        abilityPanel.isHidden = true
        
        // 본문 테이블 뷰 텍스트,이미지 / 테이블 뷰 리로드 /
        imageArrayInTable.removeAll()
        labelArrayInTable.removeAll()
    
        mainStoryTableView.reloadData()
        tabOpenButton.isHidden = false
        abilityStringVer.removeAll()
        abilityLabel.text = "\(abilityStringVer)"
        tabOpenButton.setTitle("\(abilityStringVer)", for: .normal)
        labelArrayInTable.append(santa.gameCharacter.currentPage().storyText)
        imageArrayInTable.append(santa.gameCharacter.currentPage().storyImage ?? "noImage")
        mainStoryTableView.reloadData()
        self.choiceTableView.reloadData()
}
    
    // 페이지 업데이트
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let santaNeed = santa.gameCharacter.currentPage().choice[indexPath.row].needAbility
        if santaNeed == [] || Seoul2033.checkHaveNeedAbility(needAbilitys: santaNeed, myAbilitys: santa.gameCharacter.ability) == true {
            
        // ar 나올 페이지 지정하고, 해당 페이지는 AR뷰컨으로 푸쉬하기
        if santa.gameCharacter.currentPage().storyText == "목자재를 치워봅시다."  {
                           performSegue(withIdentifier: "goToARView", sender: nil)
                       }
      
        // 체력 / 멘탈 / 돈 데이터 업뎃
        santa.gameCharacter.health += santa.gameCharacter.currentPage().choice[indexPath.row].health
        santa.gameCharacter.mental += santa.gameCharacter.currentPage().choice[indexPath.row].mental
        santa.gameCharacter.money += santa.gameCharacter.currentPage().choice[indexPath.row].money
        
            if santa.gameCharacter.currentPage().choice[indexPath.row].health < 0{
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            } else if santa.gameCharacter.currentPage().choice[indexPath.row].mental < 0{
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            } else if santa.gameCharacter.currentPage().choice[indexPath.row].money < 0{
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            }
            
        // 위 세 개 3 이상 넘어가는 것 방지하기
        limitHpMtMoney()
            
        
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
        tabOpenButton.setTitle("\(abilityStringVer)", for: .normal)
        abilityLabel.text = "\(abilityStringVer)"
        print(abilityStringVer)
        
       
        santa.gameCharacter.pageIndex += 1
        
            
        
        //페이지 인덱스값 올려서 넘기기 & 다음 페이지 없으면(666이면) 에피소드 넘기고 페이지인덱스값 0 만들기
        santa.gameCharacter.currentEpPageIndex = santa.gameCharacter.currentPage().choice[indexPath.row].nextPageIndex
        //에피소드 넘기기
            
            
        if santa.gameCharacter.currentEpPageIndex == 666 {
            santa.gameCharacter.currentEpisodeIndex = getRandomEpNumber(epList: RealFullStory, currentEpIndex: santa.gameCharacter.currentEpisodeIndex)
            santa.gameCharacter.currentEpPageIndex = 0
            labelArrayInTable.removeAll()
            imageArrayInTable.removeAll()
           }
            
                //메인 스토리 테이블뷰 속 어레이에 값 넣기
                labelArrayInTable.append(santa.gameCharacter.currentPage().storyText)
                imageArrayInTable.append(santa.gameCharacter.currentPage().storyImage ?? "noImage")
                
                scrollToBottom()
        
        // 페이지 storytext & 쪽넘버 & 능력창 String 업뎃
        //testLable.text = "\(santa.gameCharacter.currentPage().storyText)"
            mainStoryTableView.reloadData()
        pageNumber.text = "\(santa.gameCharacter.pageIndex)"
        tabOpenButton.setTitle("\(/*santa.gameCharacter.ability*/abilityStringVer)", for: .normal)
        abilityLabel.text = "\(/*santa.gameCharacter.ability*/abilityStringVer)"
        //데이터 저장
            //최대 페이지 저장하기
            if santa.maxPage < santa.gameCharacter.pageIndex{
                santa.maxPage = santa.gameCharacter.pageIndex
                print("현재 최대 페이지 장수는 \(santa.maxPage)")
            }
            //최대 아이템 수 저장하기
            if santa.maxAbility < santa.gameCharacter.ability.count{
                santa.maxAbility = santa.gameCharacter.ability.count
                print("현재 최대 능력 갯수는 \(santa.maxAbility)")
            }
            //게임 오버 구현하기 + 죽은 횟수 저장하기
            /*
             santa.totalDying += 1
             */

        
        
        //tableView들 업뎃
        self.choiceTableView.reloadData()
            self.mainStoryTableView.reloadData()
        }  else {
            
        }
        }
    
    
    @IBAction func goTo0(_ sender: Any) {
    }

    @IBAction func goTo2(_ sender: Any) {
    }
    
}



