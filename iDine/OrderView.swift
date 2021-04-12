//
//  OrderView.swift
//  iDine
//
//  Created by Anna Maria Fortuna on 12/04/21.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    @State var checkoutTapped = false
    
    var body: some View {
        NavigationView {
            List {
                if order.items.isEmpty {
                    Text("You have no orders yet")
                } else {
                    ForEach(order.items) { item in
                        HStack {
                            Image(item.thumbnailImage)
                                .clipShape(Circle())
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }
                
                HStack {
                    Text("Total order:")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Text("$\(order.total).00")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                
                Section {
                    VStack {
                        NavigationLink(
                            destination: Text("Go to checkout"),
                            isActive: $checkoutTapped,
                            label: {
                                Text("Place order")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.blue)
                            }
                        )
                    }
                }
            }
            .navigationTitle("Order")
            .tabItem {
                VStack {
                    Text("Order")
                }
            }
            .listStyle(GroupedListStyle())
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
