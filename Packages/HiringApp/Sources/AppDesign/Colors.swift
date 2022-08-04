//
//  Colors.swift
//  
//
//  Created by Dmytro Vorko on 04.08.2022.
//

import Foundation
import UIKit

public struct Colors {
    // Here will be app colors
    // Some framework should be used for automatic generation (Swiftgen, R.swift or similar.)
    
    public static let appAccent = #colorLiteral(red: 0.768627451, green: 0.007843137255, blue: 0.007843137255, alpha: 1)
}

// MARK: - Favorite COlors

public extension Colors {
    enum NamedColors: String {
        case lime = "lime"
        case magenta = "magenta"
        case orange = "orange"
        case orchid = "orchid"
        case plum = "plum"
        case tan = "tan"
        case silver = "silver"
        case black = "black"
        case blue = "blue"
        case fuchsia = "fuchsia"
        case turquoise = "turquoise"
        case pink = "pink"
        case mintGreen = "mint green"
        case salmon = "salmon"
        case indigo = "indigo"
        case azure = "azure"
        case red = "red"
        case cyan = "cyan"
        case grey = "grey"
        case ivory = "ivory"
        case violet = "violet"
        case olive = "olive"
        case white = "white"
        case teal = "teal"
        case green = "green"
        case lavender = "lavender"
        case skyBlue = "sky blue"
        case gold = "gold"
        
        public var color: UIColor {
            switch self {
            case .lime:
                return #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
                
            case .magenta:
                return #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
                
            case .orange:
                return #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
                
            case .orchid:
                return #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
                
            case .plum:
                return #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
                
            case .tan:
                return #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
                
            case .silver:
                return #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
                
            case .black:
                return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                
            case .blue:
                return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                
            case .fuchsia:
                return #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
                
            case .turquoise:
                return #colorLiteral(red: 0.768627451, green: 0.007843137255, blue: 0.262745098, alpha: 1)
                
            case .pink:
                return #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
                
            case .mintGreen:
                return #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
                
            case .salmon:
                return #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
                
            case .indigo:
                return #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
                
            case .azure:
                return #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
                
            case .red:
                return #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                
            case .cyan:
                return #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
                
            case .grey:
                return #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
                
            case .ivory:
                return #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                
            case .violet:
                return #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
                
            case .olive:
                return #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
                
            case .white:
                return UIColor.white
                
            case .teal:
                return #colorLiteral(red: 0, green: 0.46, blue: 0.89, alpha: 1)
                
            case .green:
                return UIColor.green
                
            case .lavender:
                return #colorLiteral(red: 0, green: 0.46, blue: 0.89, alpha: 1)
                
            case .skyBlue:
                return UIColor.blue
                
            case .gold:
                return #colorLiteral(red: 0, green: 0.46, blue: 0.89, alpha: 1)
            }
        }
    }
}

