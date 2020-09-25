//
//  dataModel.swift
//  Seoul2033
//
//  Created by 손영웅 on 2020/09/03.
//  Copyright © 2020 손영웅. All rights reserved.
//
import Foundation
import UIKit

//---------------------------------여기는 이넘이랑 스트럭처------------------------------------




var RealFullStory:[[Page]] = [prologueEP,woodEP,truckSaleEP]

// 다음 에피소드 인덱스 랜덤으로 리턴


enum Ability {
    case leadership
    case pureFace
    case gameSkill
    case english
    case machineEngineering
    case nimble
    case insecticide
    case bandage
    case splint
    case bookSpeech
    case muscularStrength
    
    func abilityNamed() -> String {
        switch self {
        case .leadership:
            return "리더십"
        case .pureFace:
            return "순수한 얼굴"
        case .gameSkill:
            return "게임 스킬"
        case .english:
            return "영어"
        case .machineEngineering:
            return "기계공학"
        case .nimble:
            return "날렵함"
        case .insecticide:
            return "살충제"
        case .bandage:
            return "붕대"
        case .splint:
            return "부목"
        case .bookSpeech:
            return "<스피치로 승부하라>"
        case .muscularStrength:
            return "근력"
        }
    }
}


// 다음 페이지 인덱스 랜덤으로 리턴


struct Choice {
    var choiceText: String
    var ability: [Ability]
    var abilityGive: Bool
    var health: Int
       //~Give는 해당 항목을 줄 건지, 뺏을 건지에 대한 정보. healthGive: true이면 +health / healthGive: false 이면 -health

    var mental: Int
    var money: Int
    var needAbility: [Ability]
    var nextPageIndex: Int
    }
struct Page {
    var index: Int
    var storyText: String
    var storyImage: String?
    var choice : Array = [Choice]()
    // 선택지가 최소 1개, 최대 3개라 일단 이렇게 함.
  
    
    //특정 숫자
    var endEpisodeNumber = 0

}


//게임 캐릭터. 플레이 시작 시 생성, 죽으면 삭제
struct GameCharacter {
    var health: Int = 3
    var mental: Int = 3
    var money: Int = 2
    var ability:[Ability] = []
    // currentPage -> " Number로 변경 : 인덱스값이라 더 의미 전달 잘 됨.
    var GameFullStory:[[Page]] = RealFullStory
    var currentEpPageIndex: Int = 0
    var currentEpisodeIndex : Int = 0
    func currentEpisode() -> [Page] {
        return RealFullStory[currentEpisodeIndex]
    }
    func currentPage() -> Page {
        return currentEpisode()[currentEpPageIndex]
    }
    var pageIndex = 1
    
}
//유저 : [플레이어 정보(게임 캐릭터), 총 죽은 횟수, 쿠키(게임 유료아이템), 최대 페이지, 최대 아이템 수]로 구성
struct User {
    var gameCharacter: GameCharacter
    var totalDying: Int
    var cookie: Int
    var maxPage: Int
    var maxAbility: Int
    var setting : Setting
    
}
//ability Lable 배열
    var abilityStringVer: [String] = []

struct Setting{
    var isVibrate : Bool = true
    var fontSize : Int = 15
    var rowSpacing : Int = 28
}

// 에피 랜덤으로 넘기는 함수
func getRandomEpNumber(epList: [[Page]], currentEpIndex: Int ) -> Int {
    let epListVar = epList
    var epListItemCount: Int = epListVar.count
    var epIndex: Int = currentEpIndex
    var currentEP = epList[epIndex]
    RealFullStory.remove(at: epIndex)
    epListItemCount -= 1
    epIndex = Int.random(in: 0...epListItemCount-1)
    currentEP = RealFullStory[epIndex]
    return epIndex
}


// 전역변수 함수 내부에서 덜 쓰도록 파라미터 적극적으로 활용하기. a

// nextPageIndex 랜덤값 리턴하는 함수
func getRandomPageNumber(randomStartNum : Int, randomFinishNum: Int ) -> Int {
    let newNextPageIndex: Int = Int.random(in: randomStartNum...randomFinishNum)
  
    return newNextPageIndex
    }
// 셀 활성화 조건 능력 가지고 있나 체크하는 함수
func checkHaveNeedAbility(needAbilitys: [Ability], myAbilitys: [Ability]) -> Bool {
    var needAbilitysCopy = needAbilitys
    let haveAbility: Bool
    for needAbility in needAbilitys {
        for myAbility in myAbilitys.enumerated() {
            if myAbility.element == needAbility {
                needAbilitysCopy.remove(at: 0)
                }
            }
        }
    if needAbilitysCopy == [] {
        haveAbility = true
    } else {
        haveAbility = false
    }
    return haveAbility
}

