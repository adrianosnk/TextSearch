//
//  ViewController.swift
//  TestAppNew
//
//  Created by Adrian Mendez Agama on 2/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000)) {
        /*  let storyboard = UIStoryboard(name: "Mapa", bundle: nil)
          let vc = storyboard.instantiateViewController(withIdentifier: "MapaSearchViewController") as! MapaSearchViewController
          self.navigationController?.pushViewController(vc, animated: true)
        */
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MapaSearchViewController") as! MapaSearchViewController
            self.navigationController?.pushViewController(vc, animated: true)
          // Do any additional setup after loading the view.
        }
    }

}

