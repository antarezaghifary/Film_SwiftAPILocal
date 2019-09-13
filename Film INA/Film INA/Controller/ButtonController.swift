//
//  ButtonController.swift
//  Film INA
//
//  Created by 247 on 13/08/19.
//  Copyright © 2019 247. All rights reserved.
//

import UIKit
import Foundation

class ButtonController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var controlSegment: UISegmentedControl!
    
    var Send = ""
    
    let tableView = UITableView()
    
    let MyCollectionViewCellId: String = "filmView"
    let MyEpi: String = "episode"
    
    var estimasi = 283
    var cellMargin  = 16.0
    
    var detailView = DetailViewCell()
    var epiView = EpisodeViewCell()
    
    var Detailfilm = [film]()
    //var Episode = [episode]()
    
    var Episode = [
        episode(judul: "New Valak", desc: "Film Terlaris 2019", epi: "1"),
        episode(judul: "New Valak Duwa", desc: "Kisah seseorang yang dibunuh di gereja", epi: "2")
    ]
    var Comment = [
        episode(judul: "Wowbagus", desc: "Wowbagus", epi: "Wowbagus"),
        episode(judul: "Wowbagus", desc: "Wowbagus", epi: "Wowbagus")
    ]
    var Recom = [
        episode(judul: "Anable", desc: "Anable", epi: "Anable"),
        episode(judul: "Anable", desc: "Anable", epi: "Anable")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        //print(Send)
        
        let nibCell = UINib(nibName: "DetailViewCell", bundle: nil)
        
        collectionView.register(nibCell, forCellWithReuseIdentifier: MyCollectionViewCellId)
        
        self.collectionView.dataSource = self
        self.tableView.dataSource = self
        
        
        halo()
    }
    
    @IBAction func buttonSm(_ sender: Any) {
        if controlSegment.selectedSegmentIndex == 0 {
            //print("Wkwkwkwkwkw")
            //Episode.removeAll()
            self.view.accessibilityIdentifier = "episode"
            tableView.dataSource = self
            tableView.reloadData()
            
        } else if controlSegment.selectedSegmentIndex == 1{
            //print("Hahahahahahaha")
            //Comment.removeAll()
            self.view.accessibilityIdentifier = "episode"
            tableView.dataSource = self
            tableView.reloadData()
        } else {
            //print("Masokpakeko")
            //Recom.removeAll()
            self.view.accessibilityIdentifier = "episode"
            tableView.dataSource = self
            tableView.reloadData()
        }
    }
    func halo(){
        if Send == "0" {
            Detailfilm.append(film(image: "01", judul: "Valak", genre: "Ghost", rilis: "2020", review: "Bintang 4", desc: "Film ini akan launching 2020. Ketika seorang biarawati muda di biara terpencil Rumania mengorbankan hidupnya sendiri, seorang pendeta dengan masa lalu yang kelam dan seorang calon biawawati dikirim oleh Vatikan untuk menyelidiki peristiwa ini. Bersama-sama mereka membuka rahasia rahasia yang tidak terduga. "))
        } else if Send == "1" {
            Detailfilm.append(film(image: "02", judul: "2 Garis Biru", genre: "Love", rilis: "2019", review: "Bintang 2", desc: "Film ini akan launching 2019. Bima dan Dara adalah sepasang kekasih yang masih duduk di bangku SMA. Pada usia 17 tahun, mereka nekat bersanggama di luar nikah. Dara pun hamil. Keduanya kemudian dihadapkan pada kehidupan yang tak terbayangkan bagi anak seusia mereka, kehidupan sebagai orangtua."))
        } else if Send == "2" {
            Detailfilm.append(film(image: "03", judul: "Yowis Ben", genre: "Comedy", rilis: "2021", review: "Bintang 2", desc: "Film ini akan launching 2019. Bayu menyukai Susan sejak lama, namun merasa minder dengan keadaan dirinya yang pas-pasan. Bayu bertekad mengubah dirinya menjadi lebih populer dari Roy, pacar Susan yang gitaris band. Ia membentuk band bersama teman-temannya, yang dinamai Yowis Ben. Langkah Bayu dan teman-temannya tidak mudah. Terjadi perpecahan antar personil band. Berhasilkah Bayu mempertahankan band-nya dan mendapatkan Susan?"))
        }else if Send == "3" {
            Detailfilm.append(film(image: "04", judul: "Tayo", genre: "Ngeblong", rilis: "2022", review: "Bintang 2", desc: "Film ini akan launching 2019. Tayo the Little Bus adalah serial animasi Korea Selatan yang diproduksi oleh Iconix Entertainment dan Educational Broadcasting System"))
        } else if Send == "4" {
            Detailfilm.append(film(image: "05", judul: "Danur", genre: "Ghost", rilis: "2023", review: "Bintang 2", desc: "Film ini akan launching 2019. Danur: I Can See Ghosts atau Ghost Danur: I Can See Them merupakan film horor Indonesia yang dirilis pada 30 Maret 2017 disutradarai oleh Awi Suryadi. Film ini diangkat dari buku karya Risa Saraswati, Gerbang Dialog Danur yang ditulis berdasarkan pengalamannya sendiri sebagai seorang gadis indigo."))
        } else if Send == "5" {
            Detailfilm.append(film(image: "06", judul: "Kuntilanak", genre: "Ghost", rilis: "2024", review: "Bintang 2", desc: "Film ini akan launching 2019. Kuntilanak atau sering disingkat kunti adalah hantu yang dipercaya berasal dari perempuan hamil yang meninggal dunia atau wanita yang meninggal karena melahirkan dan anak tersebut belum sempat lahir. Nama puntianak merupakan singkatan dari perempuan mati beranak"))
        } else if Send == "6" {
            Detailfilm.append(film(image: "07", judul: "Kuyang", genre: "Ghost", rilis: "2025", review: "Bintang 2", desc: "Film ini akan launching 2019. Kuyang merupakan siluman berwujud kepala manusia dengan isi tubuh yang menempel tanpa kulit dan anggota badan yang dapat terbang untuk mencari darah bayi atau darah wanita setelah melahirkan. Makhluk ini dikenal masyarakat di Kalimantan"))
        } else if Send == "7" {
            Detailfilm.append(film(image: "08", judul: "Tali Pocong", genre: "Ghost", rilis: "2026", review: "Bintang 2", desc: "Film ini akan launching 2019. Tali Pocong Perawan merupakan sebuah film Indonesia yang dirilis pada tahun 2008. Film yang disutradarai oleh Arie Azis ini pemainnya antara lain ialah Dewi Persik, Ibnu Jamil, Catherine Wilson, dan Ramon Y. Tungka. Tanggal rilisnya p ada 10 April 2008. "))
        }
    }
    
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return Detailfilm.count
    }
    
    
