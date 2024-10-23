//
//  ContentView.swift
//  MLImageDetect
//
//  Created by RANA  on 23/10/24.
//

import SwiftUI
import PhotosUI


struct ContentView: View {
    @Bindable private var viewModel = ImageDetectionModel()
    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            // Display the selected image if available
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    //.scaledToFill()
                    .frame(width : 400 ,height: 350)
                    .padding(.top , 30)
            } else {
                Text("Pick an image to detect elements")
                    .foregroundColor(.gray)
                    .padding()
            }
            
            // PhotosPicker Button
            PhotosPicker(selection: $viewModel.imageSelection, matching: .images, photoLibrary: .shared()) {
                Text("Select Image")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    
            }
            .padding()
            
            // Display the detected object's identifier
            if let identifier = viewModel.identifier {
                Text("Detected object: \(identifier)")
                    .font(.headline)
                    .padding()
                    .border(.blue, width: 2)
                    .padding(.top , 30)
            }
            
            // Display the confidence score in a separate location
            if let confidence = viewModel.confidence {
                Text("Confidence: \(confidence)")
                    .font(.subheadline)
                    .foregroundStyle(.black)
                    .padding()
                    .border(.green, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .padding(.top , 10)
            }
            
            
            Button(action: {
                viewModel.sharedDetectionResults()
            }, label: {
                if let _ = selectedImage {
                    HStack{
                        Image(systemName: "square.and.arrow.up.circle")
                            //.resizable()
                            .imageScale(.large)
                        Text("Share Result")
                    }
                    .foregroundStyle(.white)
                    
                }
            })
            .padding(selectedImage != nil ? 15 : 0 )
            .background(RoundedRectangle(cornerRadius: 20).fill(.gray.gradient))
            .padding(.top, 100)
            .ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
            
            
            
        }
        // When the picked image changes, trigger the detection
        .onChange(of: viewModel.pickedImage) {oldImage, newImage in
            if let uiImage = newImage {
                selectedImage = uiImage
                // Call the detectObject function
                viewModel.detectObject(in: uiImage)
            }
        }
    }
    
    
}

#Preview {
    ContentView()
}

