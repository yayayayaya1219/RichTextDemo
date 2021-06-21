//
//  Extension.swift
//  RichTextDemo
//
//  Created by 何嘉祺 on 2021/6/17.
//


import Foundation
import UIKit

extension NSAttributedString{
    
    func ResetB()->Array<Int>{
        var ary: Array<Int> = []
        self.enumerateAttributes(in: NSMakeRange(0, self.string.count), options: NSAttributedString.EnumerationOptions(rawValue: 0)){(object, range, stop) in
            
            if object.keys.contains(NSAttributedString.Key.strokeWidth) {
                ary.append(range.location)
                ary.append(range.length)
            }
            
        }
        return ary
    }
    
    func ResetI()->Array<Int>{
        var ary: Array<Int> = []
        self.enumerateAttributes(in: NSMakeRange(0, self.string.count), options: NSAttributedString.EnumerationOptions(rawValue: 0)){(object, range, stop) in
            
            if object.keys.contains(NSAttributedString.Key.obliqueness) {
                ary.append(range.location)
                ary.append(range.length)
            }
            
        }
        return ary
    }
    
    func ResetU()->Array<Int>{
        var ary: Array<Int> = []
        self.enumerateAttributes(in: NSMakeRange(0, self.string.count), options: NSAttributedString.EnumerationOptions(rawValue: 0)){(object, range, stop) in
            
            if object.keys.contains(NSAttributedString.Key.underlineStyle) {
                ary.append(range.location)
                ary.append(range.length)
            }
            
        }
        return ary
    }
    
    func ResetS()->Array<Int>{
        var ary: Array<Int> = []
        self.enumerateAttributes(in: NSMakeRange(0, self.string.count), options: NSAttributedString.EnumerationOptions(rawValue: 0)){(object, range, stop) in
            
            if object.keys.contains(NSAttributedString.Key.strikethroughStyle) {
                ary.append(range.location)
                ary.append(range.length)
            }
            
        }
        return ary
    }
     
}



//图片压缩相关
extension UIImage {
    /**
     *  重设图片大小
     */
    func reSizeImage(reSize:CGSize)->UIImage {
        
        
        
        UIGraphicsBeginImageContext(reSize)
        
        //UIGraphicsBeginImageContextWithOptions(reSize,false,UIScreen.main.scale)
        
        self.draw(in: CGRect(x: 0, y: 0, width: reSize.width, height: reSize.height))
        
        let reSizeImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        return reSizeImage
    }
     
    /**
     *  等比率缩放
     */
    func scaleImage(_ size:CGSize)->UIImage {

        
        let scaleSize = (UIScreen.main.bounds.width - 100)  / max(size.height, size.width)
        
        let reSize = CGSize(width: self.size.width * scaleSize, height: self.size.height * scaleSize)
        print(reSize)
        return reSizeImage(reSize: reSize)
    }
    
}




/*
extension UIResponder {
    
    static func firstResponder() -> AnyObject? {
        currentFirstResponder = nil
        // 通过将target设置为nil，让系统自动遍历响应链
        // 从而响应链当前第一响应者响应我们自定义的方法
        UIApplication.shared.sendAction(#selector(findFirstResponder(_:)), to: nil, from: nil, for: nil)
        return currentFirstResponder
    
    }
    
    @objc func findFirstResponder(_ sender: AnyObject) {
        // 第一响应者会响应这个方法，并且将静态变量currentFirstResponder设置为自己
        currentFirstResponder = self
    }
}
 */
