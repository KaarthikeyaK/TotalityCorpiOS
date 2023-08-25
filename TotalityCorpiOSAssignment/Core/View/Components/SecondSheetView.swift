//
//  SecondSheetView.swift
//  TotalityCorpiOSAssignment
//
//  Created by KAARTHIKEYA K on 24/08/23.
//

import SwiftUI

struct SecondSheetView: View {
    
    var namespace: Namespace.ID
    
    @Binding var viewAppear : [Bool]
    @Binding var selectedButton: Int
    
    var user: User = User.samples[0]
    
    var body: some View {
        
        VStack {
            
            profileName
            
            amount
                .offset(x: viewAppear[1] ? 0 : UIScreen.main.bounds.width)
                .animation(.easeIn(duration: 0.6).delay(0.3), value: viewAppear[1])
            
            walletAmount
                .matchedGeometryEffect(id: "wallet", in: namespace)
                .animation(.easeIn(duration: 0.6).delay(0.6), value: viewAppear[1])
            
        }
    }
}

extension SecondSheetView {
    
    //MARK: - Profile Name and Amount Select Label View
    private var profileName: some View {
        VStack {
            Text("\(user.firstName) \(user.lastName)")
                .frame(height: 30)
                .font(viewAppear[1] ? .system(size: 24) : .system(size: 8))
                .animation(.spring(response: 0.6, blendDuration: 1), value: viewAppear[0])
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text("----- Select your amount -----")
                .foregroundColor(.primary)
                .font(.subheadline)
                .opacity(viewAppear[1] ? 1 : 0)
        }
    }
    
    //MARK: - Amount Select View
    private var amount: some View {
        HStack (spacing: 32){
            ZStack {
                Circle()
                    .foregroundColor(selectedButton == 5 ? .theme.green : .gray)
                    .frame(width: 60)
                Text("5")
                    .foregroundColor(.white)
                    .font(.title2)
            }
            .onTapGesture {
                withAnimation(.linear){
                    selectedButton = 5
                }
            }
            
            ZStack {
                Circle()
                    .foregroundColor(selectedButton == 10 ? .theme.green : .gray)
                    .frame(width: 60)
                Text("10")
                    .foregroundColor(.white)
                    .font(.title2)
            }
            .onTapGesture {
                withAnimation(.linear){
                    selectedButton = 10
                }

            }
            
            ZStack {
                Circle()
                    .foregroundColor(selectedButton == 15 ? .theme.green : .gray)
                    .frame(width: 60)
                Text("15")
                    .foregroundColor(.white)
                    .font(.title2)
            }
            .onTapGesture {
                withAnimation(.linear){
                    selectedButton = 15
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
        .opacity(viewAppear[1] ? 1 : 0)
        .offset(y: viewAppear[1] ? 0 : 50)
    }
}

struct SecondSheetView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        SecondSheetView(namespace: namespace, viewAppear: .constant([false, true, true]), selectedButton: .constant(5))
    }
}
