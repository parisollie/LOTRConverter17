//
//  CurrencyIcon.swift
//  LOTRConverter17
//
//  Created by Paul F on 04/11/24.
//

import SwiftUI

struct CurrencyIcon: View {

    let currencyImage: ImageResource
    let currencyName: String
    
    var body: some View {
        //V-15,Step 1.40,Currency icons, diseñamos una moneda
        ZStack(alignment: .bottom){
            // Currency Image
            Image(currencyImage)
                .resizable()
                .scaledToFit()
           
            //Currency name
            Text(currencyName)
                .padding(3)
                .font(.caption)
                //el padre vale 100, el padre es Ztsack
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100,height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(currencyImage: .goldpiece, currencyName: "Gold Piece")
}
