//
//  CardFlipViewController.swift
//  Tarot
//
//  Created by APPLE on 2020/11/23.
//

import UIKit



class CardFlipViewController: UIViewController {

    
    
    @IBOutlet weak var targetCard: UIButton!
    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var cardShortDescription: UILabel!
    
    var firstReveal:Bool
    var isOpen:Bool = false
    var cardInfo:CardInfo
    var isCollapse = false
    var shortDescriptionStr = ""
    
    
    init?(coder:NSCoder,cardInfo:CardInfo,firstReveal:Bool) {
        
        self.cardInfo = cardInfo
        self.firstReveal = firstReveal
        if !firstReveal {
            isOpen = true
        }
        super.init(coder: coder)
    }
    
    
    required init?(coder: NSCoder) {
          fatalError()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isOpen {
            setOpenCardUI()
        }else{
            setUnopenCardUI()
        }
        
    }
    
    

    func setUnopenCardUI() {
        cardNameLabel.text = "請翻開你挑中的卡片"
    }
    
    func setOpenCardUI() {
        setCardDirection(targetCardBtn: targetCard, isReversed: cardInfo.isReversed)
        if cardInfo.isReversed {
            shortDescriptionStr = cardInfo.pickedCard.reversed
        }else{
            shortDescriptionStr = cardInfo.pickedCard.upright
        }
        cardNameLabel.text = cardInfo.pickedCard.cardName
        isOpen = true
        cardShortDescription.text = shortDescriptionStr
        cardNameLabel.isHidden = false
        cardShortDescription.isHidden = false
        let image = cardInfo.pickedCard.cardImg
        
        targetCard.setImage(image, for: .normal)
        UIView.transition(with: targetCard, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
        
    }
    
    func updateCardCollapsedUI(){
        if isCollapse {
            isCollapse = false
            targetCard.transform = CGAffineTransform.identity
            cardShortDescription.text = shortDescriptionStr
        }else{
            isCollapse = true
            let frame = targetCard.frame
            targetCard.transform = CGAffineTransform.identity.translatedBy(x: frame.size.width*0.01, y: -frame.size.height*0.2).scaledBy(x: 0.6, y: 0.6)
            cardShortDescription.text = cardInfo.pickedCard.cardDetail
        }
        
    }
    


    @IBAction func cardTouched(_ sender: Any) {
        if isOpen {
            updateCardCollapsedUI()
        }else{
            setOpenCardUI()
        }
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
