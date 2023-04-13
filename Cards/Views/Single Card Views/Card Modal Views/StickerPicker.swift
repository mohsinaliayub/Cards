//
//  StickerPicker.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 10.04.23.
//

import SwiftUI

struct StickerPicker: View {
    @Binding var stickerImage: UIImage?
    @State private var stickerNames: [String] = []
    @Environment(\.dismiss) private var dismiss
    
    private let stickerFileNames = [
        "tent", "fire", "tree", "guitar"
    ]
    
    private let columns = [
        GridItem(.adaptive(minimum: 120), spacing: 10)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(stickerNames, id: \.self) { sticker in
                    Image(uiImage: image(from: sticker))
                        .resizable()
                        .scaledToFit()
                        .onTapGesture {
                            stickerImage = image(from: sticker)
                            dismiss()
                        }
                }
            }
        }
        .onAppear {
            stickerNames = loadStickers(withNames: stickerFileNames)
        }
    }
    
    func loadStickers(withNames: [String]) -> [String] {
        var stickers = [String]()
        for stickerFileName in stickerFileNames {
            if let fileUrl = Bundle.main.url(forResource: stickerFileName, withExtension: ".png") {
                stickers.append(fileUrl.path())
            }
        }
        return stickers
    }
    
    func loadStickers() -> [String] {
        var themes: [URL] = []
        var stickerNames: [String] = []
        
        // Get the top level folders inside /Stickers directory
        let fileManager = FileManager.default
        let resourcePath = Bundle.main.bundlePath
        if let enumerator = fileManager.enumerator(
            at: URL(filePath: resourcePath + "/Stickers", directoryHint: .isDirectory),
            includingPropertiesForKeys: nil,
            options: [
                .skipsSubdirectoryDescendants,
                .skipsHiddenFiles
            ]) {
            for case let url as URL in enumerator where url.hasDirectoryPath {
                themes.append(url)
            }
        }
        
        // load files from the directories, and append full path to stickerNames
        for theme in themes {
            if let files = try? fileManager.contentsOfDirectory(atPath: theme.path()) {
                for file in files {
                    stickerNames.append(theme.path() + "/" + file)
                }
            }
        }
        
        return stickerNames
    }
    
    
    /// Loads the image from path.
    ///
    /// If the image fails to load it'll return and error image from asset catalog.
    /// - Parameter path: The full file path for the image.
    /// - Returns: An instance of UIImage.
    func image(from path: String) -> UIImage {
        print("loading:", path)
        return UIImage(named: path) ?? UIImage(named: "error-image") ?? UIImage()
    }
}

struct StickerPicker_Previews: PreviewProvider {
    static var previews: some View {
        StickerPicker(stickerImage: .constant(UIImage()))
    }
}
