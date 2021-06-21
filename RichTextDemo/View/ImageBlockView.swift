//
//  ImageBlockView.swift
//  RichTextDemo
//
//  Created by 何嘉祺 on 2021/6/18.
//  


import Foundation
import UIKit

class ImageBlockView:UITableViewCell{
    var image:UIImage? = nil
    var height:CGFloat = 0
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String? , fileName:String , index:Int) {
        
        image = LoadImage(fileName)
        
        height = richText.datum[index].height
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpImageBlockView()
        
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ImageBlockView{
    func setUpImageBlockView(){
        let imageView = UIImageView(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.width - 20, height: height))
        imageView.image = image
        contentView.addSubview(imageView)
    }
}



func LoadImage(_ fileName:String)->UIImage{
    let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true).first ?? ""
    let file = documentPath + "/Image/" + GetImageName(fileName)
    let defaultImg = documentPath + "/Image/default.png"
    print(file)
    
    let img = UIImage(named: file) ?? UIImage(named: defaultImg)
    
    return img!
}
