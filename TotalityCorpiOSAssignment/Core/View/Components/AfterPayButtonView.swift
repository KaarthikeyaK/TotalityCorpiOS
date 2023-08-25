//
//  AfterPayButtonView.swift
//  TotalityCorpiOSAssignment
//
//  Created by KAARTHIKEYA K on 24/08/23.
//

import SwiftUI

struct AfterPayButtonView: View {
    
    var namespace: Namespace.ID
    
    var user: User = User.samples[0]
    
    @State var nextButtonPressedTimes = 0
    
    @State var viewAppear  = [false, false, false]
    @State var selectedButton : Int = 5
    @State var levelSelectedButton: String = "Easy"
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack {
            
            if nextButtonPressedTimes == 0 {
                firstView
            }
            
            if nextButtonPressedTimes == 1 {
                secondView
            }
            
            if nextButtonPressedTimes == 2 {
                thirdView

            }
                                    
            Spacer()

            nextButton
                .onTapGesture {
                    nextButtonPressedTimes += 1
                    withAnimation(.linear){
                        if nextButtonPressedTimes < 3 {
                            viewAppear[nextButtonPressedTimes] = true
                        } else {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
        }
        .padding()
        .onAppear{
            withAnimation(.linear) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    viewAppear[0] = true
                }
            }
        }
    }
}

extension AfterPayButtonView {
    
    //MARK: - First View
    private var firstView: some View {
        
        FirstSheetView(viewAppear: $viewAppear)
        
    }
    
    //MARK: - Second View
    
    private var secondView: some View {

        SecondSheetView(namespace: namespace, viewAppear: $viewAppear, selectedButton: $selectedButton)
        
    }
    
    
    //MARK: - Third View
    
    private var thirdView: some View {
        
        ThirdSheetView(namespace: namespace, viewAppear: $viewAppear, selectedButton: $selectedButton, levelSelectedButton: $levelSelectedButton)
    }
    
    private var nextButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 32)
                .foregroundColor(viewAppear[2] ? .black : .theme.green)
                .frame(width: UIScreen.main.bounds.width - 40, height: 60)
                .matchedGeometryEffect(id: "button2\(user.id)", in: namespace)
            
            Text(viewAppear[2] ? "Confirm" : "Next")
                .foregroundColor(.white)
                .font(.title2)
        }
    }
}

struct AfterPayButtonView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        AfterPayButtonView(namespace: namespace)
    }
}
