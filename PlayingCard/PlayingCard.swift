//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Mr.TF on 2020/3/13.
//  Copyright © 2020 Mr.TF. All rights reserved.
//

import Foundation
struct PlayingCard:CustomDebugStringConvertible{
    var debugDescription: String
    {
        return "\(suit)  \(rank)"
    }
    var suit:Suit
    var rank:Rank
    init(suit:Suit,rank:Rank)
    {
        self.suit=suit
        self.rank=rank
    }
    enum Suit:String,CustomDebugStringConvertible {
        var debugDescription: String
        {
            return rawValue
        }
        
       case spades="♠️"
       case hearts="❤️"
       case clubs="♣️"
       case diamonds="♦️"
       static var all:[Suit]=[Suit.spades,.hearts,.clubs,.diamonds]
       
    }
    enum Rank:CustomDebugStringConvertible
    {
        case ace
        case face(String)
        case numeric(Int)
        
        var order:Int
        {
            switch self {
            case.ace:return 1
            case.numeric(let pips):return pips
            case.face(let kind) where kind=="J":return 11
            case.face(let kind) where kind=="Q":return 12
            case.face(let kind) where kind=="K":return 13
            default:return 0
            }
        }
        static var all:[Rank]
        {
            var allRanks=[Rank.ace]
            for pips in 2...10
            {
                allRanks.append(Rank.numeric(pips))
            }
            allRanks += [Rank.face("J"),.face("Q"),.face("K")]
            return allRanks
        }
        var debugDescription: String
        {
            switch self {
            case .ace:
                return "A"
            case.numeric(let pips):
                return String(pips)
            case.face(let kind):
                return kind
            default:
                return "0"
            }
        }
        
    }
}
