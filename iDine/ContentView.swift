//
//  ContentView.swift
//  iDine
//
//  Created by Anna Maria Fortuna on 2/03/21.
//

import SwiftUI

struct ContentView: View {
    let menu: [MenuSection] = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { menuItem in
                            NavigationLink(
                                destination: MenuDetailsView(
                                    title: menuItem.name,
                                    description: menuItem.description,
                                    imageName: menuItem.mainImage,
                                    photoCredit: menuItem.photoCredit,
                                    menuItem: menuItem
                                ),
                                label: {
                                    ItemRow(
                                        name: menuItem.name,
                                        imageName: menuItem.thumbnailImage,
                                        price: menuItem.price,
                                        labels: menuItem.restrictions
                                    )
                                })
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
