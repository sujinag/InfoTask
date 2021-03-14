//
//  MapViewController.swift
//  CAInfotech
//
//  Created by k sujeet sudhakar nag on 17/12/20.
//

import UIKit
import GoogleMaps
class MapViewController: UIViewController {
    var latToMapVIew:Double = Double()
    var longToMapView:Double = Double()
    lazy var navLabel: UILabel = {
        let label = UILabel()
        label.textColor =  UIColor(red: 250/255.0, green: 50/255.0, blue: 58/255.0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
         
    }()
    lazy var mapUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
         
    }()

    
    fileprivate lazy var backBtn: UIButton = {

     let btn = UIButton()
     btn.setImage(#imageLiteral(resourceName: "2931162-64"), for: .normal)
     //btn.backgroundColor = .yellow
     btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
     btn.translatesAutoresizingMaskIntoConstraints = false
     btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 0);
     btn.imageView?.contentMode = .scaleAspectFit
     btn.adjustsImageSizeForAccessibilityContentSizeCategory = true
     return btn
 }()


    fileprivate func viewLoadingMethod() {
        self.view.backgroundColor = UIColor(red: 209/255.0, green: 230/255.0, blue: 0/255.0, alpha: 1)
        // self.view.addSubview(self.navLabel)
        self.view.addSubview(self.mapUIView)
        self.view.addSubview(self.backBtn)
        let camera = GMSCameraPosition.camera(withLatitude: 15.51794162952855, longitude: 80.03002197489145, zoom: 0.01)
        
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.mapUIView.addSubview(mapView)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(latToMapVIew), longitude: CLLocationDegrees(longToMapView))
        marker.map = mapView
        layoutConstraints()
        print("lat",latToMapVIew,"long",longToMapView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.showSpinner(onView: self.view)
    }
    override func viewDidAppear(_ animated: Bool) {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: {(timer) in
                 self.removeSpinner()
                 
                })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewLoadingMethod()
    }
    
    @objc fileprivate func btnAction()
    {
            self.dismiss(animated: true, completion: nil)

        
    }
    
    fileprivate func layoutConstraints() {
        
        
        backBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        
        mapUIView.topAnchor.constraint(equalTo: backBtn.bottomAnchor, constant: 10).isActive = true
        mapUIView.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant: 0).isActive = true
        mapUIView.trailingAnchor.constraint(equalTo:self.view.trailingAnchor, constant: 0).isActive = true
        mapUIView.bottomAnchor.constraint(equalTo:self.view.bottomAnchor, constant: 0).isActive = true

    }

}
