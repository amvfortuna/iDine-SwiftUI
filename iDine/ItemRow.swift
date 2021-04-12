//
//  ItemRow.swift
//  iDine
//
//  Created by Anna Maria Fortuna on 4/03/21.
//

import SwiftUI

struct ItemRow: View {
    let name: String
    let imageName: String
    let price: Int
    let labels: [String]
    
    static let colours = [
        "D": Color.blue,
        "G": Color.black,
        "V": Color.green,
        "N": Color(
            .sRGB,
            red: 176/255,
            green: 142/255,
            blue: 79/255,
            opacity: 1
        ),
        "S": Color.yellow,
    ]
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(imageName)
                .clipShape(Circle())
                .overlay(Circle().stroke(lineWidth: 2))
            
            VStack(alignment: .leading, spacing: 3) {
                Text(name)
                    .font(.headline)
                Text("$\(price)")
            }
            
            Spacer()
            
            ForEach(labels, id: \.self) { label in
                Text(label)
                    .font(.footnote)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(ItemRow.colours[label])
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(
            name: MenuItem.example.name,
            imageName: MenuItem.example.thumbnailImage,
            price: MenuItem.example.price,
            labels: MenuItem.example.restrictions
        )
    }
}
