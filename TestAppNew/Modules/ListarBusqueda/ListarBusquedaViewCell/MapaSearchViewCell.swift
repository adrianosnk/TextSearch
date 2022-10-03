//
//  ProfileViewCell.swift
//  App
//
//  Created by SmartDoctor on 6/14/20.
//  Copyright © 2020 SmartDoctor. All rights reserved.
//

import UIKit
//import SDWebImage

final class MapaSearchViewCell: UITableViewCell {
    private var style = Style.myApp
    static let reuseIdentifier = "MapaSearchViewCell"
  //  @IBOutlet var profileImage:UIImageView!
    @IBOutlet var titleNameLabel:UILabel!
    @IBOutlet var titleAddresLabel:UILabel!
    @IBOutlet var titleDistLabel:UILabel!
   // @IBOutlet var titleEmail:UILabel!
     @IBOutlet var viewCell:UIView!
    @IBOutlet var viewPointCell:UIView!
    
    
    var latValue = String()
    var longValue = String()
    var valType = String()
    var item: [MapaEntity] = []
    
   /* var subjectList: [String] = [] {
        didSet {
            titleNameLabel?.text = subjectList.joined(separator: ", ")
        }
    }
    */
    var user: UserDM! {
        didSet{
            titleNameLabel?.text = user.name
            titleAddresLabel?.text = user.phone
            titleDistLabel?.text =   user.email
        
         
         //   self.detailTextLabel?.text = user.city
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //style.apply(textStyle: .title, to: self.titleNameLabel)
   
       //  viewPointCell.layer.cornerRadius = 12
        viewCell.backgroundColor = UIColor.white
        viewCell.addShadowViewCustom(cornerRadius: 10.0)
        
        
        //titleLabel.textColor = 
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    /*
    func loadWithData(info:DoctorProperties){
        
        let fileName = info.photo!
        let fileArray = fileName.components(separatedBy: "/")
        let finalFileName = fileArray.last
        self.profileImage.sd_setImage(with: URL(string: info.photo!), placeholderImage: UIImage(named: String(finalFileName!)))
        self.titleNameLabel.text = "\(String(info.first_name!)) \n \(String(info.last_name!))"
        //self.titleEmail.text = "\(String(info.bank_email!))"
    }
    
    func loadWithDataFicha(info:MedicalAttentionSDProCompleted){
        
        let fileName = info.patient_photo!
        let fileArray = fileName.components(separatedBy: "/")
        let finalFileName = fileArray.last
        self.profileImage.sd_setImage(with: URL(string: info.patient_photo!), placeholderImage: UIImage(named: String(finalFileName!)))
        self.titleNameLabel.text = "\(String(info.patient_name!))"
        self.titleEmail.text = ""
        //self.titleEmail.text = "\(String(info.patient_name!))"
    }
     */
}
