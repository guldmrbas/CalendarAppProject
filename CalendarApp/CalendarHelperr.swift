import Foundation
import UIKit

class CalendarHelperr{
    let calendar = Calendar.current
    
    
    func plusMonth(date : Date) -> Date{
        return calendar.date(byAdding: .month , value : 1 , to: date)!
        
    }
    func minsMonth(date : Date) -> Date{
        return calendar.date(byAdding: .month , value : -1 , to: date)!
        
    }
    func monthString(date : Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: date)
        
    }
    func yearString(date : Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
        
    }
    func daysInMonth(date : Date) -> Int{
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    func daysOfMonth(date : Date) -> Int{
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    func firstOfMonth(date : Date) -> Date{
        let components = calendar.dateComponents([.year , .month], from: date)
        return calendar.date(from: components)!
    }
    func weekDay(date : Date) -> Int{
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday! - 1
    }
    /*
     Ay ekleme veya çıkarma (plusMonth, minsMonth)
     Ayın adını veya yılını metin olarak alma (monthString, yearString)
     Bir ayın gün sayısını veya belirli bir tarihin gününü alma (daysInMonth, daysOfMonth)
     Bir ayın ilk gününü bulma (firstOfMonth)
     Belirli bir tarihin haftanın hangi günü olduğunu bulma (weekDay)
     */
    
}
