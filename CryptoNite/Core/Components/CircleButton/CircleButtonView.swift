//
//  CircleButtonView.swift
//  CryptoNite
//
//  Created by Redwan Khan on 1/10/24.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
            )
            .shadow(color: Color.theme.accent.opacity(0.25),
                    radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x:0 , y:0 )
            .padding()
    }
}

#Preview {
    Group {
        
        
        CircleButtonView(iconName: "info")
            .previewLayout(.sizeThatFits)
        
        CircleButtonView(iconName: "plus")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
