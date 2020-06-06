//
//  ScrollableTextView.swift
//  Axrt
//
//  Created by troquer on 6/5/20.
//  Copyright © 2020 zourz. All rights reserved.
//  

import AppKit
import SwiftUI

class ScrollableTextView: NSScrollView {
    @IBOutlet var textView: NSTextView!
}

struct TextView: NSViewRepresentable {
    @Binding var text: String?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeNSView(context: Context) -> ScrollableTextView {
        var views: NSArray?
        Bundle.main.loadNibNamed("ScrollableText", owner: nil, topLevelObjects: &views)
        let scrollableTextView = views!.compactMap({ $0 as? ScrollableTextView }).first!
        scrollableTextView.textView.delegate = context.coordinator
        return scrollableTextView
    }
    
    func updateNSView(_ nsView: ScrollableTextView, context: Context) {
        nsView.textView.string = text ?? ""
    }
    
    class Coordinator: NSObject, NSTextViewDelegate {
        let parent: TextView
        
        init(_ textView: TextView) {
            self.parent = textView
        }
        
        func textDidChange(_ notification: Notification) {
            guard let textView = notification.object as? NSTextView else { return }
            self.parent.text = textView.string
        }
    }
    
}