// 체력, 멘탈, 돈 3 이상 넘어가는 것 방지하기

func limitHpMtMoney() {
    if santa.gameCharacter.health > 3 {
        santa.gameCharacter.health = 3
    }
    if santa.gameCharacter.mental > 3 {
        santa.gameCharacter.mental = 3
    }
    if santa.gameCharacter.money > 3 {
        santa.gameCharacter.money = 3
    }
}


//--------------------------------여기부터 인스턴스---------------------------------------
// 아래 유저의 플레이어 인스턴스



var santaCharacter1: GameCharacter = GameCharacter(health: 3, mental: 3, money: 3, ability: [])

   // 유저 인스턴스
var santa:User = User(gameCharacter: santaCharacter1, totalDying: 0, cookie: 0, maxPage: 0, maxAbility: 0, setting: Setting())



// 게임 처음 시작 페이지 4p 구현해봄
let prologueEP : [Page] = [
    Page(index: 1, storyText: "핵전쟁으로 세상이 멸망하고 난 뒤 서울은 폐허가 되었지만 몇몇 현명한 사람들은 누구에게도 들키지 않을 곳에 은신처를 만드는 데 성공했습니다. \n당신 부모님도 마찬가지였죠. 당신은 이 인구 100명도 채 안 되는 작은 마을에서 자랐습니다, 이 곳 사람들은 감자와 고구마 같은 것들을 키우며 오순도순 살아가고 있습니다.", storyImage: nil, choice: [Choice(choiceText: "핵전쟁이요?", ability: [], abilityGive: true, health: 0, mental: 0, money: 0, needAbility: [], nextPageIndex: 1)]),
    Page(index: 2, storyText: "그래요! 이 세상이 왜 난장판이 되었겠어요?\n 벌써 18년 전, 당신이 태어났을 때의 이야기예요. 누가 쏜 건지도 모르는 핵폭탄이 서울 상공에서 폭발했교, 도시는 어둠과 혼란으로 뒤덮였죠. 소문에 따르면 군대, 강도, 괴물, 미친 AI, 전염병, 입대 영장 등 온갖 상상할 수도 없는 모든 재해가 한꺼번에 찾아왔다고 해요. 당신의 어머니는 직업 군인이었는데, 출산 휴가중이던 그녀는 갓 태어난 당신과 가족들, 이웃들을 데리고 깊은 산속에 숨기로 했어요.\n 바로 여기 말이죠!", storyImage: "nSeoulTower", choice: [Choice(choiceText: "이곳은 안전한가요?", ability: [], abilityGive: true, health: 0,  mental: 0,  money: 0, needAbility: [], nextPageIndex: 2)]),
    Page(index: 3, storyText: "정말 다행히도 이곳은 지난 십 수년간 큰 위험 없이 잘 견뎌냈어요. 이따금씩 길을 잃은 노상 강도나 굶주린 거대 너구리 같은 것들이 겁을 주긴 했지만, 사람들은 서로 의지하고 신뢰하며 이 공동체를 튼튼하고 안전하게 지켜냈습니다. 꼭 필요한 경우가 아니라면 산을 내려가지 않음으로써 외부에 공동체의 위치를 절대 노출시키지 않는다는 원칙 덕분이었죠. 힘든 세상이었지만 마을 사람들은 경비를 서고, 사냥을 하고, 농사를 짓고, 아이들을 가르치며 평화롭게 살아갔습니다.", choice: [Choice(choiceText: "저는 어떤가요?", ability: [], abilityGive: true, health: 0, mental: 0,  money: 0, needAbility: [],  nextPageIndex: getRandomPageNumber(randomStartNum: 3, randomFinishNum: 5))]),
                    //첫번째 능력 받는 페이지
    Page(index: 1, storyText: "당신은 마을의 엄청난 말썽꾸러기이자 골목대장이었어요. 산 곳곳을 매일 뛰어다니고 온갖 사고를 치고 다녔고, 가끔씩 애들을 이끌고 다른 골목 아이들과 쌈박질을 하곤 했어요. 리더로 산다는 것은 확실히 피곤한 일이긴 하지만.. 뭐, 당신은 그걸 꽤 좋아했던 것 같네요. 나이 먹으면서 더 이상 그런 짓들은 안 하지만 당신은 여전히 마을 아이들의 우상입니다. ", choice: [Choice(choiceText: "그렇군요! 또 뭐 없나요?", ability: [], abilityGive: true, health: 0,  mental: 0,  money: 0, needAbility: [],  nextPageIndex: 6)]),
                    Page(index: 2, storyText: "당신은 무척 사랑스럽고 많은 이들이 소중하게 여기는 아이였습니다. 이건 좀 좋게 말한 거구요, 솔직히 말하면 당신은 너무 순진해요. 누가 장난으로 실 없는 소리를 하기라도 하면 당신은 곧이곧대로 다 믿고 항상 속아넘어갔어요. 속인 사람이 미안할 정도로요. 당신의 그 순수함은 얼굴에 너무나도 정직하게 드러나서 숨길 수가 없어요. 그런데 말이죠, 그런 순진한 껍데기 안에 가려져 있는 당신의 “진짜 마음”이란 건.. 조금 다를 수도 있지 않을까요? 아님 말고요!", storyImage: nil, choice: [Choice(choiceText: "그렇군요! 또 뭐 없나요?", ability: [], abilityGive: true, health: 0,  mental: 0,  money: 0,  needAbility: [], nextPageIndex: 6)]),
                    Page(index: 3, storyText: "당신은 게임을 아주 좋아했어요! 뭐 이런 시대에 게임이라 해봤자 별거 없긴 하지만, 당신 실력이 무지 뛰어나서 동네 아이들은 물론이고 어른들마저도 당신을 이기진 못 했어요. \n당신은 장기나 체스, 포커 등 장르를 가리지 않고 게임이라면 두루 섭렵했답니다. 당신이 조금만 더 일찍 태어났으면 좋았을텐데! 페이커라고 알아요? 아무튼 그렇다구요!", storyImage: nil, choice: [Choice(choiceText: "그렇군요! 또 뭐 없나요?", ability: [], abilityGive: true, health: 0,  mental: 0,  money: 0,  needAbility: [], nextPageIndex: 6)]),
                    // 한번 쉬고
    Page(index: 4, storyText: "잠깐만요, 물 한잔만 마시고 마저 얘기해드릴게요. 이거 오랜만에 말을 많이 하려니까 힘드네요. 혹시 벌써 지루하거나 그런건 아니죠? 당신 얘기라구요, 당신 얘기. 어쨌거나, 어디까지 얘기했죠?", choice: [Choice(choiceText: "제가 어떤 사람인지 더 알려주세요.", ability: [], abilityGive: true, health: 0,  mental: 0,  money: 0, needAbility: [],  nextPageIndex: getRandomPageNumber(randomStartNum: 7, randomFinishNum: 9))]),
                    //두번째 능력 받는 페이지
    Page(index: 4, storyText: "아, 그리고 당신은 영어를 할 줄 알아요! 이 마을에도 아이들을 위한 학교는 있는데, 선생님께서 영어를 가르쳐야 하나 말아야 하나 무척 고민이 깊으셨다고 해요. 사실 한국 교육과정이란게 영어가 필수긴 한데, 수능도 토익도 없어진 마당에 영어를 꼭 가르쳐야 할까요? 그런데 우연히 당신이 큰 관심을 가지는 것을 보고 당신에게만 개인 과외를 해주셨죠. 쓸모 있는 지식인진 정말 모르겠네요. ", choice: [Choice(choiceText: "그나저나, 당신은 누구죠?", ability: [], abilityGive: true, health: 0,  mental: 0,  money: 0, needAbility: [], nextPageIndex: 10)]),
                        Page(index: 5, storyText: "아, 당신은 기계를 조립하는 것을 정말 좋아했어요. 어릴 때부터 로봇 장난감은 진작에 졸업하고 어른들이 사용하는 기계나 공구에 관심을 가지기 시작했어요. 당신에게 공대생 기질이 다분한 것 같군요!", choice: [Choice(choiceText: "그나저나, 당신은 누구죠?", ability: [], abilityGive: true, health: 0,  mental: 0,  money: 0,  needAbility: [], nextPageIndex: 10)]),
                        Page(index: 6, storyText: "아, 그리고 당신은 엄청 날렵해요. 산 속의 온갖 불친절한 환경도 그다지 문제가 되지 않죠. 또래에 비해 항상 더 빨리 달리고, 높이 뛰고, 가벼웠어요. 어른들이 당신은 산 속에서 뭘 만나도 무사히 살아돌아올거라 생각할 정도죠. \n술래잡기는 당신이 제일 좋아하는 놀이입니다.", choice: [Choice(choiceText: "그나저나, 당신은 누구죠?", ability: [], abilityGive: true, health: 0,  mental: 0,  money: 0,  needAbility: [], nextPageIndex: 10)]),
                    Page(index: 5, storyText: "저는 당신의 이야기의 이야기꾼이에요. 사실 지금부터 본격적인 이야기가 시작되거든요. 오늘은 당신의 18번째 생일인데, 심부름을 나갔다가 돌아오니 어찌 된 일인지 가족들이 아무도 보이지 않는군요.", storyImage: nil, choice: [Choice(choiceText: "서프라이즈 파티?", ability: [], abilityGive: true, health: 0,  mental: 0,  money: 0, needAbility: [], nextPageIndex: 11), Choice(choiceText: "저 이야기 알아요! 넘어가자구요.", ability: [], abilityGive: true, health: 0, mental: -1,  money: 0,  needAbility: [], nextPageIndex: 666)]),
    Page(index: 6, storyText: "당신은 들뜬 마음으로 집 곳곳을 돌아다니다가 헛간의 문을 열었습니다. 그런데 그곳에는… 이런!", choice: [Choice(choiceText: "엄마? 아빠?", ability: [], abilityGive: true, health: 0,  mental: -1,  money: 0, needAbility: [], nextPageIndex: 12)]),
    Page(index: 7, storyText: "정말로 가족들은 당신을 위한 서프라이즈 파티를 준비하고 있었던 같아 보입니다. 분명히 생일상도 차려져 있었구요. 그러나 당신보다 먼저 문을 열고 들어온 것은 어떤 악마 같은 자였음이 틀림 없습니다. 난장판이 된 헛간 안에 덩그러니 남겨져 있는 것은…. 총에 맞아 피투성이가 된 가족들의 시체뿐이었습니다.",storyImage: "parentsCorpse", choice: [Choice(choiceText: "다음", ability: [], abilityGive: true, health: 0, mental: 0, money: 0, needAbility: [],  nextPageIndex: 13)]),
    Page(index: 8, storyText: "이런 세상에서 사람 몇 명 죽는건 그다지 놀랄만한 일이 아닙니다만, 여태까지 평화롭던 이 마을에서 살인 사건이 일어났단 사실은 마을 사람 모두에게 충격을 안겨줬습니다. 그러나 목격자는커녕 총성조차 들은 사람이 없습니다. 특이한 점은 어머니가 평소 하고 계시던 십자가 목걸이가 사라졌다는 것뿐입니다.", choice: [Choice(choiceText: "다음", ability: [], abilityGive: true, health: 0, mental: 0, money: 0, needAbility: [],  nextPageIndex: 14)]),
    Page(index: 9, storyText: "슬픔, 분노, 그리고 두려움이 마을을 뒤덮었습니다. 범인을 색출해내고 마을을 지키기 위해서 자경대가 조직되었습니다. 모든 집들이 샅샅이 수색되었으며, 사람들이 이제 철문과 빗장을 달고 열쇠와 창을 만들기 시작했습니다. 학교는 문을 닫았고 아이들은 집 밖으로 나가는 것이 금지되었습니다.", choice: [Choice(choiceText: "나는...", ability: [], abilityGive: true, health: 0, mental: 0,  money: 0, needAbility: [],  nextPageIndex: 15)]),
    Page(index: 10, storyText: "쟁기는 칼이 되었고, 사람들은 겉으로는 괜찮은 척 하지만 속으로는 서로를 믿지 못했으며, 마을은 요새가 되어가고 있었습니다. 온화하던 부동산 아저씨는 도심으로 내려가 총을 구해야 한다고 말했고, 밤중에 마을을 떠나려고 곡식을 몰래 챙겨두던 청년이 붙잡혀 마을 회관 쪽방에 갇혔습니다.", choice: [Choice(choiceText: "나는 나가서 놈을 찾아낼거야.", ability: [], abilityGive: true, health: 0, mental: 0, money: 0, needAbility: [], nextPageIndex: 16)]),
                    Page(index: 11, storyText: "당신이 직접 마을을 떠나서 범인을 잡겠다고 했을 때, 마을 사람들은 저마다 복잡한 생각으로 가득찬 것 같아 보였습니다. 다들 밖은 위험한 것을 알지만, 선뜻 당신을 붙잡으려 하려는 이는 없습니다. 살인자는 아직도 당신을 노리고 있는 것은 아닐까요? 당신이 떠나면, 마을은 다시 불안에 떨지 않아도 되는 것 아닐까요? 짐을 들고 홀연히 서있는 당신에게 폐품업자 김 씨가 다가와 당신의 어깨를 붙잡고 말합니다. \"서울은 네가 생각했던 것보다 훨씬 더 끔찍하고 불친절할거다. 영문도 모른 채 다치고, 빼앗기고, 죽을 수도 있어. 너에게 불가능한 것을 요구할 수도 있고, 너가 약하다고 해서 봐주지도 않을거다. 그러니 살아남으려면 어떻게 쓸만한 것을 모으고, 능력을 길러라. 그리고 무엇보다, 다시 시작하는 걸 두려워하지 말거라\"", choice: [Choice(choiceText: "명심하겠습니다.", ability: [], abilityGive: false, health: 0,  mental: 0, money: 0, needAbility: [], nextPageIndex: 17)]),
    Page(index: 12, storyText: "마을 사람들에게 작별 인사를 마친 뒤, 당신은 생애 처음으로 철근과 콘크리트가 우거진 서울의 폐허를 향해 발걸음을 내딛었습니다. 복잡하고 무거운 마음도 크지만 호기심과 궁금증으로 가슴이 뛰는 것도 느껴집니다. \n지금부터 당신의 모험이 시작됩니다.",storyImage: "tutorialSeoulImage", choice: [Choice(choiceText: "좋아, 가보자!", ability: [.muscularStrength], abilityGive: true, health: 0, mental: 0, money: 0, needAbility: [], nextPageIndex: 666)])
    ]
