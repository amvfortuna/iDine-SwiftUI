//
//  MenuDetailsView.swift
//  iDine
//
//  Created by Anna Maria Fortuna on 8/03/21.
//

import SwiftUI

struct MenuDetailsView: View {
    let title: String
    let description: String
    let imageName: String
    let photoCredit: String
    let menuItem: MenuItem
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                Text("📸: \(photoCredit)")
                    .font(.caption)
                    .padding(3)
                    .background(Color.black)
                    .foregroundColor(.white)
            }
            
            Text(description)
                .font(.subheadline)
                .padding()
            
            Button("Order this") {
                order.add(item: menuItem)
            }
            .font(.headline)
            
            Spacer()
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MenuDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MenuDetailsView(
                title: MenuItem.example.name,
                description: MenuItem.example.description,
                imageName: MenuItem.example.mainImage,
                photoCredit: MenuItem.example.photoCredit,
                menuItem: MenuItem.example
            )
            .environmentObject(Order())
        }
    }
}
