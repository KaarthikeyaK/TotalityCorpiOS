//
//  CardView.swift
//  TotalityCorpiOSAssignment
//
//  Created by KAARTHIKEYA K on 23/08/23.
//

import SwiftUI

struct CardView: View {
    
    var namespace: Namespace.ID
    @Binding var isShowingExpandedScreen: Bool
    @Binding var selectedID : UUID
    
    var user: User = User.samples[0]
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .center) {
                
                profileImage
                
                Spacer()
                
                downloadButtonView
                    .matchedGeometryEffect(id: "button\(user.id)", in: namespace)
                    .matchedGeometryEffect(id: "button2\(user.id)", in: namespace)
                
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 2)
            .background(
                Color.theme.accent
                    .cornerRadius(32)
            )
        }
    }
}

extension CardView {
    //MARK: - Profile Image View
    private var profileImage: some View {
        HStack {
            Image(movieImage: user.profileImage)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(32)
                .clipped()
                .matchedGeometryEffect(id: user.profileImage, in: namespace)
            
            Spacer()
        }
    }
    
    //MARK: - Download Button View
    private var downloadButtonView: some View {
        Button {
            selectedID = user.id
            withAnimation(.spring()){
                isShowingExpandedScreen.toggle()
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 32)
                    .foregroundColor(.theme.green)
                    .frame(width: UIScreen.main.bounds.width - 60, height: 60)
                Text("Download")
                    .foregroundColor(.white)

            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        Group {
            CardView(namespace: namespace, isShowingExpandedScreen: .constant(false), selectedID: .constant(User.samples[0].id))
            CardView(namespace: namespace, isShowingExpandedScreen: .constant(false), selectedID: .constant(User.samples[0].id))
                .preferredColorScheme(.dark)
        }
    }
}
