//
//  CircleButtonAnimationView.swift
//  CryptoNite
//
//  Created by Redwan Khan on 1/10/24.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool //connected to our homeview, it'll tell when our CircleButtonAnimationView when to animate instead of .onAppear here
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeInOut(duration: 1) : nil)

        
        
    }
}

#Preview {
    CircleButtonAnimationView (animate: .constant(false))
        .foregroundColor(.red)
        .frame(width: 100, height: 100)
       
}
