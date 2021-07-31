//
//  ContentView.swift
//  Calculator
//
//  Created by Dmitriy Maslennikov on 31/07/2021.
//  Copyright © 2021 mrmda28. All rights reserved.
//

import SwiftUI

enum CalcButtons: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case sub = "-"
    case div = "×"
    case mul = "÷"
    case clear = "AC"
    case decimal = ","
    case percent = "%"
    case negative = "+/-"
    case equal = "="
    
    var buttonBackground: Color {
        switch self {
        case .equal, .add, .sub, .div, .mul: return Color(UIColor(red: 43/255.0, green: 96/255.0, blue: 222/255.0, alpha: 1))
        case .clear, .negative, .percent: return Color(.darkGray)
        default: return Color(.lightGray)
        }
    }
    
    var buttonForeground: Color {
        switch self {
        case .equal, .add, .sub, .div, .mul, .clear, .negative, .percent: return .white
        default: return .black
        }
    }
    
    var buttonSize: Font {
        switch self {
        case .equal, .add, .sub, .div, .mul: return .system(size: 42)
        default: return .system(size: 32)
        }
    }
}

struct ContentView: View {
    
    let buttons: [[CalcButtons]] = [
        [.clear, .negative, .percent, .mul],
        [.seven, .eight, .nine, .div],
        [.four, .five, .six, .sub],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("0")
                        
                        .font(.system(size: 100))
                }
                .padding()
                
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {},
                                   label: {
                                    Text(item.rawValue)
                                        .font(item.buttonSize)
                                        .frame(width: self.buttonWidth(item: item),
                                               height: self.buttonHeight())
                                        .background(item.buttonBackground)
                                        .foregroundColor(item.buttonForeground)
                                        .cornerRadius(self.buttonHeight() / 2)
                            })
                        }
                    }
                    .padding(.bottom, 8)
                }
            }
            .padding(.bottom, 8)
        }
    }
    
    func buttonWidth(item: CalcButtons) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (5 * 12)) / 4) * 2 + 8
        }
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
