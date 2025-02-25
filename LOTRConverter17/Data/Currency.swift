//
//  Currency.swift
//  LOTRConverter17
//
//  Created by Paul F on 04/11/24.
//

import SwiftUI
// Haremos un model de Currency con el enum


/*
   V-19,Step 1.46,CaseIterable es una colección de los valores para el Foreach.
   Step 1.48,le ponemos Identifiable, que es como un id.
*/
enum Currency: Double, CaseIterable, Identifiable {
    
    // V-17, Step 1.42,Ponemos el valor de las monedas de acuerdo a la información.
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    
    //V-18,Step 1.43 (computer-property),ponemos un switch para que obtenga todas las imágenes.
    var image: ImageResource{
        /*
           Step 1.44,El switch debe buscar todos los casos que hemos marcado
           anteriormente y el default se usa cuando queramos parar.
        */
        switch self{
          case .copperPenny:
                  //Esto corresponde a la imágen que tenemos en asset.
                  .copperpenny
          case .silverPenny:
                  .silverpenny
          case .silverPiece:
                  .silverpiece
          case .goldPenny:
                  .goldpenny
          case .goldPiece:
                  .goldpiece
        }
    }
    
    //Step 1.45,ahora hacemos lo mismo con el nombre con el switch.
    var name : String {
        switch self {
          case .copperPenny:
              "Copper Penny"
          case .silverPenny:
              "Silver Penny"
          case .silverPiece:
              "Silver Piece"
          case . goldPenny:
              "Gold Penny"
          case .goldPiece:
              "Gold Piece"
        }
    }
    
    
    /*
      Step 1.49,ponemos el id,debe ir para no marcar error con el Identifiable.
      self es cada uno de los casos.
    */
    var id: Currency {self}
    
    
    /*
        V-23, Step 1.67, creamos una función para cuando el usuario ponga un número
        lo convertamos,ponemos nuestros párametros y espera un string ->
        V-24, Step 1.68 (_) es el argumento y amountString es el párametro ,hacemos esto para
        que sea más facil de elegir.
    */
    func convert(_ amountString: String, to currency: Currency) -> String{
        /*Primero convertimos lo que nos den a un doble ,
        guard intenta hacer esto but si falla haz algo más.*/
        guard let doubleAmount = Double(amountString) else{
            //y si el usuario pone otra cosa regresa "", vacio.
            return ""
        }
        //Si pone un numero, entonces: self ,dividete en ti mismo, raw values dobles.
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        //Regresa el valor y cortale los decimales.
        return String(format: "%.2f", convertedAmount)
    }
    
    
    
}
