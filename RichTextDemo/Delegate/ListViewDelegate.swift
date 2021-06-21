


import Foundation
import UIKit
extension ListView:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //print("计算高度")
        return richText.datum[indexPath.row].height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("点击了\(indexPath.row)号block")
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        //print("删掉了")
        richText.datum.remove(at: indexPath.row)
        tableView.reloadData()
        
        AllSave(data: richText, fileName: "pigTest.plist")
        
    }
    
    
}


extension ListView:UITableViewDragDelegate{
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        //print("拖")
        return session.items
    }
    
   
    
}
