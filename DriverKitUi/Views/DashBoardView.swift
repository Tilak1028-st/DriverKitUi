//
//  DashBoardView.swift
//  DriverKitUi
//
//  Created by MACM05 on 12/07/23.
//

import SwiftUI

struct DashBoardView: View {
    var body: some View {
        ZStack {
            GeometryReader { geo in
                dashBoardBar
                .frame(maxWidth: .infinity)
                .frame(height: geo.size.height*0.2)
                .background(Color.blue)
                .cornerRadius(radius: 20.0, corners: [ .bottomLeft, .bottomRight])
                .foregroundColor(Color.white)
                
                todayStatsView
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height*0.15)
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .padding(.horizontal, 20)
                    .shadow(radius: 2)
                    .padding(.top, geo.size.height*0.15)
                    .zIndex(3)
                
                walletView
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height*0.15)
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .padding(.horizontal, 20)
                    .padding(.top, geo.size.height*0.15 + geo.size.height*0.17)
                    .shadow(radius: 2)
                
                VStack {
                    Spacer()
                    tabBarView
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .cornerRadius(radius: 30.0, corners: [ .topLeft, .topRight])
                        .shadow(radius: 2)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color("lightGrey_#F4F6FA"))
    }
    
    private var dashBoardBar: some View {
        ZStack {
            HStack {
                Image("menu")
                    .foregroundColor(Color.white)
                    .padding(.leading, 20)
                    .frame(alignment: .leading)
                    .zIndex(2)
                Spacer()
            }
            .padding(.top, 20)
            
            Text("Dashboard")
                .foregroundColor(Color.white)
               .font(.custom("Rubik-Light", size: 24))
               .fontWeight(.semibold)
               .padding(.top, 20)
               .zIndex(2)
        }
    }
    
    private var tabBarView: some View {
        HStack {
            Spacer()
            
            Button {
               // Home Action
            } label: {
                VStack{
                    Image("Home")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text("Home")
                        .font(.custom("Rubik", size: 14))
                }
                .padding(.top)
                .padding(.bottom)
            }

            Spacer()
            // Document Action
            Button {
                
            } label: {
                VStack{
                    Image("Document")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text("History")
                        .font(.custom("Rubik", size: 14))
                }
            }
            
            
            Spacer()
            // Brife action
            Button {
                
            } label: {
                VStack {
                    Image("Briefcase")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text("Wallet")
                        .font(.custom("Rubik", size: 14))
                }
            }
            
            
            Spacer()
            
            Button {
                
            } label: {
                VStack {
                    Image("User Male")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text("Profile")
                        .font(.custom("Rubik", size: 14))
                }
            }
            
            Spacer()
        }
        .background(Color.white)
    }
    
    private var todayStatsView: some View {
        VStack {
            VStack {
                Text("Today")
                    .font(.custom("Rubik", size: 18))
                Text("$ 244.00")
                    .font(.custom("Rubik", size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
            }
            
            Divider()
            
            HStack {
                HStack {
                    Image("repeat")
                        .resizable()
                        .frame(width: 18, height: 18)
                    Text("14 Rides")
                        .font(.custom("Rubik", size: 14))
                }
                .padding(.leading)
                
                Spacer()
                
                HStack {
                    Image("clock")
                        .resizable()
                        .frame(width: 18, height: 18)
                    Text("23 H")
                        .font(.custom("Rubik", size: 14))
                }
                .padding(.trailing)
            }
        }
    }
    
    private var walletView: some View {
        VStack {
            HStack {
                VStack {
                    Text("Wallet Balance")
                        .font(.custom("Rubik", size: 18))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("FontBlacKColor_#2D3142"))
                    Text("$ 1544.0")
                        .font(.custom("Rubik", size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                }
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Text("Withdrawal")
                        .font(.system(size: 14))
                        .bold()
                }
                .padding(15)
                .background(Color("lightGrey_#F4F6FA"))
                .cornerRadius(20.0)
                

            }
            .padding(.horizontal)
            
            Divider()
            
            Button {
                // View Payment History
            } label: {
                HStack(alignment: .center) {
                    Text("View Payment History")
                        .font(.custom("Rubik-Light", size: 14))
                        .foregroundColor(Color.black)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundColor(Color.black)
                }
                .padding(.horizontal)
            }

        }
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}


struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}
    

struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView()
    }
}
