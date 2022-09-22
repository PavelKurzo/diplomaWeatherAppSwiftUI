//
//  DetailedView.swift
//  WeatherAppRebuilded
//
//  Created by Павел Курзо on 19.09.22.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            
            VStack() {
                HStack(spacing: 50) {
                    Button {} label: {
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.primary)
                            .padding()
                    }
                    Text("Warszawa")
                        .font(.system(size: 25).weight(.bold))
                    Button {} label: {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.primary)
                            .padding()
                    }
                }
                Text("Temprature °C")
                    .font(.system(size: 23).weight(.semibold))
                    .padding()
                VStack() {
                    Text("Max Temprature °C")
                        .font(.system(size: 19).weight(.medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .top], 16)
                    Text("Min Temprature °C")
                        .font(.system(size: 19).weight(.medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .top], 16)
                    Text("Feels like °C")
                        .font(.system(size: 19).weight(.medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .top], 16)
                    Text("Humidity")
                        .font(.system(size: 19).weight(.medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .top], 16)
                    Text("Wind speed")
                        .font(.system(size: 19).weight(.medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .top, .bottom], 16)
                    MapView()
                }
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                .ignoresSafeArea()
            }
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
