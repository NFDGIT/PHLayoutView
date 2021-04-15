//
//  PHLayoutView.swift
//  PHLayoutView
//
//  Created by MIAO on 2021/4/15.
//

import UIKit
import SnapKit
public class PHLayoutView: UIView {
    
    /// 布局对象
    public var layout  : PHLayout = PHLayout.init()
    /// 一共有多少个单元
    public var numberOfCell:(()->(Int))?
    /// 选择每个单元的回调
    public var selectedCell:((Int)->())?
    /// 每个单元的内容
    public var cellForIndex:((Int)->(UIView))?
    /// 每个单元的高度
//    var heightOfCell:((Int)->(Double))?
    
    
    public init() {
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.white
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func reload()  {
        var iterator = self.subviews.makeIterator()
        while let ele = iterator.next(){
            ele.removeFromSuperview()
        }
        
        self.reloadForCollection()


    }

    private func reloadForCollection()  {
  
        
        var leftTem : UIView?
        var topTem : UIView?
        for index in 0..<self.numberOfCell!() {
            
            let view = self.cellForIndex!(index)
            view.tag = 100 + index
            if view.isKind(of: UIButton.classForCoder())
            {
                (view as! UIButton).addTarget(self, action: #selector(itemClick(sender:)), for: .touchUpInside)
                
            }
            
            self.addSubview(view)
            
            let totalColumn = self.layout.column == 0 ? self.numberOfCell!() : self.layout.column
            
            // 当前咧
            let currentColumn = index  % totalColumn
            
            view.snp.makeConstraints { (make) in
                if self.layout.column == -1 { // 宽不指定 高也不指定 从左往右 从上往下布局
                    
                    
                    
                }else if (self.layout.column == 0) { // 高等于父视图 宽不指定
                    make.top.equalToSuperview()
                    make.bottom.equalToSuperview()
                    
                    make.left.equalTo(leftTem == nil ? 0 : (leftTem?.snp.right)!)
                    make.height.equalToSuperview()
                    
                    leftTem = view
                    
                    if index+1 == self.numberOfCell!() {
                        make.right.equalToSuperview();
                    }
                }else if self.layout.column >  0 { // 宽指定 高不指定
                    make.left.equalTo(leftTem == nil ? 0 : (leftTem?.snp.right)!)
                    make.top.equalTo(topTem == nil ? 0 : ((topTem?.snp.bottom)!))
                    
                    make.width.equalToSuperview().dividedBy(self.layout.column)
                    if index+1 == self.numberOfCell!() {
                        make.bottom.equalToSuperview();
                    }
                                       
                    leftTem = view
                    // 当当前列在最后一列时
                    if currentColumn == totalColumn-1 {leftTem = nil;topTem = view}
                }
            
            }
        }
    }
    
    @objc func itemClick(sender:UIButton) {
        if self.selectedCell != nil
        {
            self.selectedCell!(sender.tag - 100)
        }
    }
}

public class PHLayout: NSObject {
    public var margin: UIEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    public var space : CGSize = CGSize.init(width: 0, height: 0)
    public var minCellSize : CGSize = CGSize.init(width: 20, height: 20)
    
    public var isAutoHeight : Bool = false // true 高度 由外部指定 仅对 table 类型有效
    
    public var column : Int = 1 //  当为0时:由左向右 ,,当为1时从上往下排列 ,,
}
