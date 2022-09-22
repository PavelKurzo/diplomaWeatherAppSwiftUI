//
//  DetailedView.swift
//  WeatherAppRebuilded
//
//  Created by Павел Курзо on 19.09.22.
//

import SwiftUI

struct DetailView: View {
     var item: ResponseBody?
    
    func getWeatherImage(item: ResponseBody) -> String {
        return item.weather[0].icon
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(item?.name ?? "")
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))").fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
//                            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(getWeatherImage(item: item!))@2x.png"))
//                            { image in
//                                image
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(maxWidth: 80, maxHeight: 80)
//                            } placeholder: {
//                                ProgressView()
//                            }
                            /*
                             Here is the question about image, how to unwrap it correctly, or how to solve. Crashing an app with exclamation mark Also about the function getWeatherImage. Is it possible to transfer image from the first screen directly to the second one.
                             Line 34, Line 13.
                             */
                                                        
                            Text(item?.weather[0].main ?? "")
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(item?.main.feelsLike.roundDouble() ?? "0")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (item?.main.tempMin.roundDouble() ?? "0") + "°")
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (item?.main.tempMax.roundDouble() ?? "0") + "°")
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "wind speed", value: (item?.wind.speed.roundDouble() ?? "0") + "m/s")
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (item?.main.humidity.roundDouble() ?? "0") + "%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
