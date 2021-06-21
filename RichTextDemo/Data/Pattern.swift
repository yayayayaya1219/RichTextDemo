


import UIKit


var patternTable:NSMutableDictionary = [:]//临时存放一些样式

let imgRex = "<img>[^\\^]*?</img>" //图片格式的正则表达式


/*
 
 设置pattern的相关方法
 
 */

func SetBold(view:UITextView , theRange:NSRange)->NSAttributedString{
    let astr = NSMutableAttributedString(attributedString: view.attributedText)
    
    astr.enumerateAttributes(in: theRange, options: NSAttributedString.EnumerationOptions(rawValue: 0)){(object, range, stop) in
        
        if object.keys.contains(NSAttributedString.Key.strokeWidth) {
            
            astr.removeAttribute(NSAttributedString.Key.strokeWidth, range: range)
            
        }
        else{
            astr.addAttribute(NSAttributedString.Key.strokeWidth, value: -3, range: range)
        }
    }
    return astr
}

func SetItalics(view:UITextView , theRange:NSRange)->NSAttributedString{
    let astr = NSMutableAttributedString(attributedString: view.attributedText)
    
    astr.enumerateAttributes(in: theRange, options: NSAttributedString.EnumerationOptions(rawValue: 0)){(object, range, stop) in
        
        if object.keys.contains(NSAttributedString.Key.obliqueness) {
            /*
            ary.append(range.location)
            ary.append(range.length)
             */
            astr.removeAttribute(NSAttributedString.Key.obliqueness, range: range)
            
        }
        else{
            astr.addAttribute(NSAttributedString.Key.obliqueness, value: 0.3, range: range)
        }
    }
    return astr
}

func SetUnderline(view:UITextView , theRange:NSRange)->NSAttributedString{
    let astr = NSMutableAttributedString(attributedString: view.attributedText)
    
    astr.enumerateAttributes(in: theRange, options: NSAttributedString.EnumerationOptions(rawValue: 0)){(object, range, stop) in
        
        if object.keys.contains(NSAttributedString.Key.underlineStyle) {
            
            astr.removeAttribute(NSAttributedString.Key.underlineStyle, range: range)
            
        }
        else{
            astr.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: range)
        }
    }
    return astr
}

func SetStroke(view:UITextView , theRange:NSRange)->NSAttributedString{
    
    let astr = NSMutableAttributedString(attributedString: view.attributedText)
    
    astr.enumerateAttributes(in: theRange, options: NSAttributedString.EnumerationOptions(rawValue: 0)){(object, range, stop) in
        
        if object.keys.contains(NSAttributedString.Key.strikethroughStyle) {
            
            astr.removeAttribute(NSAttributedString.Key.strikethroughStyle, range: range)
            
        }
        else{
            astr.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: range)
        }
    }
    return astr
    
}



 
