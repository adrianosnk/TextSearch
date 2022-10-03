//
//  ViewExtension.swift
//  Sunarp
//
//  Created by Joel Chuco Marrufo on 23/07/22.
//

import UIKit

extension UITextField {
    
    func borderAndPaddingLeftAndRight() {
        border()
        self.setPadding(left: CGFloat(16), right: CGFloat(40))
    }
    
    func borderAndPadding() {
        border()
        self.setPadding(left: CGFloat(16))
    }
    
    func border() {
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UtilHelper.getUIColor(hex: "#b3b3b3")?.cgColor
    }
    
    func setPadding(left: CGFloat, right: CGFloat? = nil) {
        setLeftPadding(left)
        if let rightPadding = right {
            setRightPadding(rightPadding)
        }
    }
    
    private func setLeftPadding(_ padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    private func setRightPadding(_ padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
           let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
           let mask = CAShapeLayer()
           mask.path = path.cgPath
           self.layer.mask = mask
       }
    
    func addShadowViewCustom(cornerRadius: CGFloat, opacity: Float = 0.2, radius: CGFloat = 5) {
        
        self.layer.cornerRadius = cornerRadius//viewCustom.bounds.height / 2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
    }
    
    func addSubViewWithLayout(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        self.addSubview(view)
    }
    
    func backgroundColorGradientHeader() {
        backgroundColorGradient(topColor: Constant.backgroundColorTop, bottomColor: Constant.backgroundColorBottom, height: CGFloat(196))
    }
    
    func backgroundColorGradient() {
        backgroundColorGradient(topColor: Constant.backgroundColorTop, bottomColor: Constant.backgroundColorBottom)
    }
    
    func backgroundColorGradient(topColor: String, bottomColor: String, height: CGFloat = 0.0) {
        let colorTop = UtilHelper.getUIColor(hex: topColor)?.cgColor
        let colorBottom = UtilHelper.getUIColor(hex: bottomColor)?.cgColor
        let gradientLayer = CAGradientLayer()
        
        if (height == CGFloat(0)) {
            gradientLayer.frame = self.bounds
        } else {
            let screenSize: CGRect = UIScreen.main.bounds
            gradientLayer.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: height)
        }
        
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.shouldRasterize = true
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func backgroundCard() {
        self.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 12.5
        self.layer.shadowOpacity = 0.5
    }
    func backgroundMapIcon() {
        self.layer.cornerRadius = 30
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 12.5
        self.layer.shadowOpacity = 0.5
    }
    
    func backgroundTextFiel() {
        self.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 2.5
        self.layer.shadowOpacity = 0.5
    }
    
    func primaryRejectButton() {
        self.layer.cornerRadius = 5
        self.backgroundColor = UtilHelper.getUIColor(hex: "#EB3219")
    }
    
    func primaryButton() {
        self.layer.cornerRadius = 5
        self.backgroundColor = UtilHelper.getUIColor(hex: "#9ec239")
    }
    
    func primaryDisabledButton() {
        self.layer.cornerRadius = 5
        self.backgroundColor = UtilHelper.getUIColor(hex: "#b3b3b3")
    }
    
    func secondaryButton() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UtilHelper.getUIColor(hex: "#9ec239")?.cgColor
    }
    
    func borderView() {
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UtilHelper.getUIColor(hex: "#b3b3b3")?.cgColor
    }
    
    func borderCheckView() {
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 2.5
        self.layer.borderColor = UtilHelper.getUIColor(hex: "#b3b3b3")?.cgColor
    }
    
    func borderIconView() {
        self.layer.cornerRadius = 2.5
    }
    
}

extension CATransition {
    
    func segueFromBottom() -> CATransition {
        self.duration = 0.5
        self.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.type = CATransitionType.moveIn
        self.subtype = CATransitionSubtype.fromTop
        return self
    }
    
    func segueFromTop() -> CATransition {
        self.duration = 0.5
        self.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.type = CATransitionType.moveIn
        self.subtype = CATransitionSubtype.fromBottom
        return self
    }
    
    func segueFromLeft() -> CATransition {
        self.duration = 0.5
        self.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.type = CATransitionType.moveIn
        self.subtype = CATransitionSubtype.fromLeft
        return self
    }
    
    func popFromRight() -> CATransition {
        self.duration = 0.5
        self.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.type = CATransitionType.reveal
        self.subtype = CATransitionSubtype.fromRight
        return self
    }
    
    func popFromLeft() -> CATransition {
        self.duration = 0.5
        self.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.type = CATransitionType.reveal
        self.subtype = CATransitionSubtype.fromLeft
        return self
    }
}


extension UIViewController {
    
    func loader() -> UIAlertController {
        
        let alert = UIAlertController(title: nil, message: "Espere por favor", preferredStyle: .alert)
        let  indicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        indicator.style = .medium
        alert.view.addSubview(indicator)
        present(alert, animated: true, completion: nil)
        return alert
        
    }
    
    func stopLoader(loader: UIAlertController) {
        DispatchQueue.main.async {
            loader.dismiss(animated: true, completion: nil)
        }
    }
    
}

extension UIApplication {
    struct Constants {
        static let CFBundleShortVersionString = "CFBundleShortVersionString"
    }
    class func appVersion() -> String {
        return Bundle.main.object(forInfoDictionaryKey: Constants.CFBundleShortVersionString) as! String
    }
  
    class func appBuild() -> String {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
    }
  
    class func versionBuild() -> String {
        let version = appVersion(), build = appBuild()
      
        return version == build ? "v\(version)" : "v\(version)(\(build))"
    }
}

extension UIImage {
    
    func resizeImage(_ dimension: CGFloat, opaque: Bool, contentMode: UIView.ContentMode = .scaleAspectFit) -> UIImage {
        var width: CGFloat
        var height: CGFloat
        var newImage: UIImage

        let size = self.size
        let aspectRatio =  size.width/size.height

        switch contentMode {
            case .scaleAspectFit:
                if aspectRatio > 1 {
                    width = dimension
                    height = dimension / aspectRatio
                } else {
                    height = dimension
                    width = dimension * aspectRatio
                }

        default:
            fatalError("UIIMage.resizeToFit(): FATAL: Unimplemented ContentMode")
        }
        
        let newSize = CGSize(width: width, height: height)
        let rect = CGRect(x: 0, y: 0, width: width, height: height)

        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return newImage
    }
    
}

public extension UIColor {
    
    private class func intFromHexString(_ hexString: String) -> UInt32{
        
        var hexInt : UInt32 = 0
        
        let scanner = Scanner(string: hexString)
        scanner.charactersToBeSkipped = CharacterSet.init(charactersIn: "#")
        scanner.scanHexInt32(&hexInt)
        
        return hexInt
    }
    
    class func colorFromHexString(_ hexString: String, withAlpha alpha: CGFloat) -> UIColor {
        
        let hexint = self.intFromHexString(hexString)
        
        let red = CGFloat((hexint & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xFF00) >> 8) / 255.0
        let blue = CGFloat(hexint & 0xFF) / 255.0
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
}
