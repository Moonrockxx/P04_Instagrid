//
//  ViewController.swift
//  P04_Instagrid
//
//  Created by TomF on 14/04/2021.
//

import UIKit

class ViewController: UIViewController {

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
    }
    
    @IBAction func selectLayout2(_ sender: Any) {
        gridTopLeft.isHidden = false
        gridTopRight.isHidden = false
        rectangleTop.isHidden = true
        gridBottomLeft.isHidden = true
        gridBottomRight.isHidden = true
        rectangleBottom.isHidden = false
    }
    
    
    @IBAction func selectLayout3(_ sender: Any) {
        gridTopLeft.isHidden = false
        gridTopRight.isHidden = false
        rectangleTop.isHidden = true
        gridBottomLeft.isHidden = false
        gridBottomRight.isHidden = false
        rectangleBottom.isHidden = true
    }
}

//let view1 = UIView()
//let view2 = UIView()
//let view3 = UIView()
//
//@IBAction func showView1BtnPressed() {
//    hideOtherViewsExcept(forView: view1)
//}
//
//@IBAction func showView2BtnPressed() {
//    hideOtherViewsExcept(forView: view2)
//}
//
//@IBAction func showView3BtnPressed() {
//    hideOtherViewsExcept(forView: view3)
//}
//
//func hideOtherViewsExcept(forView view: UIView) {
//    view1.isHidden = true
//    view2.isHidden = true
//    view3.isHidden = true
//    view.isHidden = false
//}
