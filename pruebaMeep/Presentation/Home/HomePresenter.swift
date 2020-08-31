//
//  HomePresenter.swift
//  pruebaMeep
//
//  Created by jvictorio on 31/08/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//

import UIKit

class HomePresenter {
    
    private var delegate : HomeViewDelegate?
    
    private let pointUseCase = PointUseCases()


    func setDelegate(delegate: HomeViewDelegate?){
        self.delegate = delegate
    }
    
    func onViewDidLoad(){
        self.delegate?.setupView()
    }
    
    func getPoints(lower: String, upper: String){
        self.pointUseCase.getPoints(strategy: .Network, lower: lower, upper: upper).execute(onSuccess: { (list) in
            ManagerMap.shared.setPoints(list: list)
            self.delegate?.showPoints()
        }) { (error) in
            self.delegate?.showError(text: error.localizedDescription)
        }
    }
}
