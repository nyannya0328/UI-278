//
//  CustomTabView.swift
//  CustomTabView
//
//  Created by nyannyan0328 on 2021/08/04.
//

import SwiftUI

struct CustomTabView: View {
    @StateObject var model = AllViewModel()
    init(){
        
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        TabView(selection:$model.currentTab){
            
            GeometryReader{proxy in
                
                let edge = proxy.safeAreaInsets.top
                
                ForYouView(edge: edge)
                    .padding(.top,edge)
                    .ignoresSafeArea(.all, edges: .top)
                
            }
                .tag("For you")
            
           WaveMain()
                .tag("Search")
            
           GrassHome()
                .tag("Following")
            
            CrouselMain()
                .tag("Download")
            
            
        }
        .overlay(
        
            HStack(spacing:0){
                
                CustomTabButton(title: "For you", image: "house.fill")
                
                CustomTabButton(title: "Search", image: "magnifyingglass")
                
                CustomTabButton(title: "Following", image: "rectangle.portrait")
                
                CustomTabButton(title: "Download", image: "square.and.arrow.up.fill")
                
                
            }
                .environmentObject(model)
                .frame(height: 80)
            
                .background(.black.opacity(0.8),in:Capsule())
                .padding()
                .shadow(radius: 15)
                .offset(y: 30)
            
            ,alignment: .bottom
        
        )
        
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}

struct CustomTabButton : View{
    
    
    var title : String
    var image : String
    @EnvironmentObject var model : AllViewModel
    
    var body: some View{
        
        
        Button {
            withAnimation{
                
                model.currentTab = title
            }
        } label: {
            
            VStack(spacing:10){
                
                Image(systemName: image)
                    .font(.title2)
                    
                Text(title)
                    .font(.caption.bold())
                
            }
            .foregroundColor(model.currentTab == title ? .white : .gray)
            .frame(maxWidth: .infinity)
            
        }

    }
}
