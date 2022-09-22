//
//  ContentView.swift
//  WeatherAppRebuilded
//
//  Created by Павел Курзо on 19.09.22.
//

import SwiftUI

struct ContentView: View {
    @State var textFieldText: String = ""
    @State var showAlert: Bool = false
    @State var isShowingDetailView: Bool = false
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    @State var weatherArray: [ResponseBody] = []
    func getWeatherImage(weather: ResponseBody) -> String {
        return weather.weather[0].icon
    }
    
    var body: some View {
        NavigationStack {
            ZStack() {
                LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea(.all)
                
                VStack() {
                    
                    topElements
                    
                    Spacer()
                    
                    listOfElements
                    
                        .padding(.bottom, 2)
                        .scrollContentBackground(.hidden)
                }
            }
        }
        .task {
            do {
                for city in cities {
                  let weather = try await weatherManager.getCurrentWeather(city.cityName)
                    weatherArray.append(weather)
                    print(cities.enumerated())
                    print("Success")
                }
            } catch {
                print("Error getting weather:\(error)")
            }
        }
    }
    
    var listOfElements: some View {
        List(weatherArray) { item in
            NavigationLink(destination: DetailView()) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.system(size: 22).weight(.bold))
                            .lineLimit(1)
                        Spacer()
                        Text("\(item.weather[0].main)")
                            .font(.system(size: 20))
                    }
                    .frame(width: 100, alignment: .leading)
                    
                    Spacer()
                    AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(getWeatherImage(weather: item))@2x.png"))
                        { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: 80, maxHeight: 80)
                        } placeholder: {
                            ProgressView()
                        }
                    Spacer()
                        Text(item.main.temp.roundDouble() + "°")
                            .font(.system(size: 28).weight(.bold))
                            .lineLimit(1)
                            .frame(width: 50)
                }
                .frame(maxWidth: .infinity)
            }
            .listRowBackground(Color.clear)
        }
    }
    
    var topElements: some View {
        HStack() {
            TextField("Type in your city", text: $textFieldText)
                .frame(width: 260, height: 40)
                .lineLimit(1)
                .multilineTextAlignment(.center)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
            
            Button {} label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.primary)
                    .padding()
            }
            Button {
                showAlert.toggle()
            } label: {
                Image(systemName: "info.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.primary)
            }
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("You can search for your city using textField"))
            })
        }
        .padding(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
