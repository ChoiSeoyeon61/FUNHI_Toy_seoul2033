import UIKit

//임시로 만듦, 내용 보완 필요

//플레이어 능력. 순진한 얼굴, 리트리버, 웅변, 교섭, 능숙한 거짓말, 요리 실력, 철학, 영어 등등등등등
enum Ability {
    case liar
}

//게임 캐릭터. 플레이 시작 시 생성, 죽으면 삭제
struct Charactor {
    var health: Int
    var mental: Int
    var money: Int
    var ability:Ability
    var currentPage: Int
    
}

//유저 : [플레이어 정보(게임 캐릭터), 총 죽은 횟수, 쿠키(게임 유료아이템), 최대 페이지, 최대 아이템 수]로 구성
struct User {
    var charactor: Charactor
    var totalDying: Int
    var cookie: Int
    var maxPage: Int
    var maxAbility: Int
}

// 아래 StoryPage(페이지별 스토리 텍스트) 각각에 들어가는 선택지에 대한 정보 스트럭처. 선택지에 따라 바뀔 수 있는 플레이어의 정보[선택지 문장, 플레이어 능력, 체력, 멘탈, 돈]들을 해당 스트럭처 안에 담아놓음.
struct Choice {
    var choiceText: String
    var ability: Ability
    var abilityGive: Bool
    var health: Int
       //~Give는 해당 항목을 줄 건지, 뺏을 건지에 대한 정보. healthGive: true이면 +health / healthGive: false 이면 -health
    var healthGive: Bool
    var mental: Int
    var mentalGive: Bool
    var money: Int
    var moneyGive: Bool
    
    
}

// 게임 플레이시 나오는 텍스트 페이지 각각에 대한 스트럭처. 텍스트, 이미지(있을 수도 없을 수도 이씀.), 선택지(최대 3개) 로 구성
struct StoryPage {
    var storyText: String
    var storyImage: String?
    var choice1: Choice
    // 선택지가 최소 1개, 최대 3개라 일단 이렇게 함.
    var choice2: Choice?
    var choice3: Choice?
    
}