//    Pengarutan Tampilan
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculate()
        return CGSize(width: width, height: width)
    }
    
    func calculate() -> CGFloat {
        let estimase = CGFloat(estimasi)
        let cellCoun = floor(CGFloat(self.view.frame.size.width / estimase))
        let margin = CGFloat(cellMargin * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMargin) * (cellCoun - 1) - margin) / cellCoun
        
        return width
    }
    
// TUTUP Pengaturan
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCellId, for: indexPath) as! DetailViewCell
        cell.imageDetail.image = UIImage(named: Detailfilm[indexPath.row].image)
        cell.judulDet.text = Detailfilm[indexPath.row].judul
        cell.genreDet.text = Detailfilm[indexPath.row].genre
        cell.rilisDet.text = Detailfilm[indexPath.row].rilis
        cell.reviewDet.text = Detailfilm[indexPath.row].review
        cell.descDet.text = Detailfilm[indexPath.row].desc
        return cell
        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return Episode.count
        switch tableView {
        case self.tableView:
            return Episode.count
        case tableView:
            return Comment.count
        case tableView:
            return Recom.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableView{
        let celld = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomViewCell
        celld.judulLbl.text = Episode[indexPath.row].judul
        celld.descLbl.text = Episode[indexPath.row].desc
        celld.epiLbl.text = Episode[indexPath.row].epi
        return celld
        } else if tableView == tableView {
            let cellb = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomViewCell
            cellb.judulLbl.text = Comment[indexPath.row].judul
            cellb.descLbl.text = Comment[indexPath.row].desc
            cellb.epiLbl.text = Comment[indexPath.row].epi
            return cellb
        } else {
            let cellc = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomViewCell
            cellc.judulLbl.text = Recom[indexPath.row].judul
            cellc.descLbl.text = Recom[indexPath.row].desc
            cellc.epiLbl.text = Recom[indexPath.row].epi
            return cellc
        }
    }
}

