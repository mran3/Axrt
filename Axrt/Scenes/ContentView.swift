//
//  ContentView.swift
//  Axrt
//
//  Created by troquer on 6/4/20.
//  Copyright © 2020 zourz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var desiredTextViewHeight: CGFloat?
    @State private var completeText: String = ""
    @State var loadedFile: URL?
    var viewModel: ContentViewModel = ContentViewModel()
    
    var body: some View {
        
        VStack{
            Spacer()
            FilePicker(selectedURL: $loadedFile){ loadedURL in
//                print(loadedURL.absoluteString)
                self.viewModel.readFile(fileURL: loadedURL)
            }
            TextView(text: $completeText)
            Spacer()
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
