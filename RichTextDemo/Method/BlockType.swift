//
//  BlockType.swift
//  RichTextDemo
//
//  Created by 何嘉祺 on 2021/6/18.
//  

let TYPE_TEXT = 0
let TYPE_IMAGE = 1

import Foundation
import UIKit

func blockType(_ str: String)->Int{
    
    var type = TYPE_TEXT
    
    if(isImage(str)){
        type = TYPE_IMAGE
    }
    
    return type
}
