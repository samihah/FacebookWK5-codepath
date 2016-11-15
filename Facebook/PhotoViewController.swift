//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Samihah Azim on 11/12/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var imageToShow: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        imageView.image = imageToShow
        //scrollView.contentSize = imageView.image!.size
        scrollView.delegate = self
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapDone(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollAlpha = CGFloat(1 - (abs(scrollView.contentOffset.y) / 2 / 100))
        self.scrollView.backgroundColor = UIColor(white: 0, alpha: scrollAlpha)
        if (abs(self.scrollView.contentOffset.y) > 100) {
            dismiss(animated: true, completion: nil)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.25, animations: {
            self.scrollView.backgroundColor = UIColor(white: 0, alpha: 1)
        })
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
