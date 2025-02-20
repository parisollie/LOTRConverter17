//
//  ExchangeRate.swift
//  LOTRConverter17
//
//  Created by Paul F on 04/11/24.
//

import SwiftUI

//V-13 Step 1.25 ,creamos una nueva vista para poder repetirlo mas veces
struct ExchangeRate: View {
    /*Step 1.26, ponemos la estructura para que se pueda repetir más veces
    debemos usar let ,porque no va a cambiar*/
    
    let leftImage: ImageResource
    let text: String
    let rightImage: ImageResource
    
    var body: some View {
        //Step 1.20
        HStack{
            // Left currency image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            //Step 1.21 Exchange rate text
            Text(text)
            
            //Step 1.22,Right currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    //Step 1.27, le pasamos un ejemplo con lo que declaramos
    ExchangeRate(leftImage: .silverpiece, text: " 1 Silver Piece = 4 Silver pennies", rightImage: .silverpenny)
}
