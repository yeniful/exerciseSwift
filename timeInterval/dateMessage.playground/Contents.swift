import Foundation

func DateMessage (_ date1: String, _ date2: String) -> String{
    
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "ko_kr")
    dateFormatter.timeZone = TimeZone(abbreviation: "KST")
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

    let startTime = dateFormatter.date(from: date1)
    let endTime = dateFormatter.date(from: date2)
    let timeDifference = Int(endTime!.timeIntervalSince(startTime!))
    let calendar = Calendar.current
    let startTimeComponents = calendar.dateComponents([.month, .day], from: startTime!)

    switch timeDifference{
    case _ where timeDifference < 60:
        return "방금 전"
    case _ where timeDifference < 3600:
        return "\(timeDifference / 60)분 전"
    case _ where timeDifference < 86400:
        return "\((timeDifference / 60) / 60)시간 전"
    case _ where timeDifference < 172800:
        return "하루 전"
    case _ where startTimeComponents.month != nil && startTimeComponents.day != nil:
        return String(startTimeComponents.month!) + "월 " + String(startTimeComponents.day!) + "일"
    default:
        return "Default Date"
    }
}

// 방금 전
print(DateMessage("2021-07-11 07:59:59", "2021-07-11 08:00:00"))
// 25분 전
print(DateMessage("2021-07-11 07:35:00", "2021-07-11 08:00:00"))
// 2시간 전
print(DateMessage("2021-07-11 06:00:00", "2021-07-11 08:00:00"))
// 하루 전
print(DateMessage("2021-07-10 06:00:00", "2021-07-11 08:00:00"))
// 7월 9일
print(DateMessage("2021-07-09 06:00:00 ", "2021-07-11 08:00:00"))
