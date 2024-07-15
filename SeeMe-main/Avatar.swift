//
//  Avatar.swift
//  SeeMe
//
//  Created by Francesco De Stasio on 12/04/23.
//

import SwiftUI

struct Avatar: View {
    @State var move : Bool = true
    var body: some View {
        VStack{
            HStack{
                Circle()
                    .foregroundColor(Color.white)
                    .frame(width: 50, height: 30)
                Circle()
                    .foregroundColor(Color.white)
                    .frame(width: 50, height: 30)
            }
            Rectangle()
                .foregroundColor(Color.white)
                .frame(width: move ? 85 : 65, height: move ? 30 : 2)
                .clipShape(RoundedCorner(radius: 20.0, corners: [.bottomLeft, .bottomRight]))
                .onAppear{
                    withAnimation(Animation.easeIn(duration: 0.4).repeat(while: move, autoreverses: true )) {
                        move.toggle()
                    }
                }
                .fixedSize()
        }
        .frame( height: 200)
    }
}

extension Animation {
    func `repeat`(while expression: Bool, autoreverses: Bool = true) -> Animation {
        if expression {
            return self.repeatForever(autoreverses: autoreverses)
        } else {
            return self
        }
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar()
    }
}
