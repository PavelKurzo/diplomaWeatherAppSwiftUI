//
//  Extensions.swift
//  WeatherAppRebuilded
//
//  Created by Павел Курзо on 21.09.22.
//

import SwiftUI
import Foundation

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension UIImageView {
    func setImage(_ iconName: String?) {
        guard let iconName = iconName else {
            image = nil
            return
        }
        setImage(URL(string: "https://openweathermap.org/img/wn/\(iconName)@2x.png"))
    }
    
    func setImage(_ url: URL?) {
        guard let url = url else {
            image = nil
            return
        }
        let downloadTask = URLSession.shared.dataTask(with: url) { [weak self] data, repsonse, error in
            DispatchQueue.main.async {
                if let data = data {
                    self?.image = UIImage(data: data)
                } else {
                    self?.image = nil
                }
            }
        }
        downloadTask.resume()
    }
}
