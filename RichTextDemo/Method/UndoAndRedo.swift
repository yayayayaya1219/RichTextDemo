//
//  UndoAndRedo.swift
//  RichTextDemo
//
//  Created by 何嘉祺 on 2021/6/21.
//  


import Foundation

let maxLen = 50
var UndoAndRedoList:Array<NSAttributedString> = []
var currentState = 0

func InitUndoAndRedoList(_ str:NSAttributedString){
    UndoAndRedoList.removeAll()
    UndoAndRedoList.append(str)
    currentState = 0
}

func UpdateState(str:NSAttributedString){
    clarifyRedo()
    
    UndoAndRedoList.insert(str, at: 0)
    
    if(UndoAndRedoList.count > maxLen){
        UndoAndRedoList.remove(at: UndoAndRedoList.count - 1)
    }
}

func Undo()->NSAttributedString{
    if(UndoAndRedoList.count - 1 == currentState){
        
    }
    else{
        currentState += 1
    }
    return UndoAndRedoList[currentState]
    
}

func Redo()->NSAttributedString{
    if(currentState <= 0){
        
    }
    else{
        currentState -= 1
    }
    return UndoAndRedoList[currentState]
}

func clarifyRedo(){
    if(currentState <= 0){return}
    for _ in [0..<currentState]{
        UndoAndRedoList.remove(at: 0)
    }
    currentState = 0
}
