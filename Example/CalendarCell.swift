//
//  CalendarCell.swift
//  Example
//
//  Created by Joseph on 1/9/18.
//  Copyright © 2018 Joseph. All rights reserved.
//

import Foundation
import UIKit
import JTAppleCalendar

class CalendarCell: JTAppleCell {
    
    var dateLbl: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        dateLbl = UILabel.init(frame: bounds)
        dateLbl.textColor = UIColor.black
        dateLbl.textAlignment = .center
        addSubview(dateLbl)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
