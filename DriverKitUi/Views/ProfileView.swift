//
//  ProfileView.swift
//  DriverKitUi
//
//  Created by MACM05 on 13/07/23.
//

import SwiftUI

struct ProfileView: View {
    private var contactInfoList: [ContactInfoListCell] = [ContactInfoListCell(imageName: "phone", detailText: "+91 99999 88888"), ContactInfoListCell(imageName: "mail", detailText: "richardbeck@gmail.com"), ContactInfoListCell(imageName: "map-pin", detailText: "81 Washington Walk, New York"), ContactInfoListCell(imageName: "credit-card", detailText: "460307201403200071"), ContactInfoListCell(imageName: "layers", detailText: "Hyper Atlantic Transport")]
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                dashBoardBar
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height*0.2)
                    .background(Color.blue)
                    .cornerRadius(radius: 20.0, corners: [ .bottomLeft, .bottomRight])
                    .foregroundColor(Color.white)
                
                profileSubView
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height*0.15)
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .padding(.horizontal)
                    .padding(.top, geo.size.height*0.16)
                    .shadow(radius: 2)
                
                contactInfoView
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height*0.35)
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .padding(.horizontal)
                    .padding(.top, geo.size.height*0.33)
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
            
            Text("Profile")
                .foregroundColor(Color.white)
               .font(.custom("Rubik-Light", size: 24))
               .fontWeight(.semibold)
               .padding(.top, 20)
               .zIndex(2)
        }
    }
    
    private var profileSubView: some View {
        HStack {
            Image("Richard")
                .padding(.top, 26)
                .padding(.leading, 26)
                .padding(.bottom, 26)
            
            VStack(alignment: .leading) {
                Text("Richard Brek")
                    .font(.custom("Rubik", size: 18))
                    .fontWeight(.semibold)
                
                Text("Heavy Vehiccel Driving")
                    .font(.custom("Rubik", size: 14))
            }
            
            Spacer()
            
            Button {
                //
            } label: {
                Text("Edit")
                    .font(.system(size: 14))
                    .bold()
            }
            .padding(15)
            .background(Color("lightGrey_#F4F6FA"))
            .cornerRadius(20.0)
            .padding(.trailing, 26)
        }
    }
    
    private var contactInfoView: some View {
        LazyVStack(alignment: .leading) {
            ForEach(contactInfoList.indices, id: \.self) { item in
                HStack(spacing: 15) {
                    Image(contactInfoList[item].imageName)
                        .padding(5)
                    Text(contactInfoList[item].detailText)
                        .padding(5)
                }
                Divider()
            }
        }
        .padding()
    }
}

struct ContactInfoListCell {
    var imageName: String
    var detailText: String
    
    init(imageName: String, detailText: String) {
        self.imageName = imageName
        self.detailText = detailText
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
