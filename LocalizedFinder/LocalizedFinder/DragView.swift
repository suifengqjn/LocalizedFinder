//
//  DragView.swift
//  LocalizedFinder
//
//  Created by qianjn on 2017/11/6.
//  Copyright © 2017年 SF. All rights reserved.
//

import Cocoa
import AppKit

protocol DragViewDelegate {
    func dragEnter();
    func dragExit();
    func dragFileOk(filePath:String);
}

class DragView: NSView {
    var delegate : DragViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    self.registerForDraggedTypes([NSPasteboard.PasteboardType.fileURL,NSPasteboard.PasteboardType.tiff,NSPasteboard.PasteboardType.URL])

    }
    
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        if let delegate = self.delegate {
            delegate.dragEnter()
        }
        return NSDragOperation.generic
    }
    
    override func draggingExited(_ sender: NSDraggingInfo?) {
        if let delegate = self.delegate {
            delegate.dragExit()
        }
    }
    
    override func prepareForDragOperation(_ sender: NSDraggingInfo) -> Bool {
        return true
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        //        var files = [URL]()
        var filePath = ""
//        if let board = sender.draggingPasteboard().propertyList(forType: NSFilenamesPboardType) as? NSArray {
//            for path in board {
//                filePath = path as! String
//            }
//        }
        
        var board = sender.draggingPasteboard() as NSPasteboard!;
        if let files = board?.propertyList(forType: NSPasteboard.PasteboardType.fileURL) as? NSArray {
            for path in files {
                print(path)
            }
        }
        
        //NSPasteboard.PasteboardType
        var draggedFilenames = sender.draggingPasteboard().propertyList(forType: NSPasteboard.PasteboardType.string)
        if let delegate = self.delegate {
            delegate.dragFileOk(filePath: filePath)
        }
        return true
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }


}
