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

class MapaSearchViewController: UIViewController {
        
 
    let disposeBag = DisposeBag()
    var window: UIWindow?
    
    @IBOutlet weak var formTableView: UIView!

  
    //@IBOutlet weak var busquedaTxtFiel: SearchTextField!
    @IBOutlet weak var busquedaTxtFiel: UITextField!
    
    var markerArray = Array<Any>()
    var i : Int = 0
    var origin = String()
    var destination = String()
    var previousLat = CLLocationDegrees()
    var previousLong = CLLocationDegrees()
    var officinasEntities: [MapaEntity] = []
    
    var loading: UIAlertController!
    
    private lazy var presenter: MapaSearchPresenter = {
       return MapaSearchPresenter(controller: self)
    }()
    
    
    
    @IBOutlet var tableView:UITableView!
    @IBOutlet var tableSearchView:UITableView!
    
    //let array = ["Oficina Registral","Oficina Receptora","Oficina Central","Tribunal Registral","Zona Registral","Oficina Otras"]
    
    //MARK: iVars
    var usersData = SearchableWrapper()
    var users: [UserDM] {
        return self.usersData.dataArray as! [UserDM]
    }
    
    //MARK: IBOutlet
    @IBOutlet weak var searchbar: UISearchBar!
    
    var array : Array<UserDM> = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDesigner()
        addGestureView()
       
        setupNavigationBar()
        
        
        
       // formTableView.isHidden = true
        
        
        //mapiperu2019
        registerCell()
        self.presenter.didLoad()
        
       
        // 1 - Configure a simple search text field
       
        print("..AArray.>>",array)
        self.usersData.serverArray = array;
        self.tableSearchView.reloadData()
        
        //set anyone delegate of two based on your requiredments
        self.searchbar.delegate = self.usersData
        tableSearchView.tableHeaderView = self.searchbar
        //self.usersData.customDelegate = self;
      
        self.usersData.searchingCallBack = { isSearching, searchText in
            print("searching Text:= \(searchText)")
            self.tableSearchView.reloadData()
        }
       // self.loadDummyData()
    }
    
  
    
    // MARK: - Setup
    func setupNavigationBar(){
        self.navigationController?.navigationBar.isHidden = false
        loadNavigationBar(hideNavigation: false, title: "Contacto")
        addNavigationLeftOption(target: self, selector: #selector(goBack), icon: SunarpImage.getImage(named: .iconBackWhite))
    }
    // MARK: - Actions
    @IBAction func goBack() {
       // router.pop(sender: self)
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - search
    // 1 - Configure a simple search text view
   /* fileprivate func configureSimpleSearchTextField() {
        // Start visible even without user's interaction as soon as created - Default: false
        busquedaTxtFiel.startVisibleWithoutInteraction = false
        
        // Set data source
        let countries = localPlace()
        busquedaTxtFiel.filterStrings(countries)
    }
    */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    // Hide keyboard when touching the screen
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
   
    private func setupDesigner() {
      //  self.formView.backgroundCard()
      //  self.formViewEditar.backgroundCard()
        tableSearchView.delegate = self
        tableSearchView.dataSource = self
    }
    func registerCell() {
        //Celda Foto perfil
        let profileCellSearchNib = UINib(nibName: MapaSearchViewCell.reuseIdentifier, bundle: nil)
        tableSearchView.register(profileCellSearchNib, forCellReuseIdentifier: MapaSearchViewCell.reuseIdentifier)
    }
    private func addGestureView(){
      
    }

    @objc private func onTapToBusqView() {
        
        
    }

    
    func loaderView(isVisible: Bool) {
        if (isVisible) {
            self.loading = self.loader()
        } else {
            self.stopLoader(loader: self.loading)
        }
    }
    func loadDatosMapa(jsonValidacion: [MapaEntity]) {
        
      
        var array : Array<UserDM> = []
        for item in jsonValidacion {
            let titleString = item.id
            
            
            let user1 = UserDM(id: titleString, name: item.name, username: item.username,email:item.email ,phone:item.phone)
            
            //array : Array<UserDM> = [user1]
            array.append(user1)
        }
        
        
        
        print("..AArray.>>",array)
        self.usersData.serverArray = array;
        self.tableSearchView.reloadData()
        
        loaderView(isVisible: false)
    
    }
    


}



// MARK: - Table view datasource
extension MapaSearchViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  print("num:::",self.dateDataScheduleModel?.rows.count as Any)
            return self.users.count;
    }
    
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 140
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MapaSearchViewCell", for: indexPath) as? MapaSearchViewCell else {
            return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.separatorInset = .zero
            cell.user = self.users[indexPath.row]
            return cell
    }
}

// MARK: - Table view delegate
extension MapaSearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
            //let listMap = self.users[indexPath.row]
           /*
            let storyboard = UIStoryboard(name: "Mapa", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MapaDetailViewController") as! MapaDetailViewController
           // vc.arrayEntity = listMap.item
            vc.index = Int(indexPath.row)
            self.navigationController?.pushViewController(vc, animated: true)
            */
       
    }
  
 

}


