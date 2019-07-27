

import Foundation

/// Returns year in YYYY format from Date
func yearString(from date: Date) -> String {
    return String(Calendar.current.component(.year, from: date))
}
