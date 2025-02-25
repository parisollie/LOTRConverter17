//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Paul F on 03/11/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    /*
    let - la propiedad no cambia
    var - la porpiedad puede cambiar
    */
    
    //Step 1.10,State hace que podamos cambiar la variable de false a true dentro del body.
    @State var showExchangeInfo = false
    //V-11 Step 1.12,para que el user pueda escribir en el textfield.
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    /*
      V-21,Step 1.59,le damos valores por defecto para que sean los
      primeros en aperecer en nuestra pantalla.
     */
    @State var leftCurrency: Currency = .silverPenny
    @State var rightCurrency: Currency = .goldPiece
    
    //Step 1.60,para poder seleccionar la moneda
    @State var showSelectCurrency = false
    
    /*
     Step 1.70 focus, nos dice donde queremos poner el focus
     cuando escribamos algo.
    */
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    //V-26,Step 1.78
    let currencyTip = CurrencyTip()
    
    var body: some View {
        /*----------------------------------------------------*/
        //En el V-8,ponemos la estructura de la app
        ZStack{
            //V-9, Step 1 ,Background image
            Image(.background)
                //Es para hacer la imagen mas pequeña
                .resizable()
                .ignoresSafeArea()
            /*----------------------------------------------------*/
            VStack{
                //Step 1.2,Prancing pony image
                Image(.prancingpony)
                    .resizable()
                    //con este modifier no se modifica la imagen: .scaledToFit()
                    .scaledToFit()
                    //Le ponemos un tamaño
                    .frame(height: 300)
                
                
                //Step 1.3,Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                /*----------------------------------------------------*/
                // Currency conversion section
                HStack{
                    /*----------------------------------------------------*/
                    // Left conversion section
                    VStack{
                        /*----------------------------------------------------*/
                        // Currency
                        HStack{
                            //Step 1.4, Curency image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //Step 1.5, Currency text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                                //es un efecto
                                .symbolEffect(.pulse)
                        }
                        /*
                         Step 1.15,agregamos un padding para que se acerque las etiquetas de Amount a
                        las monedas */
                        .padding(.bottom,-5)
                        //Step 1.61, le add el onTap,para poder cambiar las monedas
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            //Step 1.81
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        //Step 1.79
                        .popoverTip(CurrencyTip(),arrowEdge: .bottom)
                        
                        //Step 1.13,Text field y le ponemos el binding con el ($)
                        TextField("Amount",text: $leftAmount)
                            //con este aparece el color blanco del Texfield
                            .textFieldStyle(.roundedBorder)
                             //Step 1.71,para poner el foco
                            .focused($leftTyping)
                            //observa la propiedad que queremos cambiar
                            .onChange(of: leftAmount){
                                //Step 1.72, si ponemos el foco en
                                if leftTyping == true {
                                    //Step 1.69
                                    rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                                }
                            }
                        //Step 1.76
                           //.keyboardType(.decimalPad)
                    }
                    .border(.green)
                    
                    //Step 1.6,Equal sign- SF SYMBOLS
                    Image(systemName: "equal")
                         //Para símbolos podemos usar las propiedades de Texto e imagén
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        //le ponemos una animacion
                        .symbolEffect(.pulse)
                    /*--------------------------------------------------------*/
                    // Right conversion section
                    VStack{
                        // Currency
                        /*----------------------------------------------------*/
                        HStack{
                            // Curency text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            //Step 1.7, Curency image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        //Step 14,agregamos un padding para que se acerque
                        .padding(.bottom,-5)
                        //Step 1.62, para cambiar las monedas
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            //Step 1.82.
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        
                        //Step 1.14,Text field
                        TextField("Amount",text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            //la palabra "Amount se irá a ➡️"
                            .multilineTextAlignment(.trailing)
                            //Step 1.73, hacemos una copia de los pasos anteriores.
                            .focused($rightTyping)
                            .onChange(of: rightAmount){
                                if rightTyping {
                                    leftAmount = rightCurrency.convert(rightAmount,to : leftCurrency)
                                }
                            }
                            //.keyboardType(.decimalPad)
                    }
                }
                .border(.red)
                //Step 1.16,agregamos el padding
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                //V-80,para poner el teclado en decimales
                .keyboardType(.decimalPad)
                //El spacer empuja todo hacia arriba ⬆️ en VStack
                Spacer ()
                /*----------------------------------------------------*/
                
                /*Como el botón en nuestro diseño esta en la esquina inferior derecha ponemos un
                Hstack para que podemos empujarlo con el spacer*/
                HStack {
                    //El spacer empujará todo hacia ➡️
                    Spacer()
                    //V-10 ,Step 1.9, Info button
                    Button{
                        //Step 1.11 ,toggle cambia la propiedad de false a true al dar click.
                        showExchangeInfo.toggle()
                        print("showExchangeInfo value: \(showExchangeInfo)")
                        
                    }label:{
                        //Step 1.8
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    //esto mueve hacia a la izquierda ⬅️ desde la esquina del botón de ⓘ
                    .padding(.trailing)
                    
                    /*V-14,Step 1.29, le damos click para que nos muestre la ventana "ExchangeInfo",No importa donde se ponga el modifier no cambia,puede ser en cualquier parte del código*/
                    .sheet(isPresented: $showExchangeInfo){
                        //Mandamos a llamar a nuestra vista 
                        ExchangeInfo()
                    }
                }
            }
            .border(.green)
            //V-26,Step 1.80,para cuando aparezca por primera vez
            .task{
                try? Tips.configure()
            }
            //V-25,Step 1.74
            .onChange(of: leftCurrency){
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
            //Step 1.75
            .onChange(of: rightCurrency){
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
            /*
              Step 1.63, necesitamos solo un modifier para las dos monedas,
              recordar no importa donde se ponga este pedazo de código.
              V-22,Step 1.66, le ponemos el binding
            */
            .sheet(isPresented: $showSelectCurrency){
                SelectCurrency(topCurrency:$leftCurrency,bottomCurrency: $rightCurrency)
            }
        }
    }
}

#Preview {
    ContentView()
}
