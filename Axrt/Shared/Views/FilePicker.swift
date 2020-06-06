//
//  FilePicker.swift
//  Axrt
//
//  Created by troquer on 6/5/20.
//  Copyright © 2020 zourz. All rights reserved.
//

import SwiftUI
struct FilePicker: View {
    @Binding var selectedURL: URL?
    var success: (URL) -> Void
    var body: some View {
        VStack {
            if selectedURL != nil {
                Text("Selected: \(selectedURL!.absoluteString)")
            } else {
                Text("No selection")
            }
            Button(action: {
                let panel = NSOpenPanel()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    let result = panel.runModal()
                    if result == .OK {
                        self.selectedURL = panel.url
                        self.success(panel.url!)
                    }
                }
            }) {
                Text("Select file")
            }
        }
    }

}
