import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!

    var selectedImageView: UIImageView!
    var imageDetailZoomTransition: UIViewControllerTransitioningDelegate!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
       // scrollView.contentSize = CGSize(width: 320, height: feedImageView.image!.size.height)
        
        scrollView.contentSize = feedImageView.image!.size
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapGalleryPhoto(_ sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as! UIImageView
        performSegue(withIdentifier: "expandPhotoSegue", sender: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
    func keyboardWillHide(_ notification: Notification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.intValue
        
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
    }
    
func keyboardWillShow(_ notification: Notification!) {
    var userInfo = notification.userInfo!
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
    var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
    var animationDuration = durationValue.doubleValue
    var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
    var animationCurve = curveValue.intValue
    
    UIView.animate(withDuration: animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
        
        // Set view properties in here that you want to match with the animation of the keyboard
        // If you need it, you can use the kbSize property above to get the keyboard width and height.
        }, completion: nil)
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // New view controller with segue.nextViewController.
        // Selected image to new view controller.
        if (segue.identifier == "expandPhotoSegue") {
            let nextViewController = segue.destination as!PhotoViewController
            
            nextViewController.imageToShow = self.selectedImageView.image
            
            nextViewController.modalPresentationStyle = UIModalPresentationStyle.custom
            nextViewController.transitioningDelegate = imageDetailZoomTransition as! UIViewControllerTransitioningDelegate?
            //imageDetailZoomTransition.duration = 0.4

           
        }
    }
}
