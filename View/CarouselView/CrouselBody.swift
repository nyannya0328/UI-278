//
//  CrouselBody.swift
//  CrouselBody
//
//  Created by nyannyan0328 on 2021/08/05.
//

import SwiftUI

struct CrouselBody: View {
    var current : Int
    @State var offset : CGFloat = 0
    var body: some View {
        GeometryReader{proxy in
            
            let size = proxy.size
            
            ZStack{
                
                
                Image("p\(current)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width - 10, height: size.height / 1.5)
                    .cornerRadius(20)
                
                VStack{
                    VStack(alignment: .leading, spacing: 15) {
                        
                        
                        Text("Human Intergration Super visor")
                            .font(.title2.weight(.semibold))
                        
                        
                        Text("                 Unsplash")
                            .font(.title.weight(.thin))
                            
                    
                    }
                   
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    
                    VStack(alignment:.leading){
                        
                        HStack{
                            
                            Image("logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text("Cat Man")
                                    .font(.callout.bold())

                                
                                Text("So Cute!!!")
                                
                            }
                            .foregroundColor(.black)
                            
                            
                        }
                        HStack{
                            
                            VStack(spacing:10){
                                
                                Text("20")
                                    .font(.title3)
                                Text("Follower")
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack(spacing:10){
                                
                                Text("16")
                                    .font(.title3)
                                Text("Following")
                            }
                            .frame(maxWidth: .infinity)
                            
                            
                            VStack(spacing:10){
                                
                                Text("50")
                                    .font(.title3)
                                Text("Push up")
                            }
                            .frame(maxWidth: .infinity)
                        }
                        
                        
                        
                        
                    }
                    .padding(20)
                    .padding(.horizontal)
                    .background(.white,in:RoundedRectangle(cornerRadius: 20))
                }
                .frame(width: size.width - 10, height: size.height / 1.5)
            }
            .frame(width: size.width, height: size.height)
           
        }
        .tag("p\(current)")
        
        .rotation3DEffect(.init(degrees: getprogess() * 90), axis: (x: 0, y: 1, z: 0), anchor: offset > 0 ? .leading : .trailing, anchorZ: 1, perspective: 3)
        
        .modifier(ScrollViewOffsetModfi(offset: $offset, anchorpoint: .leading))
        
    }
    
    func getprogess()->CGFloat{
        
        let progress = -offset / UIScreen.main.bounds.width
        
        return progress
    }
    
    
}

struct CrouselBody_Previews: PreviewProvider {
    static var previews: some View {
        CrouselMain()
    }
}
