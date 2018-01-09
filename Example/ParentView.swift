//
//  ParentView.swift
//  Example
//
//  Created by Joseph on 1/9/18.
//  Copyright © 2018 Joseph. All rights reserved.
//

import Foundation
import UIKit
import JTAppleCalendar

class ParentView: UIView {
    
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    
    var formatter = DateFormatter()
    let currentDate = Date()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }
    
    private func setupViews() {
        calendarView.calendarDataSource = self
        calendarView.calendarDelegate = self
        
        calendarView.register(CalendarCell.self, forCellWithReuseIdentifier: "cellID")
    }
    
    
    
}




extension ParentView: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        
        guard calendar == self.calendarView, let cell = calendar.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as? CalendarCell else { return JTAppleCell() }
        
        cell.dateLbl.textColor = UIColor.black
        cell.dateLbl.text = cellState.text
        
        return cell
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        formatter.dateFormat = "yyyy MM dd"
        let endDate = formatter.date(from: "2018 01 12")! //just for now
        
        return ConfigurationParameters.init(startDate: currentDate, endDate: endDate)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        
    }
    
    
}





























