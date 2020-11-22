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
    
    var isOpen = false
    var pickedCard = drawCard()
    var isCollapse = false
    let cardPosition = isUpright()
    var shortDescriptionStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardNameLabel.text = "請翻開你挑中的卡片"
        if cardPosition {
            shortDescriptionStr = pickedCard.upright
        }else{
            shortDescriptionStr = pickedCard.reversed
        }
        cardShortDescription.text = shortDescriptionStr
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func cardTouched(_ sender: Any) {
        
        
        
        
        if isOpen {
            
            if isCollapse {
                isCollapse = false
                targetCard.transform = CGAffineTransform.identity
                setCardDirection()
                cardShortDescription.text = shortDescriptionStr
            }else{
                
                isCollapse = true
                let frame = targetCard.frame
                targetCard.transform = CGAffineTransform.identity.translatedBy(x: frame.size.width*0.01, y: -frame.size.height*0.2).scaledBy(x: 0.6, y: 0.6)
                cardShortDescription.text = pickedCard.cardDetail
            }
            
        }else{
            cardNameLabel.text = pickedCard.cardName
            isOpen = true
            cardNameLabel.isHidden = false
            cardShortDescription.isHidden = false
            setCardDirection()
            let image = pickedCard.cardImg
            
            targetCard.setImage(image, for: .normal)
            UIView.transition(with: targetCard, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
        
    }
    
    func setCardDirection(){
        if !cardPosition {
            
            targetCard.imageView?.transform = CGAffineTransform.identity.scaledBy(x: 1, y: -1)
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
