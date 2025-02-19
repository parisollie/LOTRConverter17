//
//  SelectCurrency.swift
//  LOTRConverter17
//
//  Created by Paul F on 04/11/24.
//

import SwiftUI
//Vid 15
struct SelectCurrency: View {
    //Step 38,propiedad para poder cerrar el botón
    @Environment(\.dismiss) var dismiss
    //Step 52,monedas seleccionadas por defecto.
    //Step 58, le ponemos Binding ,alguien más decidirá por ti el valor
    //Step 64, ponemos el binding
    @Binding var topCurrency : Currency
    @Binding var bottomCurrency: Currency
    
    
    var body: some View {
        ZStack{
            //Step 30
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                //Step 31,Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                //Currency icons
                //Vid 21, step 56
                //Step 68, ponemos el binding
                IconGrid(currency: $topCurrency)
                
                //Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top)
                
                //Currency icons
                //Step 57
                //Step 68, ponemos el binding
                IconGrid(currency: $bottomCurrency)
                
                //Done button
                Button("Done"){
                    //step 39
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            //Step 37
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    //step 53, monedas seleccionadas
    //Step 65,ponemos el .constant, cuando ponemos el binding
    SelectCurrency(topCurrency: .constant(.copperPenny), bottomCurrency: .constant(.silverPiece))
}
