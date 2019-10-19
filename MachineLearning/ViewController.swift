//
//  ViewController.swift
//  MachineLearning
//
//  Created by Tamara Erlij on 19/10/19.
//  Copyright © 2019 Tamara Erlij. All rights reserved.
//

import UIKit
 import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
     //   imagePicker.sourceType = .camera
       //imagePicker.allowsEditing = false
    }

    
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
        // imagem selecionada pelo usuário:
        if let userPickedimage = info[.originalImage] as? UIImage {
        imageView.image = userPickedimage
            
            guard let ciimage = CIImage(image: userPickedimage) else {
           fatalError("Could not convert UIImage into CIImage")
            }
                detect(image: ciimage)
    }
         imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func detect(image : CIImage) {
        guard  let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Loading CoreML Model Failed.")
        }
        // A partir daqui funciona se o resultado nao for nil
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Model failed to process image.")
            }
            
            print(results)
        }
        let handler = VNImageRequestHandler(ciImage : image)
        do {
        try handler.perform([request])
                }
        catch {
            print(error)
        }
    }
    
    
    @IBAction func cameraTapped(_ sender: Any) {
    
        imagePicker.sourceType = .camera
       imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
}

