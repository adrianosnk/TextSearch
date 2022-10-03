//
//  InicioViewController.swift
//  Sunarp
//
//  Created by Joel Chuco Marrufo on 30/07/22.
//


import UIKit
import RxSwift
import RxCocoa
import Alamofire
import SwiftyJSON
import CoreLocation
import SearchTextField
import HSSearchable

class MapaDetailViewController: UIViewController {
        
    
    let disposeBag = DisposeBag()
    var window: UIWindow?
    
    
    
    @IBOutlet weak var formView: UIView!
    
    @IBOutlet weak var formViewCompartir: UIView!
    @IBOutlet weak var formViewLlamar: UIView!
    @IBOutlet weak var formViewRuta: UIView!
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var DirecLabel: UILabel!
    @IBOutlet weak var horarioLabel: UILabel!
    @IBOutlet weak var phoneAnexLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var index:Int!
    
    var usersData = SearchableWrapper()
    var users: [UserDM] {
        return self.usersData.dataArray as! [UserDM]
    }
    
    //var array : Array<MapaOfficeEntity> = []
    //[MapaOfficeEntity]
    var arrayEntity: [MapaEntity] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDesigner()
        addGestureView()
       
        setupNavigationBar()
        
        print("nAarrayEntity:",arrayEntity)
        print("indexJJJty:",index)
        
        /*
        titleLabel.text = arrayEntity[index].office
        subtitleLabel.text = arrayEntity[index].self.type
        DirecLabel.text = arrayEntity[index].self.address
        var valSchedule:String = ""
        var valScheduleSecond:String  = ""
        var valScheduleTree:String  = ""
        if arrayEntity[index].self.arrayAttention[0].schedules.count == 1 {
            valSchedule = (arrayEntity[index].self.arrayAttention[0].schedules[0] as? String)!
            horarioLabel.text = "\(valSchedule)"
        } else if arrayEntity[index].self.arrayAttention[0].schedules.count == 2{
            valScheduleSecond = (arrayEntity[index].self.arrayAttention[0].schedules[1] as? String)!
            horarioLabel.text = "\(valSchedule)  \(valScheduleSecond)"
        } else if arrayEntity[index].self.arrayAttention[0].schedules.count == 3{
            valScheduleTree = (arrayEntity[index].self.arrayAttention[0].schedules[2] as? String)!
            horarioLabel.text = "\(valSchedule)  \(valScheduleSecond)  \(valScheduleTree) "
        }
       
        
        
        phoneAnexLabel.text = arrayEntity[index].self.arrayPhone[0].annex
        phoneLabel.text = arrayEntity[index].self.arrayPhone[0].phone
        
        */
    }
    
    // MARK: - Setup
    func setupNavigationBar(){
        self.navigationController?.navigationBar.isHidden = false
        loadNavigationBar(hideNavigation: false, title: "Oficina registral")
        addNavigationLeftOption(target: self, selector: #selector(goBack), icon: SunarpImage.getImage(named: .iconBackWhite))
        
    }
    
    // MARK: - Actions
    @IBAction func goBack() {
        
       // router.pop(sender: self)
        self.navigationController?.popViewController(animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupDesigner() {
        
        
    
        self.formView.backgroundCard()
        
        
  
      //  self.formViewEditar.backgroundCard()
       
    }
    
    private func addGestureView(){
       
        
        let tapCompartirGesture = UITapGestureRecognizer(target: self, action: #selector(self.onTapToCompartirView))
        self.formViewCompartir.addGestureRecognizer(tapCompartirGesture)
        
        
        let tapLlamarGesture = UITapGestureRecognizer(target: self, action: #selector(self.onTapToLlamarView))
        self.formViewLlamar.addGestureRecognizer(tapLlamarGesture)
        
        
        let tapRutaGesture = UITapGestureRecognizer(target: self, action: #selector(self.onTapToRutaView))
        self.formViewRuta.addGestureRecognizer(tapRutaGesture)
        
        
    }
    
    @objc private func onTapToCompartirView() {
    }
    @objc private func onTapToLlamarView() {
    }
    @objc private func onTapToRutaView() {
    }
    
    @objc private func onTapToConfirmView() {
      
    }
    

    
    
}



