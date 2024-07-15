//
//  EndingView.swift
//  SeeMe
//
//  Created by Francesco De Stasio on 16/04/23.
//

import SwiftUI

struct EndingView: View {
    
    let rights : String = "App Developed By Francesco De Stasio \n\n"
    let quote : String = "\"I hope that you could enjoy a few minutes of your life, Cheers!\""
    
    var body: some View {
        VStack{
            Text(rights)
                .font(MyFont.loadFont(size: ContentView.fontSizerForDevice() + 10, name: "Grenze-Bold"))
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(Color("TextColor"))
            Text(quote)
                .font(MyFont.loadFont(size: ContentView.fontSizerForDevice() + 10, name: "Grenze-Thin"))
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
        }
    }
}




struct EndingView_Previews: PreviewProvider {
    static var previews: some View {
        EndingView()
    }
}
