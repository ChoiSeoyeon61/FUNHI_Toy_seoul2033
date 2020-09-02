
import UIKit




//-----------쑥 보조 작업장임-----------
//---------------------------------여기는 이넘이랑 스트럭처------------------------------------
//임시로 만듦, 내용 보완 필요

//플레이어 능력. 순진한 얼굴, 리트리버, 웅변, 교섭, 능숙한 거짓말, 요리 실력, 철학, 영어 등등등등등
enum Ability {
    case liar
    case insecticide
    case bandage
    case splint
    case book_speech

}

//게임 캐릭터. 플레이 시작 시 생성, 죽으면 삭제
struct GameCharacter {
    var health: Int
    var mental: Int
    var money: Int
    var ability:[Ability?]
    var currentPage: Int
    var currentEpisode : Episode

}

//유저 : [플레이어 정보(게임 캐릭터), 총 죽은 횟수, 쿠키(게임 유료아이템), 최대 페이지, 최대 아이템 수]로 구성
struct User {
    var gameCharacter: GameCharacter
    var totalDying: Int
    var cookie: Int
    var maxPage: Int
    var maxAbility: Int
    let setting : Setting
}
struct Setting{
    var isVibrate : Bool = true
    var fontSize : Int = 15
    var rowSpacig : Int = 28
}

struct FullStory {
    var fullstory : Array = [Episode]()
}

struct Episode {
    var episode : Array = [Page]()
}
// 아래 StoryPage(페이지별 스토리 텍스트) 각각에 들어가는 선택지에 대한 정보 스트럭처. 선택지에 따라 바뀔 수 있는 플레이어의 정보[선택지 문장, 플레이어 능력, 체력, 멘탈, 돈]들을 해당 스트럭처 안에 담아놓음.

//    {
//        get{
//            return 0
//        }
//        //튜토리얼에서 무작위 수 받기
//        set(nextPageIndex){
//            if currentPage == 3 || 5{
//                let num = Int.random(in: 0...3)
//                return num
//            } else if endEpisodeNumber == 666{.    //에피소드의 끝이 확인되었을 때, 다음 에피소드를 무작위로 선정하기
//                let num = Int.random(in: 0...4)
//                return num
//                endEpisodeNumber = 0
//            }
//        }
//    }

//튜토리얼에서 무작위로 주어지는 능력을 받는
struct Choice {
      var choiceText: String
      var ability: [Ability]?
      var abilityGive: Bool
      var health: Int
         //~Give는 해당 항목을 줄 건지, 뺏을 건지에 대한 정보. healthGive: true이면 +health / healthGive: false 이면 -health
      var healthGive: Bool
      var mental: Int
      var mentalGive: Bool
      var money: Int
      var moneyGive: Bool
      var needAbility: Ability?
      let nextPageIndex: Int
       
  
 
   }
// 게임 플레이시 나오는 텍스트 페이지 각각에 대한 스트럭처. 텍스트, 이미지(있을 수도 없을 수도 이씀.), 선택지(최대 3개) 로 구성
struct Page {
    
   
    // 선택지가 최소 1개, 최대 3개라 일단 이렇게 함.
  let index: Int
     let storyText: String
     let storyImage: String?
     var choice: Array = [Choice]()
     
    
    //특정 숫자
    var endEpisodeNumber = 0

}
//--------------------------------여기부터 인스턴스---------------------------------------
// 아래 유저의 플레이어 인스턴스
var santaCharactor1: GameCharacter = GameCharacter(health: 3, mental: 3, money: 3, ability: [], currentPage: 1, currentEpisode: Episode())

// 유저 인스턴스
var santa:User = User(gameCharacter:santaCharactor1, totalDying: 0, cookie: 0, maxPage: 0, maxAbility: 0, setting: Setting())





