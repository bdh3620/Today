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
        }
    }
}
