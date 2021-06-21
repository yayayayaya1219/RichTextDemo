import UIKit

//照片选择器相关
extension ViewController {
        var selectorController: UIAlertController {
            let controller = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            controller.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil)) // 取消按钮
            controller.addAction(UIAlertAction(title: "拍照选择", style: .default) { action in
            self.selectorSourceType(type: .camera)
            }) // 拍照选择
            controller.addAction(UIAlertAction(title: "相册选择", style: .default) { action in
            self.selectorSourceType(type: .photoLibrary)
            }) // 相册选择
        return controller
    }
    
    @objc func getImg(){
        present(selectorController, animated: true, completion: nil)
        //showImage()
        //print("getImg")
        
    }
    
    func selectorSourceType(type: UIImagePickerController.SourceType) {
        imagePickerController.sourceType = type
        // 打开图片选择器
        present(imagePickerController, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: 图片选择器界面
    var imagePickerController: UIImagePickerController {
        get {
            let imagePicket = UIImagePickerController()
            imagePicket.delegate = self
            imagePicket.sourceType = .photoLibrary
            return imagePicket
        }
    }
   
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("选了照片")
        
        
       
        let img = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue)] as? UIImage // 显示图片
        
        var resizeImg = img
        
        if max(img?.size.height ?? 0.0, img?.size.width ?? 0.0) > UIScreen.main.bounds.width - 100{
            resizeImg = img?.scaleImage((img?.size)!)
        }
        
        let text = downLoadImageAndReturnName(resizeImg!)
        
        showImage(text)
        
        
        dismiss(animated: true, completion: nil) // 选中图片, 关闭选择器...这里你也可以 picker.dismissViewControllerAnimated 这样调用...但是效果都是一样的...
    }
    
    // MARK: 当点击图片选择器中的取消按钮时回调
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("取消选图")
        picker.dismiss(animated: true, completion: nil) // 效果一样的...
    }
}

extension ViewController{
    
    func showImage(_ text:String){
        
        var listView:UIView? = nil
        var tableView:UITableView? = nil
        
        for sub in view.subviews{
            if type(of: sub) == ListView.self {
                listView = sub
            }
        }
        
        for sub in listView!.subviews {
            if type(of: sub) == UITableView.self {
                tableView = sub as? UITableView
            }
        }
        print("当前块为\(currentIndexPath)")
        
        
    
        richText.datum.insert(SetDataModel(text: text, index: currentIndexPath.row+1, isFirstResponder: true), at: currentIndexPath.row+1)
        
        tableView?.insertRows(at: [currentIndexPath], with: .automatic)
        
        tableView?.reloadData()
        
        
    }
    
}


func downLoadImageAndReturnName(_ image:UIImage) -> String{
    
    let resizeImg = image
    
    /*
    if image.size.height > UIScreen.main.bounds.width || image.size.width > UIScreen.main.bounds.width {
        resizeImg  = image.scaleImage(image.size)
    }
     */
    
    
    let name = String("\(NSDate().timeIntervalSince1970).png")
    
    let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true).first ?? ""
    let path = "\(documentPath)/Image/\(name)"
    print(path)
    try? resizeImg.pngData()?.write(to: URL(fileURLWithPath: path))
    
    return "<img>\(name)</img>"
    
    
    
   
}
