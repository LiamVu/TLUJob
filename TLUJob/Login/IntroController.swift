//
//  IntroController.swift
//  TLUJob
//
//  Created by toilalam on 4/27/20.
//  Copyright © 2020 Liam Vu. All rights reserved.
//

import Foundation
import UIKit
class IntroController : UIViewController{
    var selectIndex = 0
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var PageController: UIPageControl!
    @IBOutlet weak var BtNext: UIPButton!
    @IBOutlet weak var BtPass: UIButton!
    override func viewDidLoad() {
           super.viewDidLoad()
       }
    
override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.BtNext.layer.cornerRadius = self.BtNext.frame.height / 2
        }
    }
    
    fileprivate func goToControllerAtIndex(_ index: Int) {
        self.showPageAtIndex(index)
    }
    func showPageAtIndex(_ index: Int){
        if selectIndex == index{
            return
        }
        
        selectIndex = index
        self.view.endEditing(true)
        self.PageController.currentPage = selectIndex
        let scrollViewWidth = self.ScrollView.frame.width
        let contentOffsetX = scrollViewWidth * CGFloat(selectIndex)
        self.ScrollView.setContentOffset(
            CGPoint(x: contentOffsetX, y: 0),
            animated: true
        )
        if selectIndex == 2{
            BtPass.isHidden = true
            BtNext.setTitle("BẮT ĐẦU", for: .normal)
        } else{
            BtPass.isHidden = false
            BtNext.setTitle("TIẾP TỤC", for: .normal)
        }
      }
     
    @IBAction func Tieptuc(_ sender: Any) {
        let index = selectIndex + 1
        showPageAtIndex(index)
        
//        if selectIndex == 3 {
////           Chuyển màn hình
//            let viewContrler = loginController.create()
//            self.present(viewContrler, animated: true, completion: nil)
//        }
      }
  }
extension IntroController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = floor(scrollView.contentOffset.x / scrollView.frame.width)
        self.showPageAtIndex(Int(currentPage))
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: 0)
    }
}
