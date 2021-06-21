//
//  BIUSButtonGroup.swift
//  RichTextDemo
//
//  Created by 何嘉祺 on 2021/6/17.
//  


import UIKit

extension ViewController{
    
    func setUpBIUSButtonGroup() -> [UIBarButtonItem]{
        
        let bButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        bButton.setTitle("B", for: .normal)
        bButton.setTitleColor(.blue, for: .normal)
        bButton.addTarget(self, action: #selector(bClick(sender:)), for: .touchUpInside)
        let b = UIBarButtonItem(customView: bButton)
        
        let iButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        iButton.setTitle("I", for: .normal)
        iButton.setTitleColor(.blue, for: .normal)
        iButton.addTarget(self, action: #selector(iClick(sender:)), for: .touchUpInside)
        let i = UIBarButtonItem(customView: iButton)
        
        let uButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        uButton.setTitle("U", for: .normal)
        uButton.setTitleColor(.blue, for: .normal)
        uButton.addTarget(self, action: #selector(uClick(sender:)), for: .touchUpInside)
        let u = UIBarButtonItem(customView: uButton)
        
        let sButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        sButton.setTitle("S", for: .normal)
        sButton.setTitleColor(.blue, for: .normal)
        sButton.addTarget(self, action: #selector(sClick(sender:)), for: .touchUpInside)
        let s = UIBarButtonItem(customView: sButton)
        
        return [b,i,u,s]
    }
    
    @objc fileprivate func bClick(sender:UIButton) {
            //sender.isSelected = !sender.isSelected
        MsgMgr().sendNoti(msg: "B")
        }
    
    @objc fileprivate func iClick(sender:UIButton) {
            //sender.isSelected = !sender.isSelected
        MsgMgr().sendNoti(msg: "I")
            
        }
    
    @objc fileprivate func uClick(sender:UIButton) {
            //sender.isSelected = !sender.isSelected
        MsgMgr().sendNoti(msg: "U")
            
        }
    
    @objc fileprivate func sClick(sender:UIButton) {
            //sender.isSelected = !sender.isSelected
        MsgMgr().sendNoti(msg: "S")
            
        }
    
   
    
}
