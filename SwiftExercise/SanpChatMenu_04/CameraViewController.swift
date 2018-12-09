//
//  CameraViewController.swift
//  SanpChatMenu_04
//
//  Created by 戴运鹏 on 2018/12/9.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController:UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    var captureSession:AVCaptureSession?
    var stillImageOutPut:AVCapturePhotoOutput?
    var previewLayer:AVCaptureVideoPreviewLayer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}

//MARK:--Override

extension CameraViewController
{
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSession.Preset.hd1920x1080
      let backCamera = AVCaptureDevice.DeviceType(rawValue: AVMediaType.video.rawValue)
        var error:NSError?
        var input:AVCaptureDeviceInput?
        
        do {
           input try AVCaptureDeviceInput(device: backCamera)
        } catch let error1 as NSError {
            error = error1
            input = nil
        }
        if (error == nil && captureSession?.canAddInput(input) != nil) {
            captureSession?.addInput(input)
            stillImageOutPut = AVCaptureOutput
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer?.frame = cameraView.bounds
    }
}






















































































































































































































































































































