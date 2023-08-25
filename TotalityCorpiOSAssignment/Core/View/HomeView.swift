//
//  HomeView.swift
//  TotalityCorpiOSAssignment
//
//  Created by KAARTHIKEYA K on 23/08/23.
//

import SwiftUI

struct HomeView: View {
    
    @Namespace private var namespace
    @State var isShowingExpandedScreen : Bool = false
    @State var selectedID: UUID = UUID()
    
    
    var body: some View {
        
        ZStack {
            
            if !isShowingExpandedScreen {
                ScrollViewReader { scrollViewProxy in
                    ScrollView {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 1)) {
                            ForEach(User.samples) { user in
                                CardView(namespace: namespace, isShowingExpandedScreen: $isShowingExpandedScreen, selectedID: $selectedID, user: user)
                                    .padding()
                            }
                        }
                    }
                }
            }
            if isShowingExpandedScreen {
                ForEach(User.samples) { user in
                    if user.id == selectedID {
                        ExpandedCardView(namespace: namespace, isShowingExpandedScreen: $isShowingExpandedScreen, user: user)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
