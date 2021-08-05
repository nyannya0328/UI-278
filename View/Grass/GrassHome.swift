//
//  GrassHome.swift
//  GrassHome
//
//  Created by nyannyan0328 on 2021/08/04.
//

import SwiftUI

struct GrassHome: View {
    @StateObject var model = AllViewModel()
    var body: some View {
        ZStack{
            
            
            LinearGradient(colors: [
            
            Color("BG1"),
            Color("BG2"),
            
            ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                Color.black.opacity(0.1)
                    .ignoresSafeArea()
                
                Circle()
                    .fill(.green)
                    .padding(50)
                    .blur(radius: 100)
                    .offset(y: -size.height / 2)
                
                Circle()
                    .fill(.red)
                    .padding(50)
                    .blur(radius: 100)
                    .offset(y: size.height / 2)
                
                
                Circle()
                    .fill(.yellow)
                    .padding(50)
                    .blur(radius: 100)
                    .offset(x: -size.width / 2)
                
                
                Circle()
                    .fill(.orange)
                    .padding(50)
                    .blur(radius: 100)
                    .offset(x: size.width / 2)
            }
            
            
            VStack{
                
                Spacer(minLength: 20)
                ZStack{
                    
                    Circle()
                        .fill(.red)
                        .frame(width: 100, height: 100)
                        .blur(radius: 50)
                        .offset(x: 100, y: -80)
                    
                    
                    Circle()
                        .fill(.purple)
                        .frame(width: 100, height: 100)
                        .blur(radius: 50)
                        .offset(x: -100, y: 80)
                    
                    
                    Grasscontent()
                }
                
                Spacer(minLength: 20)
                
                Text("Know Everything\nabout the weather")
                    .font(.system(size: 35, weight: .bold))
                
                
                Text(getAttribute())
                    .font(.footnote)
                    .padding(.top,5)
                
                
                Button {
                    
                    withAnimation{
                        
                        model.show.toggle()
                    }
                    
                } label: {
                    
                    Text("Get Started")
                        .font(.title2.bold())
                        .padding(.horizontal,10)
                        .padding(.vertical,20)
                        .frame(maxWidth: .infinity)
                        .background(
                            
                            LinearGradient(colors: [
                                
                                
                                Color("Button11"),
                                
                                Color("Button12"),
                            
                            
                            ], startPoint: .leading, endPoint: .trailing)
                            
                                ,in: RoundedRectangle(cornerRadius: 10)
                            
                                
                        
                        
                        
                        )
                    
                }
                .padding(.horizontal,20)
                .padding(.top,10)
                
                
                Button {
                    
                } label: {
                    
                    Text("Already have an account?")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .underline()
                }
                .padding(.top,10)


                
                
            }
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding()
            
        }
        .overlay(
        
            ZStack{
                
                if model.show{
                    
                    StaggMainView()
                        .transition(.move(edge: .bottom))
                        .environmentObject(model)
                }
            }
        
        )
        
    }
    
    func getAttribute()->AttributedString{
        
        var atR = AttributedString("The most beautiful Image for unsplash")
        
        atR.foregroundColor = .black
        
        
        if let range = atR.range(of: "unsplash"){
            
            
            atR[range].foregroundColor = .green
            atR[range].link = URL(string: "https://unsplash.com")
            
        }
        
        return atR
            
            
        
        
    }
}

struct GrassHome_Previews: PreviewProvider {
    static var previews: some View {
        GrassHome()
    }
}

struct Grasscontent : View{
    
    var body: some View{
        
        let width = UIScreen.main.bounds.width
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: width / 1.7, height: 250)
                .opacity(0.1)
                .background(
                
                    Color.white.opacity(0.1)
                        .blur(radius: 20)
                
                )
                .background(
                    
                    
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(
                        
                            LinearGradient(colors: [
                                
                                
                                Color("LightBlue"),
                                Color("LightBlue").opacity(0.1),
                                .clear,
                                .clear,
                                Color("Purple")
                            
                            
                            ], startPoint: .topLeading, endPoint: .bottomTrailing),lineWidth: 5
                        
                        
                        
                        )
                        .padding(2)
                        
                
              
                
                
                
                
                )
                .shadow(color: .black.opacity(0.2), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.2), radius: 5, x: -5, y: -5)
            
            
        
                
                VStack{
                
                    
                    Image(systemName: "sun.max")
                        .font(.system(size: 80, weight: .ultraLight))
                    
                    Text("18")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.orange)
                        .overlay(
                        
                        Text("°C")
                            .font(.title2)
                            .foregroundColor(.blue)
                            .offset(x: 15, y: -5)
                        
                        ,alignment: .topTrailing
                        
                        )
                    
                  
                        
                        
                    LinearGradient(colors: [
                    
                        .red,.orange,.green,.purple
                    
                    
                    ], startPoint: .leading, endPoint: .trailing)
                    
                    
                        .mask(
                        
                            Text("OOSAKA")
                                .font(.system(size: 30, weight: .bold))
                                
                                
                              
                            
                        
                        )
                        .frame(height: 30)
                       
                        
                       
                          
                   
                    
                }
                .frame(height: 200)
            
          
            
            
            
            
            
        }
    }
}
