//
//  ViewController.swift
//  P04_Instagrid
//
//  Created by TomF on 14/04/2021.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var squareSelected = UIButton()
    var selectedLayoutImage = UIImage(named: "Selected")
    
    // - Swipe Label
    @IBOutlet weak var swipeLabel: UILabel!
    
    // - Grid view and buttons
    @IBOutlet weak var gridView: UIView!
    @IBOutlet weak var gridTopLeft: UIButton!
    @IBOutlet weak var gridTopRight: UIButton!
    @IBOutlet weak var rectangleTop: UIButton!
    @IBOutlet weak var gridBottomLeft: UIButton!
    @IBOutlet weak var gridBottomRight: UIButton!
    @IBOutlet weak var rectangleBottom: UIButton!
    
    // - Layout choices buttons
    
    enum layoutChoices {
        case firstLayout, secondLayout, thirdLayout
    }
    
    @IBOutlet weak var firstLayoutButton: UIButton!
    @IBOutlet weak var secondLayoutButton: UIButton!
    @IBOutlet weak var thirdLayoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        firstLayoutButton.isSelected = true
    }
    
    @IBAction func selectLayout1(_ sender: Any) {
        gridTopLeft.isHidden = true
        gridTopRight.isHidden = true
        rectangleTop.isHidden = false
        gridBottomLeft.isHidden = false
        gridBottomRight.isHidden = false
        rectangleBottom.isHidden = true
        firstLayoutButton.isSelected = true
        secondLayoutButton.isSelected = false
        thirdLayoutButton.isSelected = false
        firstLayoutButton.setImage(selectedLayoutImage, for: .selected)
        
        // - Only for test, remove before publish
        self.shareAnimation(x: 0, y: 0)
    }
    
    @IBAction func selectLayout2(_ sender: Any) {
        gridTopLeft.isHidden = false
        gridTopRight.isHidden = false
        rectangleTop.isHidden = true
        gridBottomLeft.isHidden = true
        gridBottomRight.isHidden = true
        rectangleBottom.isHidden = false
        firstLayoutButton.isSelected = false
        secondLayoutButton.isSelected = true
        thirdLayoutButton.isSelected = false
        secondLayoutButton.setImage(selectedLayoutImage, for: .selected)
        
        // - Only for test, remove before publish
        self.shareAnimation(x: 0, y: 0)
    }
    
    @IBAction func selectLayout3(_ sender: Any) {
        gridTopLeft.isHidden = false
        gridTopRight.isHidden = false
        rectangleTop.isHidden = true
        gridBottomLeft.isHidden = false
        gridBottomRight.isHidden = false
        rectangleBottom.isHidden = true
        firstLayoutButton.isSelected = false
        secondLayoutButton.isSelected = false
        thirdLayoutButton.isSelected = true
        thirdLayoutButton.setImage(selectedLayoutImage, for: .selected)
        
        // - Only for test, remove before publish
        self.shareAnimation(x: 0, y: 0)
    }
    
    @IBAction func selectedSquare(_ sender: UIButton) {
        squareSelected = sender
        selectPictureInLibrary()
        print(sender.tag)
    }
    
    func selectPictureInLibrary() {
        let imagePickerController = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePickerController.sourceType = .photoLibrary
        }
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            squareSelected.imageView?.contentMode = .scaleAspectFill
            squareSelected.clipsToBounds = false
            squareSelected.setImage(pickedImage, for: .normal)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            self.swipeLabel.text = "Swipe left to share"
        } else {
            self.swipeLabel.text = "Swipe up to share"
        }
    }
    
    func viewToImage(view: UIView) -> UIImage? {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return UIImage(cgImage: image!.cgImage!)
    }
    
    private func shareAnimation(x: CGFloat, y: CGFloat) {
        UIView.animate(withDuration: 0.75, animations: {
            self.gridView.transform = CGAffineTransform(translationX: x, y: y)
        })
    }
    
    
    @IBAction func swipeForShareGesture(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .up where UIDevice.current.orientation.isLandscape == false :
            self.shareAnimation(x: 0, y: -700)
            showShareSheet()
        case .left where UIDevice.current.orientation.isLandscape == true :
            self.shareAnimation(x: -700, y: 0)
            showShareSheet()
        default :
            print("wrong direction")
            break
        }
    }
    
    func showShareSheet() {
        let items = viewToImage(view: gridView)
        let ac = UIActivityViewController(activityItems: [items as Any], applicationActivities: [])
        ac.completionWithItemsHandler = {
            (activityType, completed, _, error) in
            if completed {
                self.shareAnimation(x: 0, y: 0)
            } else {
                self.shareAnimation(x: 0, y: 0)
            }
        }
        present(ac, animated: true)
    }
}
