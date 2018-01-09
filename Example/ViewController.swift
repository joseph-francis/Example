//
//  ViewController.swift
//  Example
//
//  Created by Joseph on 1/9/18.
//  Copyright © 2018 Joseph. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var aView: UIView!
    @IBOutlet weak var aViewTopConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    private func addView() {
        
        let start = Date()
        guard let parentView = Bundle.main.loadNibNamed("ParentView", owner: self, options: nil)?.first as? ParentView else { return }
        aView.addSubview(parentView)
        
        let end = Date()
        
        print("calendarView time taken: \(end.timeIntervalSince(start))")
        
        UIView.animate(withDuration: 0.2) {
            self.aViewTopConstraint.constant = self.view.bounds.size.height - (self.view.bounds.size.height/2)
            self.view.layoutIfNeeded()
        }
        
    }
    
    
    
    @IBAction func slowBtnPressed(_ sender: UIButton) {
        addView()
    }
    
    @IBAction func fastBtnPressed(_ sender: UIButton) {
        addFastView()
    }
    
    
    private func addFastView() {
        
        let start = Date()
        
        let anotherView = UIView()
        anotherView.frame = aView.bounds
        aView.addSubview(anotherView)
        
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView.init(frame: anotherView.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        anotherView.addSubview(collectionView)
        
        let end = Date()
        print("FastView time taken: \(end.timeIntervalSince(start))")
        
        collectionView.register(FastCell.self, forCellWithReuseIdentifier: "thisID")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
        
        
        aViewTopConstraint.constant = view.bounds.size.height - (view.bounds.size.height/2)
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    

}

class FastCell: UICollectionViewCell {
    
    var aLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        aLabel = UILabel.init(frame: bounds)
        
        aLabel.textAlignment = .center
        aLabel.textColor = UIColor.black
        addSubview(aLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thisID", for: indexPath) as? FastCell else { fatalError() }
        cell.aLabel.text = "1"
        
        return cell
    }
    
    
    
}

















