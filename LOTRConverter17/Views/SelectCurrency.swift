//
//  SelectCurrency.swift
//  LOTRConverter17
//
//  Created by Paul F on 04/11/24.
//

import SwiftUI
//V-15, creamos el archivo SelectCurrency
struct SelectCurrency: View {
    //Step 1.38,propiedad para poder cerrar el botón
    @Environment(\.dismiss) var dismiss
    /*
      V-20,Step 1.52,monedas seleccionadas por defecto "topCurrency".
      Step 1.58, le ponemos Binding ,alguien más decidirá por ti el valor
    */
    @Binding var topCurrency : Currency
    //V-22,Step 1.64, ponemos el binding
    @Binding var bottomCurrency: Currency
    
    
    var body: some View {
        //Step 1.32
        ZStack{
            //Step 1.33
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                //Step 1.34,Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                /*
                  Currency icons
                  V-21, Step 1.56, le ponemos el IconGrid
                 ponemos el binding
                */
                IconGrid(currency: $topCurrency)
                
                //Step 1.35,Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top)
                
                /*
                  Currency icons
                  V-21, Step 1.57, le ponemos el IconGrid
                */
                IconGrid(currency: $bottomCurrency)
                
                //Step 1.37,Done button
                Button("Done"){
                    //Step 1.39
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            //Step 1.36
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    //V-20,Monedas seleccionadas, con el el select currency
    //Step 1.65,ponemos el .constant, cuando ponemos el binding
    SelectCurrency(topCurrency: .constant(.copperPenny), bottomCurrency: .constant(.silverPiece))
}
