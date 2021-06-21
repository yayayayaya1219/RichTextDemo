

import Foundation
import UIKit

class MsgMgr:NSObject{
    func sendNoti(msg:String){
        NotificationCenter.default.post(name: NSNotification.Name.Msg, object: msg)
    }
    
}

extension Notification.Name {
    static let Msg = Notification.Name("Msg_demo")
}


/*
class MsgModel:ObservableObject{
    @Published var name = ""
    @Published var undoLock = true
    @Published var redoLock = true
    var richText:RichText? = nil
    func SetCurrentRichText(rt:inout RichText){
        self.richText = rt
    }
    
    @objc func Sym(notification: Notification) {
        if(notification.object as! String == "F"){
            //AllSave(data: richText!, fileName: "pigTest.plist")
        }
     }
    func addNoti(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector( self.Sym( notification:)),
                   name: Notification.Name.Msg,
                   object: nil)
    }
}
 */
