//
//  PhotoPicker.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 11.04.23.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var images: [UIImage]
    @Environment(\.dismiss) private var dismiss
    
    class PhotosCoordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: PhotoPicker
        
        init(parent: PhotoPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            let itemProviders = results.map { $0.itemProvider }
            for item in itemProviders {
                // load the image from the item here
                if item.canLoadObject(ofClass: UIImage.self) {
                    item.loadObject(ofClass: UIImage.self) { image, error in
                        if let error = error {
                            print("Error!", error.localizedDescription)
                        } else {
                            DispatchQueue.main.async {
                                if let image = image as? UIImage {
                                    self.parent.images.append(image)
                                }
                            }
                        }
                    }
                }
            }
            // dissmiss the system modal after the completion
            parent.dismiss()
        }
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 0
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }
 
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> PhotosCoordinator {
        PhotosCoordinator(parent: self)
    }
}

struct PhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPicker(images: .constant([UIImage]()))
    }
}
