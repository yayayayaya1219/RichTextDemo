

import Foundation
import UIKit


//数据模型，包括BIUS样式信息，计算出来的frame高度，数据的种类等
struct DataModel :Hashable{

    let id = UUID()
    
    //字符串
    var text:String {
        
        willSet(newText){
            
            //计算frame所需的高度
            self.height = heightForView(text: newText, font: UIFont.systemFont(ofSize: 18), width: UIScreen.main.bounds.width - 20)
        }
        
    }
    
    var type:Int //字符串的种类（文字？图片？）
    
    var desireFirstResponser:Bool //是否需要作为第一响应者
    
    var BArray:Array<Int> //加粗的范围
    var IArray:Array<Int> //斜体的范围
    var UArray:Array<Int> //下划线的范围
    var SArray:Array<Int> //删除线的范围
    var height:CGFloat    //高度
    
}


//封装一个DataModel
func SetDataModel(text:String, index:Int , isFirstResponder:Bool) ->DataModel{
    
    var model =  DataModel(text: text, type:0, desireFirstResponser: false, BArray: [], IArray: [], UArray: [], SArray: [], height: 0.0)
    
    model.type = blockType(text)
    
    model.desireFirstResponser = isFirstResponder
    
    model.height = heightForView(text: text, font: UIFont.systemFont(ofSize: 18), width:UIScreen.main.bounds.width - 20)
    
    if(patternTable[String(index)] == nil){
        return model
    }
    
    let ary = patternTable[String(index)] as! NSMutableArray
    model.BArray = ary[0] as! Array
    model.IArray = ary[1] as! Array
    model.UArray = ary[2] as! Array
    model.SArray = ary[3] as! Array
    
    
    return model
}


//高度计算的方法
func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
       
    
    guard blockType(text) != TYPE_TEXT else {
        let view:UITextView = UITextView(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        view.font = font
        view.text = text
        view.sizeToFit()
        return view.frame.height
    }
       
    guard blockType(text) != TYPE_IMAGE else {
        let image = LoadImage(text)
        let imageView = UIImageView()
        imageView.image = image
        imageView.sizeToFit()
        //print(imageView.frame.height)
        return imageView.frame.height
    }
    
       return 0
   }
