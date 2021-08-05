//
//  PostMainView.swift
//  PostMainView
//
//  Created by nyannyan0328 on 2021/08/02.
//

import SwiftUI

struct PostMainView: View {
    @State var posts : [Post] = []
    @State var currentIndex : Int = 0
    @State var currentTab = "Slide Now"
    @Namespace var animation
    var body: some View {
        VStack{
            
            
            VStack(alignment: .leading, spacing: 15) {
                
                Button {
                    
                } label: {
                    
                   
                    Label {
                        Text("BACK")
                        
                    } icon: {
                        
                        Image(systemName: "chevron.left")
                        
                    }
                    .foregroundColor(.primary)
                    
                  
                }
                Text("My Wishes")
                    .font(.title)
                    .fontWeight(.black)

                
            }
            .frame(maxWidth:.infinity,alignment: .leading)
            
            
            HStack(spacing:0){
                
                
                TabButton(title: "Slide Now", animation: animation, currentTab: $currentTab)
                
                TabButton(title: "List", animation: animation, currentTab: $currentTab)
                
            
            }
            .background(Color.black.opacity(0.1))
            .cornerRadius(10)
            .padding(.horizontal)
            
            
            SnapCrousel(index: $currentIndex, items: posts) {post in
                
                
                
                GeometryReader{proxy in
                    
                    
                    let size = proxy.size
                    
                    Image(post.imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width)
                        .cornerRadius(10)
                }
                    
                
                
                
                
            }
            .padding(.vertical,40)
            
            HStack(spacing:10){
                
                ForEach(posts.indices,id:\.self){index in
                    
                    
                    Circle()
                        .fill(.blue.opacity(currentIndex == index ? 1  :0.1))
                        .frame(width: 10, height: 10)
                        .scaleEffect(currentIndex == index ? 2 : 1)
                        .animation(.spring(), value: currentIndex == index)
                    
                }
                
                
                
            }
            .padding(.bottom,40)
            
            
            
        }
        .padding()
        .frame(maxHeight:.infinity,alignment: .top)
        .onAppear {
            
            for index in 1...7{
                
                
                posts.append(Post(imageURL: "p\(index)"))
            }
        }
        
    }
}

struct PostMainView_Previews: PreviewProvider {
    static var previews: some View {
        PostMainView()
    }
}

struct TabButton : View{
    
    
    var title : String
    var animation : Namespace.ID
    @Binding var currentTab : String
    
    var body: some View{
        
        Button {
            withAnimation{
                
                currentTab = title
            }
        } label: {
            
            Text(title)
                .font(.title.italic())
                .foregroundColor(currentTab == title ? .white : .black)
                .frame(maxWidth:.infinity)
                .padding(.vertical,8)
                .background(
                
                    ZStack{
                        
                        if currentTab == title{
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.black)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                            
                        }
                    }
                
                )
            
        }

    }
}
