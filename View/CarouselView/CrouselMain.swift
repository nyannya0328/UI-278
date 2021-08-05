//
//  CrouselMain.swift
//  CrouselMain
//
//  Created by nyannyan0328 on 2021/08/05.
//

import SwiftUI

struct CrouselMain: View {
    @State var current = "p1"
    var body: some View {
        ZStack{
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                Image(current)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                
            }
            .ignoresSafeArea()
            .overlay(.ultraThinMaterial)
            .colorScheme(.dark)
            
            
            TabView(selection : $current){
                
                ForEach(1...10,id:\.self){index in
                    
                    
                    CrouselBody(current: index)
                }
                
                
                
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
        }
    }
}

struct CrouselMain_Previews: PreviewProvider {
    static var previews: some View {
        CrouselMain()
    }
}
