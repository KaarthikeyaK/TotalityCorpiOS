//
//  ThirdSheetView.swift
//  TotalityCorpiOSAssignment
//
//  Created by KAARTHIKEYA K on 24/08/23.
//

import SwiftUI

struct ThirdSheetView: View {
    
    var namespace: Namespace.ID
    
    @Binding var viewAppear : [Bool]
    @Binding var selectedButton: Int
    @Binding var levelSelectedButton: String
    
    var body: some View {
        VStack {
            
            nameLabel
            
            level
                .offset(x: viewAppear[2] ? 0 : UIScreen.main.bounds.width)
                .animation(.easeIn(duration: 0.6).delay(0.3), value: viewAppear[2])
            
            walletAmount
                .matchedGeometryEffect(id: "wallet", in: namespace)
        }

    }
}

extension ThirdSheetView {
    
    //MARK: - Name Label
    private var nameLabel: some View {
        VStack {
            Text("READY TO PLAY")
                .frame(height: 30)
                .font(viewAppear[2] ? .system(size: 20) : .system(size: 8))
                .animation(.spring(response: 0.6, blendDuration: 1), value: viewAppear[0])
                .foregroundColor(.primary)
            
            Text("OSWALD")
                .frame(height: 30)
                .font(viewAppear[2] ? .system(size: 24) : .system(size: 8))
                .animation(.spring(response: 0.6, blendDuration: 1), value: viewAppear[0])
                .foregroundColor(.primary)
        }
    }
    
    private var level: some View {
        HStack (spacing: 32){
            ZStack {
                RoundedRectangle(cornerRadius: 16)                                .foregroundColor(levelSelectedButton == "Easy" ? .theme.green : .gray)
                    .frame(width: 80, height: 60)
                Text("Easy")
                    .foregroundColor(.white)
                    .font(.title2)
            }
            .onTapGesture {
                withAnimation(.linear){
                    levelSelectedButton = "Easy"
                }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(levelSelectedButton == "Medium" ? .theme.green : .gray)
                    .frame(width: 80, height: 60)
                Text("Med")
                    .foregroundColor(.white)
                    .font(.title2)
            }
            .onTapGesture {
                withAnimation(.linear){
                    levelSelectedButton = "Medium"
                }

            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 16)                                .foregroundColor(levelSelectedButton == "Hard" ? .theme.green : .gray)
                    .frame(width: 80, height: 60)
                Text("Hard")
                    .foregroundColor(.white)
                    .font(.title2)
            }
            .onTapGesture {
                withAnimation(.linear){
                    levelSelectedButton = "Hard"
                }
            }
        }
    }
    
    private var walletAmount: some View {
        HStack {
            Text("Wallet Amount : 60")
                .foregroundColor(.primary)
                .font(.subheadline)
            
            Spacer()
            
            Text("\(selectedButton)/-")
                .foregroundColor(.primary)
                .font(.subheadline)
        }
        .padding()
    }
}

struct ThirdSheetView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        ThirdSheetView(namespace: namespace, viewAppear: .constant([false, false, true]), selectedButton: .constant(5), levelSelectedButton: .constant("Easy"))
    }
}
