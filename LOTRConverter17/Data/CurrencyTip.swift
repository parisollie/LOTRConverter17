//
//  CurrencyTip.swift
//  LOTRConverter17
//
//  Created by Paul F on 05/11/24.
//

import Foundation
import TipKit
//Vid 26,step 81
struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can tap the left or right currency to bring up the Select Currency screen.")
    
    var image:Image? = Image(systemName: "hand.tap.fill")
}
