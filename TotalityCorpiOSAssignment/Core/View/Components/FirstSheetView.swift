//
//  FirstSheetView.swift
//  TotalityCorpiOSAssignment
//
//  Created by KAARTHIKEYA K on 24/08/23.
//

import SwiftUI

struct FirstSheetView: View {
    
    @Binding var viewAppear : [Bool]
    var user: User = User.samples[0]
    
    var body: some View {
        
        VStack {
            
            profileName
                        
            VStack {
                
                profileImage
                    .offset(x: viewAppear[0] ? 0 : UIScreen.main.bounds.width)
                    .animation(.easeIn(duration: 0.6), value: viewAppear[0])
            }
        }
    }
}

extension FirstSheetView {
    //MARK: - Profile Name View
    private var profileName: some View {
        
        Text("\(user.firstName) \(user.lastName)")
            .frame(height: 30)
            .font(viewAppear[0] ? .system(size: 16) : .system(size: 8))
            .animation(.spring(response: 0.6, blendDuration: 1), value: viewAppear[0])
            .fontWeight(.semibold)
            .foregroundColor(.primary)
        
    }
    
    //MARK: - Profile Image View
    private var profileImage: some View {
        HStack (spacing: 32){
            
            VStack {
                
                Image(movieImage: user.profileImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipped()
                    .clipShape(Circle())
                
                Text("\(user.firstName)")
                    .font(.system(size: 16))
                    .animation(.easeIn(duration: 0.4), value: viewAppear[0])
                    .foregroundColor(.primary)
                
                Text("\(user.lastName)")
                    .font(.system(size: 16))
                    .animation(.easeIn(duration: 0.3), value: viewAppear[0])
                    .foregroundColor(.primary)
                
                
            }
            
            VStack {
                Image(movieImage: user.profileImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipped()
                    .clipShape(Circle())
                
                Text("\(user.firstName)")
                    .font(.system(size: 16))
                    .animation(.easeIn(duration: 0.4), value: viewAppear[0])
                    .foregroundColor(.primary)
                
                Text("\(user.lastName)")
                    .font(.system(size: 16))
                    .animation(.easeIn(duration: 0.3), value: viewAppear[0])
                    .foregroundColor(.primary)
                
            }
        }
    }
}

struct FirstSheetView_Previews: PreviewProvider {
    static var previews: some View {
        FirstSheetView(viewAppear: .constant([true, false, false]))
    }
}
