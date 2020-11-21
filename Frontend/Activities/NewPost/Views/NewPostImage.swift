//
//  NewPostImage.swift
//  Frontend
//

import SwiftUI

/// A group of views that allow the user to upload an image to post
struct NewPostImage: View {
    /// A binding to the uploaded image
    @Binding var image: UIImage?
    
    /// Whether the picker is currently shown
    @State private var isPickerPresented = false
    
    /// The contents of the view
    var body: some View {
        Group {
            Section {
                preview
            }
            Section {
                Button(action: showPicker) {
                    Label(Constants.selectImageButtonText, systemImage: "photo.fill")
                }
                .sheet(isPresented: $isPickerPresented) {
                    ImagePicker(image: $image)
                }
            }
        }
    }
    
    /// Preview of the current image
    @ViewBuilder private var preview: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
    
    /// Shows the image picker
    private func showPicker() {
        hideKeyboard()
        isPickerPresented.toggle()
    }
}

struct NewPostImage_Previews: PreviewProvider {
    static var previews: some View {
        NewPostImage(image: .constant(nil))
    }
}
