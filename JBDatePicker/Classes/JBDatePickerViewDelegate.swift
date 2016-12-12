//
//  JBDatePickerViewDelegate.swift
//  JBDatePicker
//
//  Created by Joost van Breukelen on 17-10-16.
//  Copyright © 2016 Joost van Breukelen. All rights reserved.
//

import UIKit

public protocol JBDatePickerViewDelegate: class {
    
    /**
     Is called when the user selected a day
     - parameter dayView: the dayView the user selected
     - note:
     Implementing this method is mandatory
     */
    func didSelectDay(_ dayView: JBDatePickerDayView)
    
    /**
     Is called when the user swiped (or manually moved) to another month
     - parameter monthView: the monthView that is now 'on screen'
     - note:
     Implementing this method is optional.
     */
    func didPresentOtherMonth(_ monthView: JBDatePickerMonthView)
    
    
    /**
     Sets the day that determines which month is shown on inital load
     - note:
     Implementing this variable is optional. It's default is set the current date.
     */
    var dateToShow: Date {get}
 
    
    /**
     Sets the first day of the week. Return nil if you want to use the default for the current calendar 
     - note:
     Implementing this variable is optional. It's default is set to monday
     */
    var firstWeekDay: JBWeekDay {get}
    
    
    /**
     Determines if a month should also show the dates of the previous and next month
     - note:
     Implementing this variable is optional. It's default is set to true
     */
    var shouldShowMonthOutDates: Bool {get}
    
    /**
     Determines the height ratio of the weekDaysView compared to the total height
     
     - note:
     Implementing this variable is optional. It's default is set to 0.1 (10%)
     
     */
    var weekDaysViewHeightRatio: CGFloat {get}
    
    
    // MARK: - Text Color appearance properties
    
    ///color of any date label text that falls within the presented month
    var colorForDayLabelInMonth: UIColor { get }
    
    ///color of any date label text that falls out of the presented month and is part of the next or previous (but not presented) month
    var colorForDayLabelOutOfMonth: UIColor { get }
    
    ///color of the 'today' date label text
    var colorForCurrentDay: UIColor { get }
    
    ///color of any label text that is selected
    var colorForSelelectedDayLabel: UIColor { get }
    
    
    // MARK: - WeekdaysView appearance properties
    
    ///color of the bar which shows the 'mon' to 'sun' labels. Defaults to green. 
    var colorForWeekDaysViewBackground: UIColor { get }
    
    ///color of the labels in the WeekdaysView bar that say 'mon' to 'sun'. Defaults to white.
    var colorForWeekDaysViewText: UIColor { get }
    
    
    // MARK: - Selection Color appearance properties
    
    ///color of the selection circle for dates that aren't today
    var colorForSelectionCircleForOtherDate: UIColor { get }
    
    ///color of the selection circle for today
    var colorForSelectionCircleForToday: UIColor { get }
    
    ///color of the semi selected selection circle (that shows on a long press)
    var colorForSemiSelectedSelectionCircle: UIColor { get }
    
}

/**
 This protocol extension is used to make some of the delegate methods and variables optional by giving them a default implementation or value.
 */
public extension JBDatePickerViewDelegate {
    
    public func didPresentOtherMonth(_ monthView: JBDatePickerMonthView) {}
    
    
    // MARK: - General defaults
    
    public var dateToShow: Date { return Date()}
    public var firstWeekDay: JBWeekDay {
        
        if let calendarValue = JBWeekDay(rawValue: Calendar.current.firstWeekday){
            return calendarValue
        }
        else {
            return .monday
        }
    }
    
   public var shouldShowMonthOutDates: Bool { return true }
   public var weekDaysViewHeightRatio: CGFloat { return 0.1 }
    
    // MARK: - Color defaults
    
    public var colorForDayLabelInMonth: UIColor { return .darkGray }
    public var colorForDayLabelOutOfMonth: UIColor { return .lightGray }
    public var colorForCurrentDay: UIColor { return .red }
    public var colorForSelelectedDayLabel: UIColor { return .white }
    public var colorForWeekDaysViewBackground: UIColor { return  UIColor(red: 81.0/255.0, green: 182.0/255.0, blue: 185.0/255.0, alpha: 1.0) }
    public var colorForWeekDaysViewText: UIColor { return .white }
    public var colorForSelectionCircleForOtherDate: UIColor { return  UIColor(red: 81.0/255.0, green: 182.0/255.0, blue: 185.0/255.0, alpha: 1.0) }
    public var colorForSelectionCircleForToday: UIColor { return UIColor(red: 255.0/255.0, green: 98.0/255.0, blue: 89.0/255.0, alpha: 1.0) }
    public var colorForSemiSelectedSelectionCircle: UIColor { return UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0) }
}