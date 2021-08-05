//
//  ScrollViewOffsetModfi.swift
//  ScrollViewOffsetModfi
//
//  Created by nyannyan0328 on 2021/08/05.
//

import SwiftUI

struct ScrollViewOffsetModfi: ViewModifier {
    
    @Binding var offset : CGFloat
    var anchorpoint : Anchor = .top
    func body(content: Content) -> some View {
        content
            .overlay(
            
            
                GeometryReader{proxy -> Color in
                    
                    
                    
                    let frame = proxy.frame(in: .global)
                    
                    DispatchQueue.main.async {
                        
                        switch anchorpoint {
                        case .top:
                            offset = frame.minY
                        
                        case .bottom:
                            offset = frame.maxY
                        case .trailing:
                            offset = frame.maxX
                            
                        case .leading:
                            offset = frame.minX
                        }
                        
                       
                        
                        
                    }
                    
                    return Color.clear
                }
            
            )
    }
}

enum Anchor{
    
    case top
    case bottom
    case trailing
    case leading

    
    
}


