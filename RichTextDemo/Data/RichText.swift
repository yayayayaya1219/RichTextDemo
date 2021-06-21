/*
 从本地中读文件到内存的相关方法
 */

import Foundation
import UIKit


//数据体
class RichText: ObservableObject{
    
    var datum:[DataModel]
    var title:String
    
    init(){
        datum = []
        title = "Untitled"
    }
}



//从文件中读取，返回RichText实例
func LoadRichText(_ fileName:String) -> RichText{
    
    CreateFile()
    
    let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true).first ?? ""
    let file = documentPath + "/" + fileName
    
    let patternFile = documentPath + "/Pattern/pigTestPattern.plist"
    print(documentPath)
    
    
    let rt = RichText()
    let fileUrl = NSURL(fileURLWithPath: file)
    let ary = NSMutableArray(contentsOf: fileUrl as URL)!
    
    rt.title = ary[0] as! String == "" ? "Untitled" : ary[0] as! String
    
    patternTable = NSMutableDictionary(contentsOfFile: patternFile) ?? [:]
    
    
    if(ary.count == 1){
        rt.datum.append(DataModel(text: "", type: 0, desireFirstResponser: false, BArray: [], IArray: [], UArray: [], SArray: [], height: heightForView(text: " ",font: UIFont.systemFont(ofSize: 18), width:  UIScreen.main.bounds.width-60)))
        return rt
    }
    else{
        
        for i in 1..<ary.count {
            //print(i)
            rt.datum.append(SetDataModel(text: ary[i] as! String, index: i, isFirstResponder: false))
        }
        //print(rt.datum[0])
    }
    
    return rt
}
 

//用正则表达式判断是否为图片
func isImage(_ block:String)->Bool{
    let regx = try? NSRegularExpression(pattern: imgRex , options: [])
    
    let num:Int = regx?.matches(in: block as String, options: [], range: NSRange(location: 0, length: block.count)).count ?? 0
    
    return (num != 0)
}

//返回图片的文件名
func GetImageName(_ block:String)->String{
    let a = block.index(block.startIndex,offsetBy: 5)
    
    let b = block.index(block.endIndex,offsetBy: -7)
    
    return String(block[a...b])
}

//默认情况下沙盒没有文件的处理
func CreateFile(){
    let manager = FileManager.default
    let urls: [URL] = manager.urls(for: .documentDirectory, in: .userDomainMask)
    // .libraryDirectory、.cachesDirectory ...
    let documentURL = urls.first!
    var url = documentURL.appendingPathComponent("Pattern", isDirectory: true)
    var isDirectory: ObjCBool = ObjCBool(false)
    let isExist = manager.fileExists(atPath: url.path, isDirectory: &isDirectory)
    if !isExist {
      do {
        try manager.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
        url = documentURL.appendingPathComponent("Pattern/pigTestPattern.plist", isDirectory: true)
        let dict:NSDictionary = [:]
        dict.write(to: url, atomically: true)
        url = documentURL.appendingPathComponent("pigTest.plist", isDirectory: true)
        let ary:NSArray = ["测试文件"]
        ary.write(to: url, atomically: true)
        
      } catch {
        print("createDirectory error:\(error)")
      }
    }
    
}




