//
//  StaggMainView.swift
//  StaggMainView
//
//  Created by nyannyan0328 on 2021/08/03.
//

import SwiftUI

struct StaggMainView: View {
    @State var phto : [Photo] = []
    @State var columns : Int = 2
    
    @EnvironmentObject var model : AllViewModel
    var body: some View {
        NavigationView{
            
            StaggGrid(columns: columns, list: phto) {photo in
                
               photoCardView(photo: photo)
            }
            .padding(.horizontal)
            .navigationTitle("Stagged")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    
                    
                    Button {
                        
                        columns += 1
                        
                        
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                    }

                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    
                    
                    Button {
                        
                       columns = max(columns - 1, 1)
                        
                        
                    } label: {
                        Image(systemName: "minus")
                            .font(.title2)
                    }

                }
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    
                    Button("Cancel"){
                        
                        withAnimation{
                            model.show = false
                        }
                     
                            
                        
                        
                        
                    }
                    .transition(.move(edge: .bottom))
                    
                }
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            for index in 1...10{
                
                
                phto.append(Photo(PhotoURL: "p\(index)"))
            }
        }
    }
}

struct StaggMainView_Previews: PreviewProvider {
    static var previews: some View {
        StaggMainView()
    }
}

struct photoCardView : View{
    
    var photo : Photo
    
    var body: some View{
        
        Image(photo.PhotoURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
        
    }
}
