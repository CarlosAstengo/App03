//
//  ColorView.swift
//  App03-ListaColores
//
//  Created by Carlos Astengo Macias on 28/09/21.
//

import SwiftUI

struct ColorView: View {
    
    var color: Colour
    var pallete: String
    
    var body: some View {
        ZStack {
            color.colour
            VStack {
                Text(color.name)
                    .font(.largeTitle)
                    .foregroundColor(color.dark ? .white : .black)
                Text(pallete)
                    .font(.title)
                    .foregroundColor(color.dark ? .white : .black)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle("Color", displayMode: .inline)
            .navigationBarColor(UIColor(.black),UIColor(.white))
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text(color.name)
                        .font(.title)
                        .foregroundColor(.white)
                }
            })
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(color: Colour.Alizarin, pallete: "American")
    }
}
