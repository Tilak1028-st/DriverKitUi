//
//  AlertSettingView.swift
//  DriverKitUi
//
//  Created by MACM05 on 13/07/23.
//

import SwiftUI

struct AlertSettingView: View {
    @Binding var isHighSpeed: Bool
    @State private var overSpeedingText = "Over Speeding"
    @State private var overSpeedingSubText = "High Speed Alert Feature"
    @State private var isoverSpeeding = true
    @State private var harshBankingText = "Harsh Braking"
    @State private var harBankingSubtext = "Harsh Braking Warning Alert"
    @State private var isOnHarshBraking = true
    @State private var vehicleEngine = "Vehicle's Engine"
    @State private var vehicleEngineSubtext = "Vehicle's Engine Warning Alert"
    @State private var isOnVehicelEngine = true
    @State private var carIding = "Car Idling"
    @State private var carIdingSubText = "Car Idling Fuel Consumption Alert"
    @State private var isOnCarIdling = true
    @State private var engineOilPressure = "Engine Oil Pressure"
    @State private var engineOilSubtext = "Engine Oil Pressure Warning Alert"
    @State private var isOnEngineOil = true
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                dashBoardBar
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height*0.2)
                    .background(Color.blue)
                    .cornerRadius(radius: 20.0, corners: [ .bottomLeft, .bottomRight])
                    .foregroundColor(Color.white)
                
                AlertCellView(titleText: $overSpeedingText, subTitleText: $overSpeedingSubText, istoggleOn: $isoverSpeeding)
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height*0.1)
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .padding(.horizontal)
                    .padding(.top, geo.size.height*0.17)
                    .shadow(radius: 2)
                
                AlertCellView(titleText: $harshBankingText, subTitleText: $harBankingSubtext, istoggleOn: $isOnHarshBraking)
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height*0.1)
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .padding(.horizontal)
                    .padding(.top, geo.size.height*0.29)
                    .shadow(radius: 2)
                
                AlertCellView(titleText: $vehicleEngine, subTitleText: $vehicleEngineSubtext, istoggleOn: $isOnVehicelEngine)
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height*0.1)
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .padding(.horizontal)
                    .padding(.top, geo.size.height*0.41)
                    .shadow(radius: 2)
                
                AlertCellView(titleText: $carIding, subTitleText: $carIdingSubText, istoggleOn: $isOnCarIdling)
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height*0.1)
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .padding(.horizontal)
                    .padding(.top, geo.size.height*0.53)
                    .shadow(radius: 2)
                
                AlertCellView(titleText: $engineOilPressure, subTitleText: $engineOilSubtext, istoggleOn: $isOnEngineOil)
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height*0.1)
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .padding(.horizontal)
                    .padding(.top, geo.size.height*0.65)
                    .shadow(radius: 2)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    private var dashBoardBar: some View {
        ZStack {
            HStack {
                Image("Vector")
                    .foregroundColor(Color.white)
                    .padding(.leading, 20)
                    .frame(alignment: .leading)
                    .zIndex(2)
                Spacer()
            }
            .padding(.top, 20)
            
            Text("Alert Settings")
                .foregroundColor(Color.white)
               .font(.custom("Rubik-Light", size: 24))
               .fontWeight(.semibold)
               .padding(.top, 20)
               .zIndex(2)
        }
    }
}

struct AlertCellView: View {
    @Binding var titleText: String
    @Binding var subTitleText: String
    @Binding var istoggleOn: Bool
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(titleText)
                    .font(.custom("Rubik", size: 18))
                
                Text(subTitleText)
                    .lineLimit(1)
            }
            Spacer()
            Toggle(isOn: $istoggleOn) {
                EmptyView()
            }
            .frame(width: 50)
            .tint(Color.blue)
        }
        .padding(.horizontal)
    }
    
}

struct AlertSettingView_Previews: PreviewProvider {
    static var previews: some View {
        AlertSettingView(isHighSpeed: .constant(true))
    }
}
