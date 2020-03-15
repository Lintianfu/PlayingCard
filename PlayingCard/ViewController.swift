//
//  ViewController.swift
//  PlayingCard
//
//  Created by Mr.TF on 2020/3/13.
//  Copyright © 2020 Mr.TF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var deck=PlayingCardDeck()
    
    @IBOutlet var cardViews: [PlayingCardView]!
    @IBOutlet weak var PlayingCardView: PlayingCardView!
    {
        didSet{
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction=[.left,.right]
            PlayingCardView.addGestureRecognizer(swipe)
        
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var cards = [PlayingCard]()
               for _ in 1...((cardViews.count+1)/2) {
                   let card = deck.draw()!
                   cards += [card, card]
               }
               for cardView in cardViews {
                   cardView.isFaceUP = true
                   let card = cards.remove(at: cards.count.arc4random)
                   cardView.rank = card.rank.order
                   cardView.suit = card.suit.rawValue
                cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(flipCard(_:))))
                  // cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(flipCard(_:))))
                  // cardBehavior.addItem(cardView)
               }
    
        
        // Do any additional setup after loading the view.
    }
    @objc func nextCard()
    {
        if let card=deck.draw()
        {
            PlayingCardView.rank=card.rank.order
            PlayingCardView.suit=card.suit.rawValue
            
        }
    }
    @objc func flipCard(_ recognizer:UITapGestureRecognizer)
    {
        
    }
    //@IBAction func flipCards(_ sender: Any) {
       // PlayingCardView.isFaceUP = !PlayingCardView.isFaceUP
    //}
}

