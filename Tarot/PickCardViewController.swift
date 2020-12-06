//
//  PickCardViewController.swift
//  Tarot
//
//  Created by APPLE on 2020/12/1.
//

import UIKit

struct CardInfo {
    var pickedCard:TaroCard
    var isReversed:Bool
}

class PickCardViewController: UIViewController {

    struct CardBtn {
        var cardBtn:UIButton
        var cardInfo:CardInfo!
        var didPick:Bool = false
    }
    
    enum TimeLine {
        case Timeline_Past
        case TimeLine_Present
        case TimeLine_Future
    }
    
    
    @IBOutlet weak var pastCardBtn: UIButton!
    @IBOutlet weak var presentCardBtn: UIButton!
    @IBOutlet weak var futureCardBtn: UIButton!
    
    var pastCard:CardBtn!
    var presentCard:CardBtn!
    var futureCard:CardBtn!
    
    
    //MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let cards = [pastCard,presentCard,futureCard]
        
        for card in cards {
            if let targetCard = card {
                if targetCard.cardInfo != nil {
                    cardUpdateUI(targetCard.cardBtn, isFlip: targetCard.didPick, chosenCard: targetCard.cardInfo.pickedCard, isReversed: targetCard.cardInfo.isReversed)
                }
            }
            
        }
    }
    
    //MARK: - PrepareData
    func prepareData() {
        pastCard = CardBtn(cardBtn: pastCardBtn)
        presentCard = CardBtn(cardBtn: presentCardBtn)
        futureCard = CardBtn(cardBtn: futureCardBtn)
    }
    
    //MARK: - UI Update
    
    func cardUpdateUI(_ cardBtn:UIButton,isFlip:Bool, chosenCard:TaroCard?,isReversed:Bool){
        if let targetCard = chosenCard {
            if isFlip {
                cardBtn.setImage(targetCard.cardImg, for: UIControl.State.normal)
                setCardDirection(targetCardBtn: cardBtn, isReversed: isReversed)
//                UIView.transition(with: cardBtn, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
            }
        }
        
        
    }
    
    func cardToCardInfo(card:CardBtn)-> CardInfo{
        
        return CardInfo(pickedCard: card.cardInfo.pickedCard, isReversed: card.cardInfo.isReversed)
    }
    
    func pickCard() -> CardInfo  {
        return CardInfo(pickedCard: drawCard(), isReversed: isReversed())
    }
    
    func cardBtnDataUpdate(timeLine:TimeLine,cardInfo:CardInfo){
        
        switch timeLine {
            case .Timeline_Past:
                pastCard.cardInfo = cardInfo
                break
            case .TimeLine_Present:
                presentCard.cardInfo = cardInfo
                break
            case .TimeLine_Future:
                futureCard.cardInfo = cardInfo
                break
        }
    }
    
    //MARK: - Action
    
    @IBAction func passCardDidPressed(_ sender: Any) {
        if (!pastCard.didPick) {
            
            let cardInfo = pickCard()
            pastCard.didPick = true
            
            pastCard.cardInfo = cardInfo
            cardUpdateUI(pastCard.cardBtn, isFlip: pastCard.didPick, chosenCard: cardInfo.pickedCard, isReversed: cardInfo.isReversed)
        }
    }
    
    @IBSegueAction func passPressed(_ coder: NSCoder) -> CardFlipViewController? {
        var firstRevel:Bool = false
        if (!pastCard.didPick){
        
            firstRevel = true
            
            pastCard.cardInfo = pickCard()
            pastCard.didPick = true

        }
        return CardFlipViewController(coder: coder, cardInfo: pastCard.cardInfo, firstReveal: firstRevel)
    
    }
    


    
    
    
    @IBSegueAction func presentPressed(_ coder: NSCoder) -> CardFlipViewController? {
        var firstRevel:Bool = false
        if (!presentCard.didPick){
        
            firstRevel = true
            
            presentCard.cardInfo = pickCard()
            presentCard.didPick = true

        }
        return CardFlipViewController(coder: coder, cardInfo: presentCard.cardInfo, firstReveal: firstRevel)
    }
    @IBSegueAction func futurePressed(_ coder: NSCoder) -> CardFlipViewController? {
        var firstRevel:Bool = false
        if (!futureCard.didPick){
        
            firstRevel = true
            
            futureCard.cardInfo = pickCard()
            futureCard.didPick = true

        }
        return CardFlipViewController(coder: coder, cardInfo: futureCard.cardInfo, firstReveal: firstRevel)
    }
    
    @IBAction func resetBtnPressed(_ sender: Any) {
        let cards = [pastCard,presentCard,futureCard]
        
        for card in cards {
            if let targetCard = card {
                if (targetCard.didPick) {
                    
                    targetCard.cardBtn.setImage(UIImage(named: "card_back"), for: UIControl.State.normal)
                    UIView.transition(with: targetCard.cardBtn, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
                }
            }
        }
        prepareData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
