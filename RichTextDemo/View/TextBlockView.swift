
import UIKit

//https://medium.com/@georgetsifrikas/embedding-uitextview-inside-uitableviewcell-9a28794daf01

class TextBlockView: UITableViewCell{
    
    var index:Int //行号
    
    var model:DataModel //数据模型
    
    var notiName = ""  //接收到的消息种类
    
    var blockView = UITextView() //视图
    
    var currentView:UITextView? = nil  //当前状态视图
    
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String? , index: Int , data:DataModel) {
        
        self.index = index
        self.model = data
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpTextBlockView()
        
        if(data.desireFirstResponser){
            blockView.becomeFirstResponder()
        }
        

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
    
}


//初始设置
extension TextBlockView{
    
    func setUpTextBlockView(){
        
        blockView = UITextView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: richText.datum[index].height))
        
        
        
        
        blockView.attributedText = setUpAttributeString()
        blockView.font = .systemFont(ofSize: 18)
        
        blockView.delegate = self
        
        blockView.isEditable = true
    
        contentView.addSubview(blockView)
        
        
    }
    
    //设置样式相关
    func setUpAttributeString()->NSAttributedString{
        
        let astr = NSMutableAttributedString(string: model.text)
        
        for i in stride(from: 0, through:model.BArray.count, by: 2){
            if(i == model.BArray.count){break}
            print(model.text)
            print(model.BArray.count)
            astr.addAttribute(NSAttributedString.Key.strokeWidth , value: -3, range: NSMakeRange(model.BArray[i] , model.BArray[i+1]))
            }
            
            for i in stride(from: 0, through:model.IArray.count, by: 2){
                if(i == model.IArray.count){break}
                astr.addAttribute(NSAttributedString.Key.obliqueness , value:0.3, range:NSMakeRange(model.IArray[i] , model.IArray[i+1]))
            }
            
            for i in stride(from: 0, through:model.UArray.count, by: 2){
                if(i == model.UArray.count){break}
                astr.addAttribute(NSAttributedString.Key.underlineStyle , value: 1, range: NSMakeRange(model.UArray[i] , model.UArray[i+1]))
            }
            
            for i in stride(from: 0, through:model.SArray.count - 1 != -1 ? 0 :model.SArray.count, by: 2){
                if(i == model.SArray.count){break}
                astr.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(model.SArray[i] , model.SArray[i+1]) )
            }
        
        
        
        return astr
    }
}

// 获取父视图
extension TextBlockView {
    //返回cell所在的UITableView
    func superTableView() -> UITableView? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let tableView = view as? UITableView {
                return tableView
            }
        }
        return nil
    }
}

//响应方法的相关
extension TextBlockView{
    
    func ReSetAttribute(str:NSAttributedString){
        model.BArray = str.ResetB()
        model.IArray = str.ResetI()
        model.UArray = str.ResetU()
        model.SArray = str.ResetS()
    }
    
    
    func Res(str:String){
        switch str {
        
        case "B":do {
            print("B")
            currentView?.attributedText = SetBold(view: currentView!, theRange: GetSelected())
        }
    
        case "I":do {
            print("I")
            currentView?.attributedText = SetItalics(view: currentView!, theRange: GetSelected())
        }
            
        case "U":do {
            print("U")
            currentView?.attributedText = SetUnderline(view: currentView!, theRange: GetSelected())
        }
        
        case "S":do {
            print("S")
            currentView?.attributedText = SetBold(view: currentView!, theRange: GetSelected())
        }
        
        case "Undo":do{
            currentView?.attributedText = Undo()
            
        }
        case "Redo":do{
            currentView?.attributedText = Redo()
        }
        
        default:
            print("无关指令")
        }
    }
    
    @objc func Res(notification: Notification) {
         //let url = notification.userInfo?[URLContainer.urlKey]
        
        self.notiName = notification.object as! String
        //self.GetSelected()
        
        
        if(Int(notiName) != nil){return}
        Res(str: notiName)
        if(notiName == "Undo" || notiName == "Redo"){
            
        }
        else{
            ReSetAttribute(str: (currentView?.attributedText)!)
        }
    
    }
    
    func insertRow(){
        

        
        currentIndexPath.row += 1
        currentIndex = currentIndexPath.row
        
        richText.datum.insert(SetDataModel(text: "", index: index + 1 , isFirstResponder: true), at: index+1)
        superTableView()?.insertRows(at: [currentIndexPath], with: .automatic)
        
       
        
       
        
        superTableView()?.beginUpdates()
        superTableView()?.endUpdates()
        
        
    }
    
    func removeRow(){
        let indexPath = superTableView()?.indexPath(for: self)
        
        let row = indexPath?.row ?? -1
        
        
        //superTableView()?.beginUpdates()
        
        if indexPath?.row == 0 {
            richText.datum[row+1].desireFirstResponser = true
            currentIndexPath = IndexPath(row: row+1, section: 0)
            currentIndex = currentIndexPath.row
           
        }
        
        else{
            
            richText.datum[row-1].desireFirstResponser = true
            currentIndexPath = IndexPath(row: row-1, section: 0)
            currentIndex = currentIndexPath.row
            
        }
        
        
        richText.datum.remove(at: index)
        
        
        superTableView()?.deleteRows(at: [indexPath!], with: .automatic)
        
        //superTableView()?.endUpdates()
        
        superTableView()?.reloadData()
        
    }
    
    
}