var woodEP: Episode = Episode(episode: [
    
        Page(index: 1, storyText: "무너진 목자재 아래에 긴급 구호 물품 상자가 깔려 있는 것이 보입니다! 저것들만 치우면 꺼낼 수 있겠는데요, 생각보다 무거워 보여서 자칫 잘못했다간 허리만 나갈 것 같습니다. ", storyImage: nil, choice: [
                  Choice(choiceText: "목자재를 치운다", ability: nil, abilityGive: true, health: 1, healthGive: false, mental: 0, mentalGive: true, money: 0, moneyGive: true, needAbility: nil, nextPageIndex: 1),
                  Choice(choiceText: "그냥 간다", ability: nil, abilityGive: true, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 0, moneyGive: true, needAbility: nil,nextPageIndex: 2)
            ], endEpisodeNumber: 1),
      
        Page(index: 1, storyText: "운동을 좀 헤둘 걸 그랬나요? 당신은 낑낑대며 목재 더미와 씨름하다가 그만 힘을 잘못 줘서 허리에 큰 부담이 오고 말았습니다. 한동안 걷기 힘들 정도로 고통이 상당합니다. 당신은 나무 더미를 향해 저주를 퍼붓다가 이내 포기합니다..", storyImage: nil, choice: [
          Choice(choiceText: "다음", ability: nil, abilityGive: true, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 0, moneyGive: true, needAbility: nil, nextPageIndex: 666)
        ], endEpisodeNumber: 666),
        
        Page(index: 1, storyText: "당신은 발걸음을 돌립니다.", storyImage: nil, choice: [
            Choice(choiceText: "다음", ability: nil, abilityGive: true, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 0, moneyGive: true, needAbility: nil, nextPageIndex: 666)
        ], endEpisodeNumber: 666)
])

var truckSaleEP: Episode = Episode(episode: [
    
    Page(index: 1, storyText: "당신은 길을 걷다가 파란 용달 트럭이 천천히 다가오는 것을 발견합니다. 트럭 짐칸엔 잡동사니가 가득 실려 있고, 활과 창으로 무장한 경호원 셋이 함께 타고 있습니다, 당신 앞에서 조수석 유리창이 내려가더니, 인상 좋은 남자 둘이 자신들을 서울역에서 온 상인이라고 소개하며 당신에게 가까이 와서 물건을 둘러보라고 합니다.", storyImage: nil, choice: [
            Choice(choiceText: "둘러본다", ability: nil, abilityGive: true, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 0, moneyGive: true, needAbility: nil, nextPageIndex: 1),
            Choice(choiceText: "그냥 간다", ability: nil, abilityGive: true, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 0, moneyGive: true, needAbility: nil, nextPageIndex: 6)
    ], endEpisodeNumber: 0),
    
    //선택지 둘러본다
    Page(index: 1, storyText: "둘러보니 별로 쓸모 있어 보이는 물건은 많지 않습니다. \"마음껏 둘러보십시오. 물건은 매번 바뀌니 언제든 또 찾아주시고요.\"", storyImage: nil, choice: [
        Choice(choiceText: "살충제", ability: [.insecticide], abilityGive: true, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 1, moneyGive: false, needAbility: nil, nextPageIndex: 2),
        Choice(choiceText: "붕대와 부목", ability: [.bandage, .splint], abilityGive: true, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 1, moneyGive: false, needAbility: nil, nextPageIndex: 3),
        Choice(choiceText: "<스피치로 승부하라>", ability: [.book_speech], abilityGive: true, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 1, moneyGive: false, needAbility: nil, nextPageIndex: 4),
        Choice(choiceText: "떠난다", ability: nil, abilityGive: true, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 0, moneyGive: true, needAbility: nil, nextPageIndex: 5)
    ], endEpisodeNumber: 0),
    
    Page(index: 1, storyText: "살충제를 구매했습니다.", storyImage: nil, choice: [
        Choice(choiceText: "다음", ability: nil, abilityGive: true, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 0, moneyGive: true, needAbility: nil, nextPageIndex: 666)
    ], endEpisodeNumber: 0),
    
    Page(index: 1, storyText: "붕대와 부목을 구매했습니다.", storyImage: nil, choice: [
        Choice(choiceText: "다음", ability: nil, abilityGive: true, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 0, moneyGive: true, needAbility: nil, nextPageIndex: 666)
    ], endEpisodeNumber: 0),
    
    Page(index: 1, storyText: "<스피치로 승부하라>를 구매했습니다", storyImage: nil, choice: [
        Choice(choiceText: "다음", ability: nil, abilityGive: true, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 0, moneyGive: true, needAbility: nil, nextPageIndex: 666)
    ], endEpisodeNumber: 666),
    
    Page(index: 1, storyText: "여기엔 별로 살 만한 물건이 없는 듯 합니다. 당신은 물건을 구매하지 않고 트럭을 돌아섭니다.", storyImage: nil, choice: [
        Choice(choiceText: "다음", ability: nil, abilityGive: true, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 0, moneyGive: true, needAbility: nil, nextPageIndex: 666)
    ], endEpisodeNumber: 666),
//선택지 그냥 간다
    Page(index: 1, storyText: "당신은 발걸음을 돌립니다.", storyImage: nil, choice: [
        Choice(choiceText: "다음", ability: nil, abilityGive: true, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 0, moneyGive: true, needAbility: nil, nextPageIndex: 666)
    ], endEpisodeNumber: 666)
    
]

)
