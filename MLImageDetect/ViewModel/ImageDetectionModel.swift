//
//  ImageDetectionModel.swift
//  MLImageDetect
//
//  Created by RANA  on 23/10/24.
//

import SwiftUI
import Foundation
import Observation
import CoreML
import Vision
import PhotosUI


@Observable class ImageDetectionModel {
    
    var pickedImage : UIImage?
    var identifier  : String?
    var confidence : String?
    var imageSelection : PhotosPickerItem? {
        didSet {
            Task {
                if let imageSelection = imageSelection {
                    if let data = try? await imageSelection.loadTransferable(type: Data.self),
                       let image = UIImage(data: data) {
                        pickedImage = image
                    }
                }
                  
            }
        }
    }
    
    private var model : VNCoreMLModel
    
    init() {
        // Load the MobileNetV2 model
        let config = MLModelConfiguration()
        config.computeUnits = .all
        guard let model = try? VNCoreMLModel(for: Resnet50FP16(configuration: config).model) else {
            fatalError("Failed to load Resnet50FP16 model")
        }
        self.model = model
    }
    
    func detectObject(in image: UIImage){
        guard let ciImage = CIImage(image: image) else {
            print("Unable to reate CIImage")
            return
        }
        
        let request = VNCoreMLRequest(model: model) { [weak self] request, error in
            
           if let results = request.results as? [VNClassificationObservation],
              let toResult = results.sorted(by: {$0.confidence > $1.confidence}).first {
               DispatchQueue.main.async {
                   self?.identifier = toResult.identifier
                   self?.confidence = String(format: "%.2f", toResult.confidence * 100) + "%"
               }
           }
            
        }
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        DispatchQueue.main.async {
            do{
                try handler.perform([request])
            } catch {
                print("Failed to perform detection : \(error.localizedDescription)")
            }
        }
    }
    
    func sharedDetectionResults(){
        
        if let image = pickedImage , let resultText = self.identifier {
            let activityVC = UIActivityViewController(activityItems: [image, resultText], applicationActivities: nil)
            
            if let windowScene = UIApplication.shared.connectedScenes
                .filter({ $0.activationState == .foregroundInactive})
                .compactMap({$0 as? UIWindowScene }).first ,
               let rootVc = windowScene.windows.first?.rootViewController {
                rootVc.present(activityVC, animated: true , completion : nil)
            }
            
        }
    }
    
    
}
