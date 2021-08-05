//
//  VerticalCalusel.swift
//  VerticalCalusel
//
//  Created by nyannyan0328 on 2021/08/04.
//

import SwiftUI

struct VerticalCalusel<Content : View>: UIViewRepresentable {
    
    var conent : Content
    
    init(@ViewBuilder content : @escaping()->Content){
        
        
        self.conent = content()
    }
    
    let scroll = UIScrollView()
    func makeUIView(context: Context) -> UIScrollView {
        
        setUPScroll(scroll: scroll)
        
        return scroll
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    func setUPScroll(scroll : UIScrollView){
        scroll.isPagingEnabled  = true
        scroll.showsVerticalScrollIndicator = false
        
        
        let hostView = UIHostingController(rootView: conent)
    
        hostView.view.backgroundColor = .clear
        
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        let constains = [
        
            hostView.view.topAnchor.constraint(equalTo: scroll.topAnchor),
            
            hostView.view.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            
            hostView.view.leadingAnchor.constraint(equalTo: scroll.trailingAnchor),
            
            hostView.view.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            
         
        
        
        
        ]
        
        scroll.addConstraints(constains)
        scroll.addSubview(hostView.view)
        
       
        
        
        
    }
}


