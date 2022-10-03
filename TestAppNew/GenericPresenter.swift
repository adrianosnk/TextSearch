//
//  GenericPresenter.swift
//  Sunarp
//
//  Created by Joel Chuco Marrufo on 7/08/22.
//

import UIKit

@objc protocol GenericPresenter {
    
    @objc optional func didLoad()
    @objc optional func willAppear()
    @objc optional func didAppear()
    @objc optional func willDissappear()
    @objc optional func didDissappear()
    @objc optional func prepare(for segue: UIStoryboardSegue, sender: Any?)
}
