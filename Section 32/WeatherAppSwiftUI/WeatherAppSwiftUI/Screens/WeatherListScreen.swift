//
//  WeatherListScreen.swift
//  WeatherAppSwiftUI
//
//  Created by Mohammad Azam on 3/5/21.
//

import SwiftUI

enum Sheets: Identifiable {

    var id: UUID {
        return UUID()
    }

    case addNewCity
    case settings
}

struct WeatherListScreen: View {

    @EnvironmentObject private var store: Store
    @State private var activeShee: Sheets?

    var body: some View {
        List {
            ForEach(store.weatherList, id: \.id) { weather in
                WeatherCell(weather: weather)
            }
        }
            .listStyle(PlainListStyle())
            .sheet(item: $activeShee, content: { (item) in
            switch item {
            case.addNewCity: AddCityScreen().environmentObject(store)
            case .settings: SettingsScreen().environmentObject(store)
            }
        }) .navigationBarItems(
            leading: Button(action: { activeShee = Sheets.settings }) {
                Image(systemName: "gearshape")
            },
            trailing: Button(action: { activeShee = .addNewCity }, label: {
                Image(systemName: "plus")
            }
            )
        ).navigationTitle("Cities").embedInNavigationView()

    }
}

struct WeatherListScreen_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store()
        store.setupPreview()
        return WeatherListScreen().environmentObject(store)
    }
}

struct WeatherCell: View {

    @EnvironmentObject var store: Store
    let weather: WeatherViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                Text(weather.city)
                    .fontWeight(.bold)
                HStack {
                    Image(systemName: "sunrise")
                    Text("\(weather.sunrise.formatAsString())")
                }
                HStack {
                    Image(systemName: "sunset")
                    Text("\(weather.sunset.formatAsString())")
                }
            }
            Spacer()

            URLImage(url: Constants.Urls.weatherUrlAsStringByIcon(icon: weather.icon))
                .frame(width: 50, height: 50)

            let temperature = Int(weather.getTemperatureByUnit(
                unit: store.selectedUnit)
            )
            let displayText = String(store.selectedUnit.displayText.prefix(1))
            Text("\(temperature) \(displayText)")
        }
            .padding()
            .background(Color(#colorLiteral(red: 0.9133135676, green: 0.9335765243, blue: 0.98070997, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))

    }
}