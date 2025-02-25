//
//  IconGrid.swift
//  LOTRConverter17
//
//  Created by Paul F on 04/11/24.
//

import SwiftUI

struct IconGrid: View {
    //Variable para cambiar el cuadrito seleccionado
    //Step 55, ponemos binding
    //Step 67, ponemos el bidning
    @Binding var currency : Currency
    
    var body: some View {
        //V-16,Step 1.41 ,Currency icons, necesitamos 3 columnas
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]){
            /*
             Ponemos un Foreach para recorrer cada unode las monedas
             V-19,yo le puse "currency",pero por lo regular es:  _
            Step 47,Currency.allCase ,pongo esto para que itere todo.*/
            ForEach(Currency.allCases){ currency in
                //Step 53,con self le decimos que queremos el nombre de la variable ,no del currency del Foreach
                if self.currency == currency{
                    
                    //Step 50, accedemos a los valores de image y name.CurrencyIcon es una vista.
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        //V-20,Step 51,agregamos modifiers
                        .shadow(color: .black, radius: 10)
                        //es el cuadrado negro
                        .overlay{
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                //V-20,Step 54,con el else, apareceran las monedas que no esten seleccionadas
                }else{
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                    //Step 55,onTapGesture con esto podemos seleccionar cualquier moneda
                        .onTapGesture{
                            self.currency = currency
                        }
                }
            }
        }
    }
}

#Preview {
    IconGrid(currency: .constant(.silverPiece))
}
