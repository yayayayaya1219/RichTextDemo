

import UIKit
class ListView:UIView{
    

    
    
    var richText:RichText
    var listView = UITableView()
    
    
    init(frame: CGRect , rt: inout RichText) {
        richText = rt
        super.init(frame: frame)
        
        
        setUpListView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension ListView{
    
    func setUpListView(){
        
        listView = UITableView.init(frame: bounds,style: .plain)
        listView.dataSource = self
        
        listView.delegate = self
        
        listView.register(TextBlockView.self, forCellReuseIdentifier: ".")
    
       
        listView.register(ImageBlockView.self, forCellReuseIdentifier: "..")
        
        listView.dragInteractionEnabled = true
        
        listView.dragDelegate = self
        
        addSubview(listView)
    }
}

extension ListView:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("数量是\(richText.datum.count)")
        return richText.datum.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        var cell:Any? = nil
        
        if richText.datum[row].type == TYPE_TEXT{
            cell = TextBlockView(style: .default, reuseIdentifier: "\(row)", index:row , data: richText.datum[row])
            
            
        }
        
        else {
            cell = ImageBlockView(style: .default, reuseIdentifier: "\(row)", fileName:richText.datum[row].text , index: row)
        }
        
        
        return cell as! UITableViewCell
        
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //拖拽相关
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath){
        
        //print("发生了拖动从\(sourceIndexPath)到\(destinationIndexPath)")
        
        let first = sourceIndexPath.row
        let des = destinationIndexPath.row
        
        
        
        if(first == des){}
        else if(des > first){
            richText.datum.insert(richText.datum[first], at: des+1)
            richText.datum.remove(at: first)
        }
        else{
            richText.datum.insert(richText.datum[first], at: des)
            richText.datum.remove(at: first+1)
        }

        
        tableView.reloadData()
    
        
        
        AllSave(data:richText,fileName:"pigTest.plist")
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    /*
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
     */
    
    
      
   
}



 








//dataSource提供的方法
/*
 tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath):
 初始化和复用指定索引位置的UITableViewCell，必须实现。
 tableView(_ tableView: UITableView, numberOfRowsInSection section: Int):
 设置某一章节（section）中的单元格数量，必须实现。
 numberOfSections(in tableView: UITableView):
 设置表格中的章节（section）个数。
 tableView(_ tableView: UITableView, titleForHeaderInSection section: Int):
 设置指定章节的标题文字，如果不设置或代理返回值为nil，不显示。
 tableView(_ tableView: UITableView, titleForFooterInSection section: Int):
 设置章节脚部标题文字，如果不设置或代理返回值为nil，不显示。
 tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath):
 设置表格中指定索引位置的cell是否可编辑，可编辑的cell会显示插入和删除的图标。
 tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath):
 当完成插入或删除操作时会调用此方法。
 tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath):
 设置指定索引位置的cell是否可以通过拖动的方式，改变它的位置。
 tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath):
 当cell从一个位置拖动到另一个位置时调用此方法。
 
 */

//data Delegate提供的方法
/*
 tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath):
 设置单元格高度，每当表格需要显示时，都会调用此方法。
 tableView(_ tableView: UITableView, heightForHeaderInSection section: Int)：
 设置某一索引下的章节头部的高度。
 tableView(_ tableView: UITableView, heightForFooterInSection section: Int):
 设置某一索引下的章节尾部的高度。
 tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath):
 当指定索引位置上的单元格即将显示时，调用此方法。此方法是委托对象有机会在单元格显示之前重写其状态属性，如背景颜色等。
 tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath):
 当用户点击选择指定索引位置的单元格时，调用此方法。
 tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath):
 当用户点击一个已经被选中的单元格时，调用此方法。
 */
