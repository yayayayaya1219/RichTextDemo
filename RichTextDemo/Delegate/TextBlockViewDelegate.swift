
import Foundation
import UIKit

extension TextBlockView:UITextViewDelegate{
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        
        currentIndexPath = (superTableView()?.indexPath(for: self)) ??  currentIndexPath
        print("currentIndexPath:\(currentIndexPath)")
        index = currentIndexPath.row
        richText.datum[index].desireFirstResponser = false
        
        print("开始编辑\(index)")
        currentView = textView
        
        addNoti()
        InitUndoAndRedoList(textView.attributedText)
    }
    
    
    func addNoti(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector( self.Res( notification:)),
                   name: Notification.Name.Msg,
                   object: nil)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" && GetSelected().location == textView.text.count{
            
                insertRow()
            
                return false
            }
        
        
        if text == "" && textView.text.count == 0 && richText.datum.count != 1{
            
            removeRow()
            
            return false
        }
        
    
        return true
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        
        //currentIndexPath = (superTableView()?.indexPath(for: self))!
        
        //index = currentIndexPath.row
        
        currentView = textView
        
        //print("状态改变")
        //print(textView)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        currentIndexPath = (superTableView()?.indexPath(for: self))!
        //print("当前IndexPath\(currentIndexPath)")
        model.text = textView.text
        richText.datum[index].text = textView.text
        richText.datum[index].desireFirstResponser = false
        blockView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: richText.datum[index].height)
        
        superTableView()?.beginUpdates()
        superTableView()?.endUpdates()
        
        
        UpdateState(str: textView.attributedText)
        clarifyRedo()
    }

    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        
        index = superTableView()?.indexPath(for: self)?.row ?? -1
        
        ReSetAttribute(str: textView.attributedText)
        
        NotificationCenter.default.removeObserver(self)
        
        //MsgMgr().sendNoti(msg: "F")
        
        AllSave(data:richText,fileName:"pigTest.plist")
        
        
        print("结束编辑并且撤除监听")
        
        return true
    }
    
    
    func GetSelected()->NSRange{
        return currentView!.selectedRange
    }
    
}
