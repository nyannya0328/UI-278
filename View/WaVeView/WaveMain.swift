//
//  WaveMain.swift
//  WaveMain
//
//  Created by nyannyan0328 on 2021/08/05.
//

import SwiftUI

struct WaveMain: View {
    @State var on = false
   
    var body: some View {
        ZStack{
            
            WaveForm(color: .red, ampifiy: 200, isRecived: true)
            
            WaveForm(color: on ? .orange :.blue, ampifiy: 200, isRecived: false)
            
            WaveForm(color: .red, ampifiy: 200, isRecived: true)
                .offset(y: 100)
            
            WaveForm(color: .purple, ampifiy: 200, isRecived: false)
                .offset(y: 200)
            
            
            
        }
        .safeAreaInset(edge: .top, content: {
            
            HStack{
                
                
                Text("Waves")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                Spacer()
                
                
                Toggle(isOn: $on) {
                    
                    
                    Image(systemName: "eyedropper.full")
                        .font(.title2)
                      
                       
                    
                    
                }
                
                .tint(.purple)
                .toggleStyle(.button)
            }
            .padding(.horizontal)
            
        })
        .ignoresSafeArea(.all, edges: .bottom)
        .background(
        
        
            ZStack{
                LinearGradient(colors: [.yellow,.green,.orange], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                
                GeometryReader{proxy in
                    
                    Circle()
                        .fill(.red.opacity(0.7))
                        .padding(70)
                        .blur(radius: 100)
                        .offset(y: -proxy.size.height / 2.8)
                    
                    
                }
            }
        
        )
    }
}

struct WaveMain_Previews: PreviewProvider {
    static var previews: some View {
        WaveMain()
    }
}

struct WaveForm : View{
    
    var color : Color
    var ampifiy : CGFloat
    
    let isRecived : Bool
    
    var body: some View{
        
        
        TimelineView(.animation){timeline in
            
            Canvas{contex,size in
                
                let timenow = timeline.date.timeIntervalSinceReferenceDate
                
                let angle = timenow.remainder(dividingBy: 2)
                
                let offset = angle * size.width
                
                contex.translateBy(x: isRecived ? -offset : offset, y: 0)
                
                
                contex.fill(getPaht(size: size),with:.color(color))
                
                contex.translateBy(x: -size.width, y: 0)
                contex.fill(getPaht(size: size), with: .color(color))
                contex.translateBy(x: size.width * 2, y: 0)
                contex.fill(getPaht(size: size), with: .color(color))
                
                
                
            }
            
            
            
        }
    }
    
    func getPaht(size : CGSize)->Path{
        
        
        return Path{path in
            
            let midH = size.height / 2
            let width = size.width
            path.move(to: CGPoint(x: 0, y: midH))
            
            path.addCurve(to: CGPoint(x: width, y: midH), control1: CGPoint(x: width * 0.4, y: width + ampifiy), control2: CGPoint(x: width * 0.65, y: width - ampifiy))
            
            
            path.addLine(to: CGPoint(x: width, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: size.height))
            
            
            
            
            
            
        }
    }
}
