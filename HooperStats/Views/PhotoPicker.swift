//
//  PhotoPicker.swift
//  HooperStats
//
//  Created by Zachary Buffington on 2/25/22.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.dismiss) var dismiss
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        let picker = PHPickerViewController(configuration: .init())
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_: PHPickerViewController, context _: Context) {
        // nothing to update
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: PHPickerViewControllerDelegate {
        let parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        
        func picker(_: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            results.first?.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: { object, error in
                if let error = error {
                    print(error)
                }
                if let image = object as? UIImage {
                    DispatchQueue.main.async {
                        self.parent.image = image
                    }
                }
            })
            parent.dismiss()
        }
    }
}
