//
//  Currency.swift
//  LOTRConverter17
//
//  Created by Paul F on 04/11/24.
//

import SwiftUI
//V-19,Step 46,CaseIterable es una colección.
//Step 48,Identifiable
enum Currency: Double, CaseIterable, Identifiable {
    // V-17, Step 42,Ponemos el valor de las monedas de acuerdo a la informacion
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    //Step 49,ponemos el id,debe ir para no marcar error el Identifiable.
    //self es cada uno de los casos.
    var id: Currency {self}
    
    //V-18,Step 43 (computer-property),ponemos un switch para que obtenga todas las imágenes
    var image: ImageResource{
        /*Step 44,El switch debe buscar todos los casos que hemos marcado anteriormente y el default se usa cuando
            queramos parar */
        switch self{
          case .copperPenny:
                  //esto corresponde a la imágen que tenemos en asset
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
    //Step 45,ahora hacemos lo mismo con el nombre con el switch.
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
    
    //V-23, Step 67, creamos una funcion ,ponemos nuestros párametros y espera un string ->
    //Step 70 _ es el argumento y amountString es el parametro ,hacemos esto para que sea mas facil de elegir
    func convert(_ amountString: String, to currency: Currency) -> String{
        //Primero convertimos lo que nos den a un doble ,y si el usuario pone otra cosa regresa ""
        //guard ,intenta hacer esto but si falla haz algo más
        guard let doubleAmount = Double(amountString) else{
            return ""
        }
        //self ,dividite en ti mismo
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        //Regresa el valor y cortale los decimales 
        return String(format: "%.2f", convertedAmount)
    }
}
