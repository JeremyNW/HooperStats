//
//  dunkingLottie.swift
//  HooperStats
//
//  Created by Jeremy Warren on 7/19/22.
//

import SwiftUI
import Lottie
import UIKit

struct DunkingLottie: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    
    
    
    typealias UIViewType = UIView
    
    func makeUIView(context: UIViewRepresentableContext<DunkingLottie>) -> UIView {
        let view = UIView(frame: .zero)
       
        
   
        
        let dunkingAnimationView = AnimationView()
        dunkingAnimationView.animation = Animation.named("dunking")
        dunkingAnimationView.contentMode = .scaleAspectFit
        dunkingAnimationView.loopMode = .loop
        dunkingAnimationView.play()
        dunkingAnimationView.animationSpeed = 0.5
        view.addSubview(dunkingAnimationView)
        
        dunkingAnimationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        dunkingAnimationView.widthAnchor.constraint(equalTo: view.widthAnchor),
        dunkingAnimationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
}

