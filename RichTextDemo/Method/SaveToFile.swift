//
//  SaveToFile.swift
//  RichTextDemo
//
//  Created by 何嘉祺 on 2021/6/20.
//  


import Foundation

func AllSave(data:RichText,fileName:String){
    
    let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true).first ?? ""
    let file = documentPath + "/" + fileName
    
    let patternFile = documentPath + "/Pattern/pigTestPattern.plist"
    
    let dict:NSMutableDictionary = [:]
    
    let ary:NSMutableArray = []
    ary.insert(data.title, at: 0)
    for(i,value) in data.datum.enumerated(){
        if(value.BArray.count + value.IArray.count + value.UArray.count + value.SArray.count != 0){
            let tempAry = [value.BArray,value.IArray,value.UArray,value.SArray]
            dict.setValue(tempAry, forKey: String(i+1))
        }
        
        ary.add(data.datum[i].text)
    }
    
    dict.write(toFile: patternFile, atomically: true)
    ary.write(toFile: file, atomically: true)
    
    
}
