//
//  MapView.swift
//  WeatherAppRebuilded
//
//  Created by Павел Курзо on 20.09.22.
//

import MapKit
import SwiftUI

struct MapView: View {
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(
        latitude: 40.7,
        longitude: -74),
        span: MKCoordinateSpan(
            latitudeDelta: 40,
            longitudeDelta: 40)
    )
    
    var body: some View {
        ZStack {
            Color.clear
                .ignoresSafeArea(.all)
            VStack {
                Map(coordinateRegion: $region)
                    .frame(height: 250)
                
                Button {
                    withAnimation {
                        region.span = MKCoordinateSpan(
                            latitudeDelta: 1,
                            longitudeDelta: 1)
                        region.center = CLLocationCoordinate2D(latitude: 40.7, longitude: -74)
                    }
                } label: {
                   Label("Zoom In", systemImage: "plus.magnifyingglass")
                        .bold()
                        .frame(width: 100, height: 50, alignment: .center)
                    .foregroundColor(.primary)
                }
            }
            .frame(alignment: .bottom)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
