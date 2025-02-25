//
//  CurrencyTip.swift
//  LOTRConverter17
//
//  Created by Paul F on 05/11/24.
//

import Foundation
import TipKit
//V-26,Step 1.77
struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can tap the left or right currency to bring up the Select Currency screen.")
    
    var image:Image? = Image(systemName: "hand.tap.fill")
}
