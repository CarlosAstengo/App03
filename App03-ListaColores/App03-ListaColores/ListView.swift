//
//  ContentView.swift
//  App03-ListaColores
//
//  Created by Carlos Astengo Macias on 28/09/21.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var colors = ColorModel()
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView{
            List {
                TextField("Nombre Color", text: $searchText)
                    .font(.title2)
                    .foregroundColor(.black)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Section(
                    header:Text("Flat UI")
                        .font(.largeTitle)
                        .foregroundColor(.black)) {
                            ForEach(colors.flatUI.filter{
                                searchText.isEmpty || $0.name.localizedStandardContains(searchText)
                            }) { c in
                            NavigationLink(
                                destination: ColorView(color: c, pallete: "Flat UI"),
                                label: {
                                    HStack {
                                        Image(systemName: c.dark ? "lightbulb.fill" : "lightbulb")
                                        Text("indice: \(c.name)")
                                            .foregroundColor(c.dark ? .white : .black)
                                    }
                                })
                                .listRowBackground(c.colour)
                        }
                    }
                Section(
                    header:Text("Spanish")
                        .font(.largeTitle)
                        .foregroundColor(.black)) {
                        ForEach(colors.spanish.filter{
                            searchText.isEmpty || $0.name.localizedStandardContains(searchText)
                        }) { c in
                            NavigationLink(
                                destination: ColorView(color: c, pallete: "Spanish"),
                                label: {
                                    HStack {
                                        Image(systemName: c.dark ? "lightbulb.fill" : "lightbulb")
                                        Text("indice: \(c.name)")
                                            .foregroundColor(c.dark ? .white : .black)
                                    }
                                })
                                .listRowBackground(c.colour)
                        }
                    }
                
                Section(
                    header:Text("American")
                        .font(.largeTitle)
                        .foregroundColor(.black)) {
                        ForEach(colors.american.filter{
                            searchText.isEmpty || $0.name.localizedStandardContains(searchText)
                        }) { c in
                            NavigationLink(
                                destination: ColorView(color: c, pallete: "American"),
                                label: {
                                    HStack {
                                        Image(systemName: c.dark ? "lightbulb.fill" : "lightbulb")
                                        Text("indice: \(c.name)")
                                            .foregroundColor(c.dark ? .white : .black)
                                    }
                                })
                                .listRowBackground(c.colour)
                        }
                    }
            }
            .accentColor(.black)
            .listStyle(SidebarListStyle())
            .navigationBarTitle("Colores", displayMode: .inline)
            .navigationBarColor(UIColor(.black),UIColor(.white))
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text("Colores")
                        .font(.title)
                        .foregroundColor(.white)
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
