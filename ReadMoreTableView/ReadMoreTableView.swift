//
//  ReadMoreTableView.swift
//  ReadMoreTableView
//
//  Created by Nitin Bhatia on 13/12/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit

class ReadMoreTableView : NSObject,UITableViewDelegate,UITableViewDataSource{
    
    var tblView : UITableView
    var text = ["Lorem Ipsum i am end","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum i am end","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries. I am end","hello by i am end"]
    var isExpanded : [Bool] = []
    
    init(tableView: UITableView) {
        self.tblView = tableView
        self.tblView.tableFooterView = UIView()
        
        for _ in 0...text.count - 1{
            isExpanded.append(false)
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return text.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.img.image = #imageLiteral(resourceName: "sampleImage")
        cell.lblText.text = text[indexPath.row]
        
        cell.btnReadMore.tag = indexPath.row
        cell.btnReadMore.addTarget(self, action: #selector(readMore(_:)), for: .touchUpInside)
        
        let textheight = cell.lblText.text?.height(withConstrainedWidth: cell.lblText.frame.width, font: cell.lblText.font)
        
        
        if(!isExpanded[indexPath.row]){
            cell.lblText.numberOfLines = 2
            cell.lblText.lineBreakMode = .byTruncatingTail
            cell.btnReadMore.setTitle("Read More", for: .normal)
            
        } else {
            cell.lblText.numberOfLines = 0
            cell.lblText.lineBreakMode = .byWordWrapping
            cell.btnReadMore.setTitle("Read Less", for: .normal)
        }
        
       
        
        if ((cell.lblText.intrinsicContentSize.height < textheight!) && (!isExpanded[indexPath.row])) {
            
                cell.btnReadMore.isHidden = false
            
        }else{
            if(!isExpanded[indexPath.row]){
                cell.btnReadMore.isHidden = true
            }
        }
        
        return cell
    }
    
    @objc func readMore(_ sender: UIButton){
       
        let indexPath : IndexPath = IndexPath(row: sender.tag, section: 0)
        
        if(!isExpanded[sender.tag]){
            isExpanded[sender.tag] = true
        } else {
            isExpanded[sender.tag] = false
        }
        tblView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}

extension String {
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return boundingBox.height
    }
}