var woodEP: [Page] = [

        Page(index: 1, storyText: "무너진 목자재 아래에 긴급 구호 물품 상자가 깔려 있는 것이 보입니다! 저것들만 치우면 꺼낼 수 있겠는데요, 생각보다 무거워 보여서 자칫 잘못했다간 허리만 나갈 것 같습니다. ", storyImage: nil, choice: [
            Choice(choiceText: "목자재를 치운다", ability: [], abilityGive: true, health: -1,  mental: 0,money: 0,  needAbility: [.muscularStrength], nextPageIndex: 1),
                  Choice(choiceText: "그냥 간다", ability: [], abilityGive: true, health: 0, mental: 0, money: 0,  needAbility: [],nextPageIndex: 2)
            ], endEpisodeNumber: 1),

        Page(index: 1, storyText: "목자재를 치워봅시다.", storyImage: nil, choice: [
               Choice(choiceText: "다음", ability: [], abilityGive: true, health: 0, mental: 0, money: 0, needAbility: [], nextPageIndex: 2)
               ], endEpisodeNumber: 666),
        Page(index: 1, storyText: "목재에 깔려있던 것은 바로..!", storyImage: nil, choice: [
               Choice(choiceText: "열쇠였습니다.", ability: [], abilityGive: true, health: 0, mental: 0, money: 0, needAbility: [], nextPageIndex: 3),
               Choice(choiceText: "금괴였습니다.", ability: [], abilityGive: true, health: 0, mental: 0, money: 3, needAbility: [], nextPageIndex: 4),
               Choice(choiceText: "벌레였습니다.", ability: [], abilityGive: true, health: 0, mental: 0, money: 0, needAbility: [], nextPageIndex: 5)], endEpisodeNumber: 0),
        Page(index: 0, storyText: "아쉽게도 깔려있던 그것은 열쇠가 아니었습니다.. 당신은 발걸음을 돌립니다.",  storyImage: nil, choice: [
               Choice(choiceText: "다음", ability: [], abilityGive: true, health: 0, mental: 0,  money: 0, needAbility: [], nextPageIndex: 666)
               ], endEpisodeNumber: 666),
        Page(index: 0, storyText: "세상에나! 깔려있던 그것은 다름아닌 금괴였습니다. 당신은 지갑을 가득히 채워 떠납니다.", storyImage: nil, choice: [
               Choice(choiceText: "다음", ability: [], abilityGive: true, health: 0, mental: 0,  money: 0, needAbility: [], nextPageIndex: 666)
               ], endEpisodeNumber: 666),
        Page(index: 0, storyText: "아쉽게도 깔려있던 그것은 벌레가 아니었습니다.. 당신은 발걸음을 돌립니다.", storyImage: nil, choice: [
               Choice(choiceText: "다음", ability: [], abilityGive: true, health: 0, mental: 0,  money: 0, needAbility: [], nextPageIndex: 666)
               ], endEpisodeNumber: 666),
           
           Page(index: 1, storyText: "당신은 발걸음을 돌립니다.", storyImage: nil, choice: [
               Choice(choiceText: "다음", ability: [], abilityGive: true, health: 0, mental: 0,  money: 0, needAbility: [], nextPageIndex: 666)
               ], endEpisodeNumber: 666)
   ]


