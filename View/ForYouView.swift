//
//  ForYouView.swift
//  ForYouView
//
//  Created by nyannyan0328 on 2021/08/04.
//

import SwiftUI

struct ForYouView: View {
    var edge : CGFloat
    var body: some View {
        VStack{
            
            
            HStack{
                
                Text(titleAltlbute())
                    .font(.title)
                    .fontWeight(.black)
                
                Spacer()
                
                
                Button {
                    
                } label: {
                    Image(systemName: "person.fill")
                        
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.blue)
                        .overlay(
                            
                            Circle()
                                .fill(.red.opacity(0.7))
                                .frame(width: 20, height: 20)
                                .offset(x: 5)
                        
                            ,alignment: .topTrailing
                        )
                }

                
                
            }
            .padding(.horizontal)
            .frame(height: 80)
            
            
            GeometryReader{proxy in
         let size = proxy.size
                
                VerticalCalusel {
                    
                    
                    ForEach(animals){animal in
                        
                        
                        AnimalCardView(animal: animal, topOffset: 70 + 15 + edge)
                            .frame(height: size.height)
                        
                    }
                    
                }
                
                
            }
        }
       
        .background(
        
        LinearGradient(colors: [
        
            .red,.green,.orange,.purple,
        
        
        ], startPoint: .top, endPoint: .bottom)
        
        
        )
    }
    
    func titleAltlbute()->AttributedString{
        var atR = AttributedString("Todays for you")
        
        
        if let range = atR.range(of: "you"){
            
            
            atR[range].foregroundColor = .orange
        }
        
        if let rage2 = atR.range(of: "for"){
            
            
            atR[rage2].foregroundColor = .green
        }
        
        
        if let rag3 = atR.range(of: "Todays"){
            
            atR[rag3].foregroundColor = .purple
        }
        
        
        return atR
        
       
        
    }
}

struct ForYouView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}

struct AnimalCardView : View{
    
    var animal : Animal
    var topOffset : CGFloat
    
    var body: some View{
        
        
        GeometryReader{proxy in
            
            let size = proxy.size
            
            let minY = proxy.frame(in: .global).minY - topOffset
            let progress = -minY / size.height
            
            let scale = 1 - (progress / 2)
            
            let opa = 1 - progress
            
            
            
            
            ZStack{
                
                Image(animal.artWork)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height - 80)
                   
            }
            .padding(.horizontal)
            .cornerRadius(20)
            .scaleEffect(minY < 0 ? scale : 1)
            .offset(y: minY < 0 ? -minY : 0)
            .opacity(minY < 0 ? opa : 1)
            .blur(radius: minY < 0 ? 30 : 0)
            
            
            
            
        }
       
        
    }
}
