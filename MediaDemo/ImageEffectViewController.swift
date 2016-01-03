//
//  ImageEffectViewController.swift
//  MediaDemo
//
//  Created by Krishana on 11/6/15.
//  Copyright © 2015 Krishna. All rights reserved.
//

import UIKit

class ImageEffectViewController: UIViewController
{
    @IBOutlet var img : UIImageView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnAction(sender : UIButton)
    {
        let originalImage = CIImage(image: img.image!)
        let filter = CIFilter(name: "CIPhotoEffectTransfer")
        
//MARK: - Other Image Effects
        
//        CIPhotoEffectChrome
//        CIPhotoEffectFade
//        CIPhotoEffectInstant
//        CIPhotoEffectMono
//        CIPhotoEffectNoir
//        CIPhotoEffectProcess
//        CIPhotoEffectTonal
//        CIPhotoEffectTransfer
//        CIColorCrossPolynomial
//        CIColorCube
//        CIColorCubeWithColorSpace
//        CIColorInvert
//        CIColorMap
//        CIColorMonochrome
//        CIColorPosterize
//        CIFalseColor
//        CIMaskToAlpha
//        CIMaximumComponent
//        CIMinimumComponent

        filter!.setDefaults()
        filter!.setValue(originalImage, forKey: kCIInputImageKey)
        let outputImage = filter!.outputImage
        let newImage = UIImage(CIImage: outputImage!)
        img.image = newImage
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
