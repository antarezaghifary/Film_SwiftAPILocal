//
//  CobaController.swift
//  Film INA
//
//  Created by 247 on 15/08/19.
//  Copyright © 2019 247. All rights reserved.
//

import UIKit

class CobaController: UIViewController {
    
    @IBOutlet weak var collectionCOba: UICollectionView!
    @IBOutlet weak var collectionVertic: UICollectionView!
    
    fileprivate var collection:UICollectionView {
        let layout = UICollectionViewFlowLayout()
        //layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }
    
    var cobaview = TopViewCell()
    var verticview = CircleViewCell()
    
    var estimasi = 160.0
    var cellMargin  = 16.0
    
    let MyCol: String = "TopCell"
    let MyCollectionViewCellId: String = "circleView"
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibCellRound = UINib(nibName: "TopViewCell", bundle: nil)
        let nibCell = UINib(nibName: "CircleViewCell", bundle: nil)
        
        
        collectionCOba.register(nibCellRound, forCellWithReuseIdentifier: MyCol)
        collectionVertic.register(nibCell, forCellWithReuseIdentifier: MyCollectionViewCellId)

        self.collectionCOba.dataSource = self
        self.collectionVertic.dataSource = self

                view.addSubview(collectionCOba)
                collectionCOba.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
                collectionCOba.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
                collectionCOba.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
                collectionCOba.heightAnchor.constraint(equalToConstant: view.frame.height/2).isActive = true
    }
}

extension CobaController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
        
        if collectionView == self.collectionCOba{
            let width = collectionVertic.contentSize.width/2
            return CGSize(width: width, height: collectionView.contentSize.height/1)
        }else{
            let width = self.calculate()
            return CGSize(width: width, height: width)
        }
}
    
    func calculate() -> CGFloat {
        if collectionVertic == self.collectionCOba{
            
        }
        let estimase = CGFloat(estimasi)
        let cellCoun = floor(CGFloat(self.view.frame.size.width / estimase))
        let margin = CGFloat(cellMargin * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMargin) * (cellCoun - 1) - margin) / cellCoun
        
        return width
    }
    
    
internal func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
}

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == self.collectionCOba{
            let inset = circleModel.count.self
            return UIEdgeInsets(top: CGFloat(inset), left: CGFloat(inset), bottom: CGFloat(inset), right: CGFloat(inset))
        }else{
            let inset = circleModel.count.self
            return UIEdgeInsets(top: CGFloat(inset), left: CGFloat(inset), bottom: CGFloat(inset), right: CGFloat(inset))
        }
        
    }
    
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return circleModel.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    if collectionView == collectionVertic {
    let cell = collectionCOba.dequeueReusableCell(withReuseIdentifier: "TopCell", for: indexPath) as! TopViewCell

    cell.judulTop.text = circleModel[indexPath.row].judul
    cell.imageTop.image = UIImage(named: circleModel[indexPath.row].image)
    return cell
    } else{
        if let layout = collectionCOba.collectionViewLayout as? UICollectionViewFlowLayout {
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
    @objc func masterAction(_ sender: UIButton)
    {
        let indexPath = collectionVertic?.indexPath(for: ((sender.superview?.superview) as! CircleViewCell))
        //        print("button \(indexPath)")
        //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ButtonController") as! ButtonController
        let sendData = "\(indexPath?.row ?? 0)"
        vc.Send = sendData
        
        //        present(vc, animated: true, completion: nil)
        navigationController?.pushViewController(vc,animated: true)
    }
}
