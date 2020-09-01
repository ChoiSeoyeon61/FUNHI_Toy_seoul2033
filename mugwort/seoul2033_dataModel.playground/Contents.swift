import UIKit

//---------------------------------여기는 이넘이랑 스트럭처------------------------------------
//임시로 만듦, 내용 보완 필요

//플레이어 능력. 순진한 얼굴, 리트리버, 웅변, 교섭, 능숙한 거짓말, 요리 실력, 철학, 영어 등등등등등
enum Ability {
    case liar
    case 순진한 얼굴

}

//게임 캐릭터. 플레이 시작 시 생성, 죽으면 삭제
struct GameCharacter {
    var health: Int
    var mental: Int
    var money: Int
    var ability:[Ability?]
    var currentPage: Int

}

//유저 : [플레이어 정보(게임 캐릭터), 총 죽은 횟수, 쿠키(게임 유료아이템), 최대 페이지, 최대 아이템 수]로 구성
struct User {
    var gameCharacter: GameCharacter
    var totalDying: Int
    var cookie: Int
    var maxPage: Int
    var maxAbility: Int
}

// 아래 StoryPage(페이지별 스토리 텍스트) 각각에 들어가는 선택지에 대한 정보 스트럭처. 선택지에 따라 바뀔 수 있는 플레이어의 정보[선택지 문장, 플레이어 능력, 체력, 멘탈, 돈]들을 해당 스트럭처 안에 담아놓음.
struct Choice {
    var choiceText: String
    var ability: Ability?
    var abilityGive: Bool?
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
    var index: Int
    var storyText: String
    var storyImage: String?
    var choice1: Choice
    // 선택지가 최소 1개, 최대 3개라 일단 이렇게 함.
    var choice2: Choice?
    var choice3: Choice?

}
//--------------------------------여기부터 인스턴스---------------------------------------
// 아래 유저의 플레이어 인스턴스
var santaCharactor1: GameCharacter = GameCharacter(health: 3, mental: 3, money: 3, ability: nil, currentPage: 1)

// 유저 인스턴스
var santa:User = User(gameCharacter:santaCharactor1, totalDying: 0, cookie: 0, maxPage: 0, maxAbility: 0)


if current.stroypage[number].choice1.ability == nil {

}

// 게임 처음 시작 페이지 4p 구현해봄
let ep1:[StoryPage] = [
    StoryPage(index: 1, storyText: "핵전쟁으로 세상이 멸망하고 난 뒤 서울은 폐허가 되었지만 몇몇 현명한 사람들은 누구에게도 들키지 않을 곳에 은신처를 만드는 데 성공했습니다. \n당신 부모님도 마찬가지였죠. 당신은 이 인구 100명도 채 안 되는 작은 마을에서 자랐습니다, 이 곳 사람들은 감자와 고구마 같은 것들을 키우며 오순도순 살아가고 있습니다.", storyImage: nil,
              choice1: Choice(choiceText: "핵전쟁이요?", ability: nil, abilityGive: nil, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 0, moneyGive: true), choice2: nil, choice3: nil),



    StoryPage(index: 2, storyText: "그래요! 이 세상이 왜 난장판이 되었겠어요?\n 벌써 18년 전, 당신이 태어났을 때의 이야기예요. 누가 쏜 건지도 모르는 핵폭탄이 서울 상공에서 폭발했교, 도시는 어둠과 혼란으로 뒤덮였죠. 소문에 따르면 군대, 강도, 괴물, 미친 AI, 전염병, 입대 영장 등 온갖 상상할 수도 없는 모든 재해가 한꺼번에 찾아왔다고 해요. 당신의 어머니는 직업 군인이었는데, 출산 휴가중이던 그녀는 갓 태어난 당신과 가족들, 이웃들을 데리고 깊은 산속에 숨기로 했어요.\n 바로 여기 말이죠!", storyImage: "nSeoulTower.jpg", choice1: Choice(choiceText: "이곳은 안전한가요?", ability: nil, abilityGive: nil, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 0, moneyGive: true), choice2: nil, choice3: nil),
    StoryPage(index: 3, storyText: "정말 다행이도 이곳은 지난 십 수년간 큰 위험 없이 잘 견뎌냈어요. 이따금씩 길을 잃은 노상 강도나 굶주린 거대 너구리 같은 것들이 겁을 주긴 했지만, 사람들은 서로 의지하고 신뢰하며 이 공동체를 튼튼하고 안전하게 지켜냈습니다. 꼭 필요한 경우가 아니라면 산을 내려가지 않음으로써 외부에 공동체의 위치를 절대 노출시키지 않는다는 원칙 덕분이었죠. 힘든 세상이었지만 마을 사람들은 경비를 서고, 사냥을 하고, 농사를 짓고, 아이들을 가르치며 평화롭게 살아갔습니다.", choice1: Choice(choiceText: "저는 어떤가요?", ability: nil, abilityGive: nil, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 0, moneyGive: true), choice2: nil, choice3: nil),
    StoryPage(index: 4, storyText: "당신은 동물을 무척 사랑하는 아이였어요! 이 세계에서 동물을 사랑하기란 쉬운 게 아니죠.", choice1: Choice(choiceText: "그리고요?", ability: nil, abilityGive: nil, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 0, moneyGive: true), choice2: nil, choice3: nil),
    StoryPage(index: 4, storyText: "당신은 동물을 무척 사랑하는 아이였어요! 이 세계에서 동물을 사랑하기란 쉬운 게 아니죠.", choice1: Choice(choiceText: "그리고요?", ability: nil, abilityGive: nil, health: 0, healthGive: true, mental: 0, mentalGive: true, money: 0, moneyGive: true), choice2: nil, choice3: nil)

    ]


