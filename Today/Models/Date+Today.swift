//
//  Date+Today.swift
//  Today
//
//  Created by 백대홍 on 2023/03/27.
//

import Foundation

extension Date {
    var dayAndTimeText: String {
        let timeText = formatted(date: .omitted, time: .shortened) //시간의 문자열 표현을 만들고 그 결과를 timeText라는 상수에 할당
        if Locale.current.calendar.isDateInToday(self) {
            let timeFormat = NSLocalizedString("Today at %@", comment: "Today at time format string")
            return String(format: timeFormat, timeText)
        } else {
            let dateText = formatted(.dateTime.month(.abbreviated).day()) //날짜의 문자열 표현을 만들고 그 결과를 dateText라는 상수에 할당합니다
            let dateAndTimeFormat = NSLocalizedString("%@ at %@", comment: "Date and time format string")
            return String(format: dateAndTimeFormat, dateText, timeText) //날짜 및 시간 텍스트에 적용하여 문자열을 만들고 결과를 반환합니다.
            
        }
    }
    var dayText: String {
        if Locale.current.calendar.isDateInToday(self) {
            return NSLocalizedString("Today", comment: "Today due date description")
            
        } else {
            return formatted(.dateTime.month().day().weekday(.wide))
            //이 날짜가 현재 날짜가 아닌 경우 formatted(_:)메서드를 호출하여 날짜의 문자열 표현을 만들고 결과를 반환합니다.
        }
    }
}
