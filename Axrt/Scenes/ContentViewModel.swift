//
//  ContentViewModel.swift
//  Axrt
//
//  Created by troquer on 6/5/20.
//  Copyright © 2020 zourz. All rights reserved.
//

import Foundation
class ContentViewModel: ObservableObject {
    let file = "file.txt" //this is the file. we will write to and read from it
    let text = "some text" //just a text
    @Published var loadedText: String?
    
    func createFile() {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            
            //writing
            do {
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
            } catch {/* error handling here */}
        }
    }
    
    func readFile(fileURL: URL) {
        //reading
        do {
            loadedText = try String(contentsOf: fileURL, encoding: .utf8)
            print(loadedText as Any)
        } catch {/* error handling here */}
    }
    
}
