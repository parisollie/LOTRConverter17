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
    //V-11-Step 1.12,para que el user pueda escribir en el textfield.
    @State var leftAmount = ""
    @State var rightAmount = ""
    //Step 59,le damos valores por defecto.
    @State var leftCurrency: Currency = .silverPenny
    @State var rightCurrency: Currency = .goldPiece
    //Step 60,para poder seleccionar la moneda
    @State var showSelectCurrency = false
    //Step 73,focus , nos dice donde queremos poner el focus cuando escribamos algo.
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    //Step 82
    let currencyTip = CurrencyTip()
    
    var body: some View {
        /*----------------------------------------------------*/
        //En el V-8,ponemos la estructura de la app
        ZStack{
            //V-9_ Step 1 ,Background image
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
                        //Vid 21,step 61, le add el onTap,para poder cambiar las monedas
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            //step 85
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        //Step 83
                        .popoverTip(CurrencyTip(),arrowEdge: .bottom)
                        
                        //Step 1.13,Text field y le ponemos el binding con el ($)
                        TextField("Amount",text: $leftAmount)
                            //con este aparece el color blanco del Texfield
                            .textFieldStyle(.roundedBorder)
                             //Step 74,para poner el foco
                            .focused($leftTyping)
                            //Vid 24-Step 69,observa la propiedad que queremos cambiar
                            .onChange(of: leftAmount){
                                //step 75, si ponemos el foco en
                                if leftTyping == true {
                                    //Step 70
                                    rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                                }
                            }
                          
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
                        //Step 62
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            //step 85
                            currencyTip.invalidate(reason: .actionPerformed)
                            
                        }
                        
                        //Step 1.14,Text field
                        TextField("Amount",text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            //la palabra "Amount se irá a ➡️"
                            .multilineTextAlignment(.trailing)
                            //Step 76
                            .focused($rightTyping)
                            //Step 71
                            .onChange(of: rightAmount){
                                //Step 77
                                if rightTyping {
                                    //Step 72
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
                //Vid 80,para poner el teclado en decimales
                .keyboardType(.decimalPad)
                //El spacer empuja todo hacia arriba ⬆️ en VStack
                Spacer ()
                /*----------------------------------------------------*/
                
                /*Como el botón en nuestro diseño esta en la esquina inferior derecha ponemos un
                Hstack para que podemos empujarlo con el spacer*/
                HStack {
                    //El spacer empujará todo hacia ➡️
                    Spacer()
                    //V_10 - Step 1.9, Info button
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
                    
                    //Vid 14,Step 27, le damos click para que nos muestre la ventana "ExchangeInfo"
                    
                    //Vid 14,Step 27,No importa donde se ponga el modifier no cambia,puede ser en cualquier parte del código
                    .sheet(isPresented: $showExchangeInfo){
                        //Mandamos a llamar a nuestra vista 
                        ExchangeInfo()
                    }
                }
            }
            .border(.green)
            //Step 83
            .task{
                try? Tips.configure()
            }
            //Vid 25- step 78
            .onChange(of: leftCurrency){
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
            //step 79
            .onChange(of: rightCurrency){
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
            //step 63, necesitamo solo un modifier para las dos monedas,recordar no importa donde se ponga este pedazo de código.
            //Step 66, le ponemos el binding
            .sheet(isPresented: $showSelectCurrency){
                SelectCurrency(topCurrency:$leftCurrency,bottomCurrency: $rightCurrency)
            }
        }
    }
}

#Preview {
    ContentView()
}
