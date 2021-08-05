//
//  SnapCrousel.swift
//  SnapCrousel
//
//  Created by nyannyan0328 on 2021/08/02.
//

import SwiftUI

struct SnapCrousel<Content : View,T : Identifiable>: View {
    
    var content : (T)->Content
    var list : [T]
    
    var trailingSpace : CGFloat
    @Binding var index : Int
    var spacing : CGFloat
    
    init(index : Binding<Int>, spacing : CGFloat = 15,trailingSpace : CGFloat = 100,items : [T],@ViewBuilder content : @escaping(T) -> Content){
        
        
        self.content  = content
        self._index = index
        self.trailingSpace = trailingSpace
        self.spacing = spacing
        self.list = items
        
        
        
        
    }
    
    @GestureState var offset :  CGFloat = 0
    
    @State var currentIndex : Int = 0
    
    var body: some View{
        
        GeometryReader{proxy in
            
            let width = proxy.size.width - (trailingSpace - spacing)
            
            let adusutMentWidth = (trailingSpace / 2) - spacing
            
            
            HStack(spacing:15){
                
                ForEach(list){item in
                    
                    content(item)
                        .frame(width: proxy.size.width - trailingSpace)
                }
                
                
                
            }
            .padding(.horizontal,spacing)
            .offset(x:(CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adusutMentWidth : 0) + offset)
            .gesture(
            
                DragGesture().updating($offset, body: { value, out, _ in
                    
                    
                    out = value.translation.width
                })
                    .onEnded({ value in
                        let offsetX = value.translation.width
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                        currentIndex = index
                        
                    })
                    .onChanged({ value in
                        
                        let offsetX = value.translation.width
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                       
                        
                        
                        
                        
                    })
            
            )
            
        }
        .animation(.spring(), value: offset == 0)
        
    }
    
    
   
}

struct SnapCrousel_Previews: PreviewProvider {
    static var previews: some View {
        PostMainView()
    }
}
