//
//  EarningView.swift
//  DriverKitUi
//
//  Created by MACM05 on 14/07/23.
//

import SwiftUI

struct EarningView: View {
    private var withdrawalHistoryArray: [WithdrawalHistoryCell] = [ WithdrawalHistoryCell(entryText: "14/06/2021, 14:24 AM", moneyText: "$100"),  WithdrawalHistoryCell(entryText: "14/06/2021, 14:24 AM", moneyText: "$100"),  WithdrawalHistoryCell(entryText: "14/06/2021, 14:24 AM", moneyText: "$100"),  WithdrawalHistoryCell(entryText: "14/06/2021, 14:24 AM", moneyText: "$100"),  WithdrawalHistoryCell(entryText: "14/06/2021, 14:24 AM", moneyText: "$100")]
    
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                dashBoardBar
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height*0.2)
                    .background(Color.blue)
                    .cornerRadius(radius: 20.0, corners: [ .bottomLeft, .bottomRight])
                    .foregroundColor(Color.white)
                
                lastMonthEarningView
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height*0.17)
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .padding(.horizontal, 20)
                    .shadow(radius: 2)
                    .padding(.top, geo.size.height*0.15)
                    .zIndex(3)
                
                graphView
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height*0.32)
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .padding(.horizontal, 20)
                    .padding(.top, geo.size.height*0.34)
                    .shadow(radius: 2)
                
                withdrawalHistoryView
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height*0.32)
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .padding(.horizontal, 20)
                    .padding(.top, geo.size.height*0.68)
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
            
            Text("Earnings")
                .foregroundColor(Color.white)
               .font(.custom("Rubik-Light", size: 24))
               .fontWeight(.semibold)
               .padding(.top, 20)
               .zIndex(2)
        }
    }
    
    private var lastMonthEarningView: some View {
        VStack {
            VStack(spacing: 5) {
                Text("Last 1 Month")
                    .font(.custom("Rubik", size: 18))
                Text("$ 12,491.22")
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
                    Text("244 Rides")
                        .font(.custom("Rubik", size: 14))
                }
                .padding(.leading)
                
                Spacer()
                
                HStack {
                    Image("clock")
                        .resizable()
                        .frame(width: 18, height: 18)
                    Text("25D 22H")
                        .font(.custom("Rubik", size: 14))
                }
                .padding(.trailing)
            }
        }
    }
    
    private var graphView: some View {
        VStack(spacing: 20) {
            HStack {
                VStack(spacing: 5) {
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
            
            Image("Graph")
        }
    }
    
    private var withdrawalHistoryView: some View {
        VStack {
            HStack {
                Text("Withdrawal History")
                Spacer()
                Button {
                    //
                } label: {
                    Text("View All")
                        .font(.system(size: 14))
                        .bold()
                }
                .padding(15)
                .background(Color("lightGrey_#F4F6FA"))
                .cornerRadius(20.0)
                
            }
            .padding(.horizontal)
            
            LazyVStack {
                ForEach(withdrawalHistoryArray.indices, id: \.self) { item in
                    WithdrawalHistoryCell(entryText: withdrawalHistoryArray[item].entryText, moneyText: withdrawalHistoryArray[item].moneyText)
                    Divider()
                }
            }
        }
    }
}

struct WithdrawalHistoryCell: View {
    @State var entryText: String = ""
    @State var moneyText: String = ""
    
    var body: some View {
        HStack(spacing: 20) {
            Image("rectangle")
            Text(entryText)
            Spacer()
            Text(moneyText)
                .font(.custom("Rubik", size: 16))
                .foregroundColor(Color.green)
        }
        .padding(.horizontal, 20)
    }
}

struct EarningView_Previews: PreviewProvider {
    static var previews: some View {
        EarningView()
    }
}
