
import UIKit




//-----------쑥 보조 작업장임-----------
//---------------------------------여기는 이넘이랑 스트럭처------------------------------------
//임시로 만듦, 내용 보완 필요

//플레이어 능력. 순진한 얼굴, 리트리버, 웅변, 교섭, 능숙한 거짓말, 요리 실력, 철학, 영어 등등등등등
enum Ability {
    case liar

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
    var episode : Array = [Any]()
}
// 아래 StoryPage(페이지별 스토리 텍스트) 각각에 들어가는 선택지에 대한 정보 스트럭처. 선택지에 따라 바뀔 수 있는 플레이어의 정보[선택지 문장, 플레이어 능력, 체력, 멘탈, 돈]들을 해당 스트럭처 안에 담아놓음.
struct Choice {
    var choiceText: String
    var ability: Ability?
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
}
//다음 페이지로 넘길 때마다 실행되는 함수
func pageUpdate(){
    //현재 페이지가 에피소드의 마지막인지를 확인하기
    let arrayLast = episode.last!
    if arrayLast == currentEpisode{
        endEpisodeNumber = 666          //맞다면 666을 주기
    }
}
//튜토리얼에서 무작위로 주어지는 능력을 받는 스토리를 정리하는 페이지
var abilityPage : Array = [Page]()
abilityPage = []

// 게임 플레이시 나오는 텍스트 페이지 각각에 대한 스트럭처. 텍스트, 이미지(있을 수도 없을 수도 이씀.), 선택지(최대 3개) 로 구성
struct Page {
    let index: Int
    let storyText: String
    let storyImage: String?
    let choice: Array = [Choice]()
    // 선택지가 최소 1개, 최대 3개라 일단 이렇게 함.
  
    
    //특정 숫자
    var endEpisodeNumber = 0

}
//--------------------------------여기부터 인스턴스---------------------------------------
// 아래 유저의 플레이어 인스턴스
var santaCharactor1: GameCharacter = GameCharacter(health: 3, mental: 3, money: 3, ability: [], currentPage: 1, currentEpisode: Episode())

// 유저 인스턴스
var santa:User = User(gameCharacter:santaCharactor1, totalDying: 0, cookie: 0, maxPage: 0, maxAbility: 0, setting: Setting())





var epWood: Array = Episode[

    Page(index: 1, storyText: "무너진 목자재 아래에 긴급 구호 물품 상자가 깔려 있는 것이 보입니다! 저것들만 치우면 꺼낼 수 있겠는데요, 생각보다 무거워 보여서 자칫 잘못했다간 허리만 나갈 것 같습니다. ", storyImage: nil, choice: [
        Choice(choiceText: "목자재를 치운다", ability: nil, abilityGive: true, health: 1, healthGive: false, mental: 0, mentalGive: true, money: 0, moneyGive: true, needAbility: nil, nextPageIndex: 1),
        Choice(choiceText: "그냥 간다", ability: nil, abilityGive: true, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 0, moneyGive: true, needAbility: nil,nextPageIndex: 2)
    ], endEpisodeNumber: 1),
    
    Page(index: 1, storyText: "운동을 좀 헤둘 걸 그랬나요? 당신은 낑낑대며 목재 더미와 씨름하다가 그만 힘을 잘못 줘서 허리에 큰 부담이 오고 말았습니다. 한동안 걷기 힘들 정도로 고통이 상당합니다. 당신은 나무 더미를 향해 저주를 퍼붓다가 이내 포기합니다..", storyImage: nil, choice: [
        Choice(choiceText: "다음", ability: nil, abilityGive: true, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 0, moneyGive: true, needAbility: nil, nextPageIndex: 666)
    ], endEpisodeNumber: 666),
    Page(index: 1, storyText: "당신은 발걸음을 돌립니다.", storyImage: nil, endEpisodeNumber: 666)
]
