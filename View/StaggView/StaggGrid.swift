//
//  StaggGrid.swift
//  StaggGrid
//
//  Created by nyannyan0328 on 2021/08/03.
//

import SwiftUI

struct StaggGrid<Content : View, T : Identifiable>: View where T : Hashable {
    
    var content : (T)-> Content
    var list : [T]
    var showIndicator : Bool
    var spacing : CGFloat
    var columns : Int
    
    init(columns : Int,spacing : CGFloat = 10,showIndicator : Bool = false,list : [T],@ViewBuilder content : @escaping(T) -> Content){
        
        
        self.columns = columns
        self.showIndicator = showIndicator
        self.list = list
        self.content = content
        self.spacing = spacing
        
        
        
        
    }
    
    func setupList()->[[T]]{
        
        var gridArray : [[T]] = Array(repeating: [], count: columns)
        
        var currentIndex : Int = 0
        
        
        for object in list{
            
            gridArray[currentIndex].append(object)
            
            if currentIndex == (columns - 1){currentIndex = 0}
            
            else{
                
                currentIndex += 1
            }
            
            
        }
        return gridArray
        
        
    }
    
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: showIndicator) {
            
            HStack(alignment:.top){
                
                ForEach(setupList(),id:\.self){columnsData in
                    
                    LazyVStack(spacing:spacing){
                        
                        ForEach(columnsData){object in
                            
                            
                            
                            content(object)
                        }
                    }
                    
                    
                }
            }
            .padding(.vertical)
        }
    }
}

struct StaggGrid_Previews: PreviewProvider {
    static var previews: some View {
        StaggMainView()
    }
}
