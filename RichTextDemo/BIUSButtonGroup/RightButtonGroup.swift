//
//  RightButtonGroup.swift
//  RichTextDemo
//
//  Created by 何嘉祺 on 2021/6/18.
//  


/*
 Undo Redo 照片功能的按钮和响应
 */

import UIKit

extension ViewController{
    func setUpRightButtonGroup()-> [UIBarButtonItem]{
        
        let imageButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageButton.setTitle("📷", for: .normal)
        //imageButton.setTitleColor(.blue, for: .normal)
        imageButton.addTarget(self, action: #selector(getImg), for: .touchUpInside)
        let img = UIBarButtonItem(customView: imageButton)
        
        let undoButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        undoButton.setTitle("⬅️", for: .normal)
        //undoButton.setTitleColor(.blue, for: .normal)
        undoButton.addTarget(self, action: #selector(undoButtonClick), for: .touchUpInside)
        let undo = UIBarButtonItem(customView: undoButton)
        
        let redoButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        redoButton.setTitle("➡️", for: .normal)
        //redoButton.setTitleColor(.blue, for: .normal)
        redoButton.addTarget(self, action: #selector(redoButtonClick), for: .touchUpInside)
        let redo = UIBarButtonItem(customView: redoButton)
        
        
        
        return [img,redo,undo]
    }
    
    @objc func undoButtonClick(){
        MsgMgr().sendNoti(msg: "Undo")
    }
    @objc func redoButtonClick(){
        MsgMgr().sendNoti(msg: "Redo")
    }
    
}
