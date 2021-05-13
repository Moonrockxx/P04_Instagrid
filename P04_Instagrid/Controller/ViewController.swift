//
//  ViewController.swift
//  P04_Instagrid
//
//  Created by TomF on 14/04/2021.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var squareSelected = UIButton()
    
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
        firstLayoutButton.isSelected = true
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
        firstLayoutButton.setImage(UIImage(named: "Selected"), for: .selected)
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
        secondLayoutButton.setImage(UIImage(named: "Selected"), for: .selected)
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
        thirdLayoutButton.setImage(UIImage(named: "Selected"), for: .selected)
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
            squareSelected.setImage(pickedImage, for: .normal)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // - quitte sans selection
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            self.swipeLabel.text = "Swipe left to share"
        } else {
            self.swipeLabel.text = "Swipe up to share"
        }
    }
}
