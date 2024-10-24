

# MLImageDetect

<p align="center">
  <a href="https://developer.apple.com/swift/">
    <img src="https://img.shields.io/badge/Swift-5.0-orange" alt="Swift">
  </a>
  <a href="https://developer.apple.com/documentation/vision/recognizing_objects_in_live_capture">
    <img src="https://img.shields.io/badge/ResNet50FP16-MLModel-brightgreen" alt="MLModel">
  </a>
</p>

**MLImageDetect** is an iOS app built using **Swift** and **CoreML**, powered by the **ResNet50FP16.mlmodel**. This machine learning model performs object detection on selected images and provides an accuracy confidence score.

>Learn more about the ResNet50 model in the official [![Apple ML Documentation Badge](https://img.shields.io/badge/Apple%20ML%20Documentation-8A2BE2)](https://developer.apple.com/documentation/vision/recognizing_objects_in_live_capture)
 or check out the [![ResNet50 GitHub Model](https://img.shields.io/badge/ResNet50FP16-GitHub-blue)](https://github.com/apple/coreml-models/blob/master/Vision/Resnet50.md).



## Features
- Select images from your phone’s gallery.
- Detect objects in the selected image.
- Receive accuracy confidence for the detected object.
- Share detection results (image + result) with others.
- Future update: Ability to switch between different ML models.

## How It Works
1. **Image Selection**: The user taps the "Select Image" button to choose a photo from their device.
2. **Object Detection**: The app uses the **ResNet50FP16** CoreML model to detect objects in the image.
3. **Accuracy Confidence**: Once detection is complete, the app displays the detected object and a confidence score (e.g., 96.79%).

## ScreenShorts 
<p align="center">
  <img src="screenshots/screenshot1.png" width="300"> 
</p>

## ResNet50FP16 Model
The **ResNet50FP16.mlmodel** is a pre-trained convolutional neural network (CNN) model that is widely used for image classification tasks. It is based on the ResNet (Residual Network) architecture, which has shown remarkable performance in visual recognition tasks. 

- **Purpose**: ResNet models are designed to perform image recognition tasks by analyzing the features of images and classifying objects.
- **Who Created It**: The ResNet architecture was developed by researchers from Microsoft Research, and it is a go-to model for various image classification tasks.
- **Why It's Used**: The model offers high accuracy and is particularly efficient in identifying objects in images. The FP16 (16-bit floating point) version of the model optimizes performance for iOS devices, allowing faster and more memory-efficient detection.

## Getting Started

### Prerequisites
- **Xcode 15 or later**
- **iOS 17 or later** (for iPhone deployment)
- Basic understanding of Swift and CoreML.


### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/RanaAk/MLImageDetect.git
   cd MLImageDetect
   ```
2. Open the project in Xcode.
3. Run the app on a device or simulator.



## Future Plans
- Allow users to switch between different machine learning models to detect objects.
- Support for additional image formats.
- Improve UI and provide more customization options.

## License
This project is licensed under the MIT License. Feel free to use, modify, and share.

---

### Contributors
- ResNet50 was developed by Microsoft Research. Learn more about it [here](https://arxiv.org/abs/1512.03385).

This app is ideal for developers who are just starting out with CoreML on iOS and macOS. Stay tuned for more updates!
```


