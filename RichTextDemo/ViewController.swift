

import UIKit



/*
 
 基础模块的全局变量
 
 */

//读文件信息到内存
var richText:RichText = LoadRichText("pigTest.plist")

//记录当前操作的块序号
var currentIndexPath:IndexPath = IndexPath(item: 0, section: 0)
var currentIndex = 0


//主界面
class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        navigationItem.title = richText.title  //文件名作为标题
        
        navigationItem.leftBarButtonItems = setUpBIUSButtonGroup()  //BIUS的相关按钮配置
        
        navigationItem.rightBarButtonItems = setUpRightButtonGroup() //Undo Redo和照片上传的相关按钮配置
        
        view.backgroundColor = .white //背景色白
        
        //tableView作为子视图覆盖屏幕
        view.addSubview(ListView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-20, height: UIScreen.main.bounds.height) , rt: &richText))
        
        
 
        
    }


}


