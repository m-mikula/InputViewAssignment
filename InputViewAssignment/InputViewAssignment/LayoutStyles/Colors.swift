//
//  Colors.swift
//  InputViewAssignment
//
//  Created by Martin Mikula on 09/04/2025.
//

import SwiftUI

public struct CustomColors {
    public struct Surface {
        public static let xHigh = Color(red: 140/255, green: 140/255, blue: 154/255)
        public static let xLow = Color.white
        public static let brand = Color(red: 0, green: 80/255, blue: 1)
        public static let danger = Color(red: 220/255, green: 40/255, blue: 40/255)
        public static let dangerVariant = Color(red: 1, green: 220/255, blue: 220/255)
        public static let warning = Color(red: 165/255, green: 99/255, blue: 21/255)
        public static let warningVariant = Color(red: 250/255, green: 241/255, blue: 182/255)
    }
    
    public struct Content {
        public struct OnNeutral {
            public static let xxHigh = Color(red: 44/255, green: 44/255, blue: 49/255)
            public static let medium = Color(red: 140/255, green: 140/255, blue: 154/255)
            public static let low = Color(red: 125/255, green: 125/255, blue: 138/255)
            public static let danger = Color(red: 220/255, green: 40/255, blue: 40/255)
            public static let warning = Color(red: 220/255, green: 40/255, blue: 40/255)
        }
    }
    
    public struct State {
        public struct Default {
            public static let hover = Color(red: 26/255, green: 26/255, blue: 26/255, opacity: 0.06)
            public static let focus = Color(red: 26/255, green: 26/255, blue: 26/255, opacity: 0.8)
        }
    }
}
