//
//  ViewController.swift
//  Film INA
//
//  Created by 247 on 12/08/19.
//  Copyright © 2019 247. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionViewRound: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionCatego: UICollectionView!
    
    var circleview = CircleViewCell()
    var topview = TopViewCell()
    var catego = CategoryViewCell()
    
    var estimasi = 160.0
    var cellMargin  = 16.0
    
    fileprivate var collection:UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: MyCol)
        return cv
    }
    
    let MyCollectionViewCellId: String = "circleView"
    let MyCol: String = "TopCell"
    let MyCatego: String = "movie"
    
    var circleModel = [
        circle(judul: "Valak", image: "01"),
        circle(judul: "2 garis biru", image: "02"),
        circle(judul: "Yowes Ben", image: "03"),
        circle(judul: "Tayo", image: "04"),
        circle(judul: "Danur", image: "05"),
        circle(judul: "Kuntilanak", image: "06"),
        circle(judul: "Kuyang", image: "07"),
        circle(judul: "Tali Pocong", image: "08"),
    ]
    var category = [
        movie(title: "Family"),
        movie(title: "Children"),
        movie(title: "Premium")
    ]
    
    enum bha {
        case circleModel
        case category
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibCell = UINib(nibName: "CircleViewCell", bundle: nil)
        let nibCellRound = UINib(nibName: "TopViewCell", bundle: nil)
        let nibCatego = UINib(nibName: "CategoryViewCell", bundle: nil)
        
        collectionView.register(nibCell, forCellWithReuseIdentifier: MyCollectionViewCellId)
        collectionViewRound.register(nibCellRound, forCellWithReuseIdentifier: MyCol)
        collectionCatego.register(nibCatego, forCellWithReuseIdentifier: MyCatego)
        
        self.collectionView.dataSource = self
        self.collectionViewRound.dataSource = self
        self.collectionCatego.dataSource = self
        
        view.addSubview(collectionViewRound)
        collectionViewRound.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        collectionViewRound.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionViewRound.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 40).isActive = true
        collectionViewRound.heightAnchor.constraint(equalToConstant: view.frame.height/2).isActive = true
        
        
//        view.addSubview(collectionCatego)
//        collectionCatego.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
//        collectionCatego.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -40).isActive = true
//        collectionCatego.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 40).isActive = true
//        collectionCatego.heightAnchor.constraint(equalToConstant: view.frame.height/2).isActive = true

        
    }
    
    
    
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return circleModel.count
        switch collectionView {
        case self.collectionView:
            return circleModel.count
        case collectionViewRound:
            return circleModel.count
        case collectionCatego:
            return category.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == self.collectionView{
            let inset = circleModel.count.self
            return UIEdgeInsets(top: CGFloat(inset), left: CGFloat(inset), bottom: CGFloat(inset), right: CGFloat(inset))
        }else{
             var collection:UICollectionView {
                let layout = UICollectionViewFlowLayout()
                layout.scrollDirection = .horizontal
                let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
                cv.translatesAutoresizingMaskIntoConstraints = false
                cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "TopViewCell")
                cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CategoryViewCell")
                return cv
            }
            let inset = circleModel.count.self
            return UIEdgeInsets(top: CGFloat(inset), left: CGFloat(inset), bottom: CGFloat(inset), right: CGFloat(inset))
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if collectionView == self.collectionViewRound, (self.collectionCatego != nil){
            return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
      
        }else{
            let width = self.calculate()
            return CGSize(width: width, height: width)
        }
        
    }
    
    
    
    func calculate() -> CGFloat {
        if collectionView == self.collectionView{
            let estimase = CGFloat(estimasi)
            let cellCoun = floor(CGFloat(self.view.frame.size.width / estimase))
            let margin = CGFloat(cellMargin * 2)
            let width = (self.view.frame.size.width - CGFloat(cellMargin) * (cellCoun - 1) - margin) / cellCoun
            
            return width
        }
        return calculate()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionView {
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCellId, for: indexPath) as! CircleViewCell
            
            // Set up cell
            cellA.juduLbl.text = circleModel[indexPath.row].judul
            cellA.imageView.image = UIImage(named: circleModel[indexPath.row].image)
            cellA.btnRead.addTarget(self, action: #selector(masterAction(_:)),for: .touchUpInside)
            return cellA
        }
            
        else if collectionView == self.collectionViewRound{
            
            if let layout = collectionViewRound.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .horizontal
                layout.itemSize = CGSize(
                    width: collectionView.contentSize.width/2,
                    height: collectionView.contentSize.height/2
                )
            }
            
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: MyCol, for: indexPath) as! TopViewCell
            
            cellB.judulTop.text = circleModel[indexPath.row].judul
            cellB.imageTop.image = UIImage(named: circleModel[indexPath.row].image)
            return cellB
        }
        else {
            let cellC = collectionView.dequeueReusableCell(withReuseIdentifier: MyCatego, for: indexPath) as! CategoryViewCell
            
            cellC.titleLbl.text = category[indexPath.row].title
            return cellC
        }
        
    }
    
    
    
    @objc func masterAction(_ sender: UIButton)
    {
        let indexPath = collectionView?.indexPath(for: ((sender.superview?.superview) as! CircleViewCell))
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ButtonController") as! ButtonController
        let sendData = "\(indexPath?.row ?? 0)"
        vc.Send = sendData
        
        navigationController?.pushViewController(vc,animated: true)
    }
    
    
    
    class CustomCell: UICollectionViewCell {
        
        var data: circle? {
            didSet {
                guard let data = data else { return }
                bg.text = data.image
                
            }
        }
        
        fileprivate let bg: UILabel = {
            let iv = UILabel()
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
            iv.layer.cornerRadius = 12
            return iv
        }()
        
        override init(frame: CGRect) {
            super.init(frame: .zero)
            
            
            
            
            contentView.addSubview(bg)
            
            bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
            bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
            bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    }

}

