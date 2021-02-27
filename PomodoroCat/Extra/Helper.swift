import SwiftUI

func determineTheme(_ themeIndex: Int) -> ColorScheme {
    if themeIndex == 0 {
        return ColorScheme.light
    } else {
        return ColorScheme.dark
    }
}
