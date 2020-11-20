//
//  ImagePicker.swift
//  Frontend
//
//  Created by Julian Schiavo on 19/11/2020.
//

import SwiftUI
import UIKit
import UniformTypeIdentifiers

/// A view that allows the user to pick an image from their photo library
struct ImagePicker: UIViewControllerRepresentable {
    /// A binding to the current presentation mode, used to dismiss the image picker when done
    @Environment(\.presentationMode) var presentationMode
    
    /// A binding to the selected image
    @Binding var image: UIImage?
    
    /// Creates and configures the UIKit image picker controller
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.mediaTypes = [UTType.image.identifier]
        picker.delegate = context.coordinator
        return picker
    }
    
    /// Updates the image picker controller
    /// - Parameters:
    ///   - uiViewController: The controlled `UIImagePickerController`
    ///   - context: Context associated with the view
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    /// Creates a coordinator used to communicate between the view and view controller
    /// - Returns: The coordinator
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    /// A coordinator that manages communication between the image picker view controller and view
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        /// The host view
        let parent: ImagePicker
        
        /// Creates a coordinator for a host view
        /// - Parameter parent: The host view
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        /// Called when the user picks an image using the image picker view controller
        /// - Parameters:
        ///   - picker: The image picker view controller
        ///   - info: An info dictionary containing the selected image
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            parent.presentationMode.wrappedValue.dismiss()
            
            guard let uiImage = info[.originalImage] as? UIImage else { return }
            DispatchQueue.main.async {
                self.parent.image = uiImage
            }
        }
        
        /// Called when the user taps the Cancel button
        /// - Parameter picker: The image picker view controller
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
