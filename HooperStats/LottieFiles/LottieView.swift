//
//  LottieView.swift
//  HooperStats
//
//  Created by Jeremy Warren on 3/16/22.
//

import SwiftUI
import Lottie
import UIKit

struct LottieView: UIViewRepresentable {
    
    
    static let shared = LottieView()
    
    typealias UIViewType = UIView
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        
        let animationView = AnimationView()
        animationView.animation = Animation.named("BasketballLottie")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)

        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        

        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        
    }
}
