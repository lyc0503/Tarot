//
//  TaroCard.swift
//  Tarot
//
//  Created by APPLE on 2020/11/23.
//

import Foundation
import UIKit

struct TaroCard {
    var cardNum:Int
    var cardName:String
    var upright:String
    var reversed:String
    var cardDetail:String
    var cardImg:UIImage?
}

func drawCard()->TaroCard{
    let range = 1...cardArray.count
    let cardNum = Int.random(in: range)
    return cardArray[cardNum-1];
}

func isUpright()->Bool{
    let boolNum = Int.random(in: 0...1)
    if Bool(truncating: boolNum as NSNumber) {
        NSLog("正位")
    }else{
        NSLog("逆位")
    }
    return Bool(truncating: boolNum as NSNumber)
}

let fool:TaroCard = TaroCard(cardNum: 0, cardName: "愚者", upright: "從零開始；好賭運；不墨守成規；追求新奇的夢想；冒險；放浪形骸；藝術家的氣質；異於常人；直攻要害、盲點；愛情狩獵者；愛情歷經滄桑；不拘形式的自由戀愛", reversed: "不安定；孤注一擲會失敗；缺乏責任感；損失；腳跟站不穩；墮落；沒發展；沒計劃；走錯路；行為乖張；輕浮的戀情；感情忽冷忽熱；不安定的愛情之旅", cardDetail:"正立的牌，暗示一段活在當下或隨遇而安的時期。在愛情中，則意味著你可能遇到一位喜歡目前生活，而不想計劃將來的伴侶。也可能是在形容你的伴侶，他（她）是一個難以捉摸的天真的人，或者，是一位不願受到任何長期計劃與關係約束的人。倒立的牌，表示你想從承諾中脫身，其實還不是時機。惟有對自己的未來有所承諾，或是解決了過去的問題，才能重新過上充滿自發性的生活。你也許渴望自由，想要以往過去種種，但現在還不是適當的時機。有時它也代表，你沒有在關鍵時刻把握住機會，或太固執於以前的計劃，過分依賴別人的建議。愚者的倒立，代表著「時機是關鍵所在」。", cardImg: UIImage(named: "00"))

let magician:TaroCard = TaroCard(cardNum: 1, cardName: "魔法師", upright: "好的開始；具獨創性；有發展的；新計劃成功；想像力豐富或有好點子；有戀情發生；擁有默契良好的伴侶；有新戀人出現；值得效仿的對象出現", reversed: "失敗；優柔寡斷；才能平庸；有被欺詐的危險；技術不足；過於消極；沒有判斷力；缺乏創造力；愛情沒有進展；注意你的男朋友。", cardDetail: "正立的牌，代表富有外交手腕，精明幹練，在愛情上則代表在現實中遊刃有餘，外界環境限制不了你。它暗示一種主動的兩性關係，也可以代表一個意志強烈的人，它的心靈不會被謊言和假象迷惑，清楚自己要的是什麼，並向著自己的方向穩步前進。而且，他心胸寬大，可以接受新鮮事物。倒立的牌，表示毫無顧忌與投機心態。因為性格上的不切實際，帶來精神、情感或健康上的種種問題。它預示著漫無目的和缺乏自律，也暗示著某種精神或情緒上的困擾，離幻覺、精神分裂或精神崩潰都已經不遠了。他用強大的能力來追求自己的目標，並且不肯遵守公認的基本準則，也許會以逐漸毀掉對方的方式，對他人進行控制。倒立是一種極端的狀態，意味著喪失良知和反社會。", cardImg: UIImage(named: "1"))

let highPriestess:TaroCard = TaroCard(cardNum: 2, cardName: "女祭司", upright: "知性、優秀的判斷力；具洞察力及先見之明；強大的戰鬥意志；冷靜的統率力；學問、研究等精神方面幸運；獨立自主的女性；柏拉圖式的愛情；有心靈上交往至深的友人；冷淡的戀情", reversed: "無知、缺乏理解力；研究不足；不理性的態度；自我封閉；神經質；潔癖；與女性朋友爭執；對人冷淡；晚婚或獨身主義；沒有結果的單相思；氣色不好；不孕。", cardDetail: "正立的牌，顯示的是寧靜、直覺、含蓄及謹慎。你需要先「反求諸己」，通過被動的接受，得到內在的發展。在愛情上，它往往意味著擁有高度的精神默契和心靈發展的關係，你們兩人可以一起學習與成長。倒立的牌，表示詭異、猜疑、冷漠和遲緩。它暗示，在暫時離群索居，或經過內心發展之後，再度回到現實生活。出去走走吧！去認識新的朋友，也許可能因此而找到新的工作和伴侶，或者得到新的理解。", cardImg: UIImage(named: "2"))

let cardArray = [fool,magician,highPriestess]
