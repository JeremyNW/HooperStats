//
//  ContentView.swift
//  HooperStats
//
//  Created by Jeremy Warren on 3/1/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isOnboarded") var isOnboarded = false
    var body: some View {
        if isOnboarded {
            MainView()
        } else {
            WalkthroughScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

struct WalkthroughScreen: View {
    @AppStorage("isOnboarded") var isOnboarded = false
    let totalPages = 4
    @State private var currentPage = 1
    
    var body: some View {
        
        ZStack {
            
            if currentPage == 1 {
                ScreenView(image: "image1", title: "Welcome to HooperStats+", detail: "With this app you will become the best basketball player you can be!", bgColor: Color("lightYellow"), currentPage: $currentPage)
                    .transition(.scale)
            }
            if currentPage == 2 {
                ScreenView(image: "image2", title: "Are you ready?", detail: "HooperStats+ allows you to track your basketball stats - things like points, rebounds, assists, and other important game details!", bgColor: Color("lightPink"), currentPage: $currentPage)
                    .transition(.scale)
            }
            if currentPage == 3 {
                ScreenView(image: "image3", title: "Want to brag?", detail: "HooperStats+ will generate your averages so you can share with your friends just how good you are!", bgColor: Color("lightBlue"), currentPage: $currentPage)
                    .transition(.scale)
            }
            if currentPage == 4 {
                ScreenView(image: "image4", title: "We're rooting for you!", detail: "Time to see what you're capable of!", bgColor: Color("lightBlue"), currentPage: $currentPage)
                    .transition(.scale)
            }
        }
        
        .overlay(
            
            Button(action: {
                withAnimation(.easeInOut) {
                    if currentPage < 4 {
                        currentPage += 1
                    } else {
                    isOnboarded = true
                    }
                }
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .clipShape(Circle())
                
                    .overlay(
                        
                        ZStack{
                            
                            Circle()
                                .stroke(Color.black.opacity(0))
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage) / CGFloat(4))
                                .stroke(Color.white, lineWidth: 4)
                                .rotationEffect(.init(degrees:-90))
                        }
                            .padding(-15)
                    )
            }
                  )
                .padding(.bottom, 20)
            ,alignment: .bottom
        )
    }
}

struct ScreenView: View {
    
    var image: String
    var title: String
    var detail: String
    var bgColor: Color
    
    @Binding var currentPage: Int
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                
                if currentPage == 1  {
                    Text("Hello Member!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                } else {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            currentPage -= 1
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .foregroundColor(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut) {
                        currentPage = 4
                    }
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
                
            }
            .foregroundColor(.black)
            .padding()
            
            Spacer(minLength: 0)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
            
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
            
            Text(detail)
                .fontWeight(.semibold)
                .kerning(1.3)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.black)
            
            Spacer(minLength: 120)
        }
        .background(bgColor.cornerRadius(10).ignoresSafeArea())
    }
}

