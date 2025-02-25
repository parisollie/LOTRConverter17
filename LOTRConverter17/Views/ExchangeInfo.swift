//
//  ExchangeInfo.swift
//  LOTRConverter17
//
//  Created by Paul F on 04/11/24.
//

import SwiftUI

struct ExchangeInfo: View {
    /*Step 1.30,propiedad para poder cerrar el boton
    var cambiara el valor por eso var*/
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            //Creamos nuestra nueva vista
            //V-12 Step 1.17, Background parchment image.
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                // Step 1.18,Title text
                Text("Exchange Rates")
                    .font(.largeTitle)
                    //añade espacio en las letras
                    .tracking(3)
                
                // Step 1.19 Description text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                
                // Step 1.28,llamamos a nuestra vista "Exchange rates",y ahora podemos usar multiples instancias.
                ExchangeRate(leftImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
                ExchangeRate(leftImage: .goldpenny, text: "1 Gold Penny = 4 Silver Pieces", rightImage: .silverpiece)
                ExchangeRate(leftImage: .silverpiece, text: "1 Silver Piece = 4 Silver pennies", rightImage: .silverpenny)
                ExchangeRate(leftImage: .silverpenny, text: "1 Silver Penny = 100 Copper Pennies", rightImage: .copperpenny)
                
                //-Step 1.23, Done button
                Button("Done"){
                    //Step 1.31, cerramos el botón
                    dismiss()
                }
                //Se nos encierra el botn en una caja
                .buttonStyle(.borderedProminent)
                //se cambia de color la caja
                //.tint(.brown)
                //usando dos colores
                .tint(.brown.mix(with: .black, by: 0.2))
                //el texto
                .font(.largeTitle)
                .padding()
                //color de letras en color blanco
                .foregroundStyle(.white)
            }
            //Step 1.24, cambiamos todo el texto a negro para que se vea bien en el modo oscuro
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}