var truckSaleEP: [Page] = [
    
    Page(index: 1, storyText: "당신은 길을 걷다가 파란 용달 트럭이 천천히 다가오는 것을 발견합니다. 트럭 짐칸엔 잡동사니가 가득 실려 있고, 활과 창으로 무장한 경호원 셋이 함께 타고 있습니다, 당신 앞에서 조수석 유리창이 내려가더니, 인상 좋은 남자 둘이 자신들을 서울역에서 온 상인이라고 소개하며 당신에게 가까이 와서 물건을 둘러보라고 합니다.", storyImage: nil, choice: [
            Choice(choiceText: "둘러본다", ability: [], abilityGive: true, health: 0,  mental: 0, money: 0,  needAbility: [], nextPageIndex: 1),
            Choice(choiceText: "그냥 간다", ability: [], abilityGive: true, health: 0,  mental: 0,  money: 0,  needAbility: [], nextPageIndex: 6)
    ], endEpisodeNumber: 0),
    
    //선택지 둘러본다
    Page(index: 1, storyText: "둘러보니 별로 쓸모 있어 보이는 물건은 많지 않습니다. \"마음껏 둘러보십시오. 물건은 매번 바뀌니 언제든 또 찾아주시고요.\"", storyImage: nil, choice: [
            Choice(choiceText: "살충제", ability: [.insecticide], abilityGive: true, health: 0,  mental: 0,  money: -1,  needAbility: [], nextPageIndex: 2),
            Choice(choiceText: "붕대와 부목", ability: [.bandage, .splint], abilityGive: true, health: 0,  mental: 0, money: -1,  needAbility: [], nextPageIndex: 3),
            Choice(choiceText: "<스피치로 승부하라>", ability: [.bookSpeech], abilityGive: true, health: 0,  mental: 0,  money: -1,  needAbility: [], nextPageIndex: 4),
            Choice(choiceText: "떠난다", ability: [], abilityGive: true, health: 0,  mental: 0, money: 0,  needAbility: [], nextPageIndex: 5)
    ], endEpisodeNumber: 0),
    
    Page(index: 1, storyText: "살충제를 구매했습니다.", storyImage: nil, choice: [
        Choice(choiceText: "다음", ability: [], abilityGive: true, health: 0,  mental: 0,  money: 0,  needAbility: [], nextPageIndex: 666)

    ], endEpisodeNumber: 0),
    
    Page(index: 1, storyText: "붕대와 부목을 구매했습니다.", storyImage: nil, choice: [
            Choice(choiceText: "다음", ability: [], abilityGive: true, health: 0,  mental: 0,  money: 0,  needAbility: [], nextPageIndex: 666)
    ], endEpisodeNumber: 0),
    
    Page(index: 1, storyText: "<스피치로 승부하라>를 구매했습니다", storyImage: nil, choice: [
            Choice(choiceText: "다음", ability: [], abilityGive: true, health: 0,  mental: 0,  money: 0,  needAbility: [], nextPageIndex: 666)
    ], endEpisodeNumber: 666),
    
    Page(index: 1, storyText: "여기엔 별로 살 만한 물건이 없는 듯 합니다. 당신은 물건을 구매하지 않고 트럭을 돌아섭니다.", storyImage: nil, choice: [
            Choice(choiceText: "다음", ability: [], abilityGive: true, health: 0,  mental: 0,  money: 0,  needAbility: [], nextPageIndex: 666)
    ], endEpisodeNumber: 666),
//선택지 그냥 간다
    Page(index: 1, storyText: "당신은 발걸음을 돌립니다.", storyImage: nil, choice: [
            Choice(choiceText: "다음", ability: [], abilityGive: true, health: 0, mental:0,  money: 0,  needAbility: [], nextPageIndex: 666)
    ], endEpisodeNumber: 666)
    
]

//let dyingEvent : [Page] = [Page(index: 1, storyText: "정신적 스트레스로 죽었다...", storyImage: nil, choice: Choice(choiceText: "다시 시작하기", ability: nil, abilityGive: false, health: nil, mental: nil, money: nil, needAbility: nil, nextPageIndex: nil), endEpisodeNumber: <#T##Int#>)]



