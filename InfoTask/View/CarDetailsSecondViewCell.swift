//
//  CarDetailsSecondViewCell.swift
//  InfoTask
//
//  Created by k sujeet sudhakar nag on 02/03/21.
//

import Foundation
import UIKit
import Kingfisher

class CarDetailsSecondViewCell:UITableViewCell{
    let fixedScreenBounds = UIScreen.main.fixedCoordinateSpace.bounds
    var latValue =  Double()
    var longiValue = Double()

    lazy  var vehicleimageView : UIImageView = {
        let imageView = UIImageView()
//             imageView.layer.cornerRadius = 16
//             imageView.layer.borderWidth = 2.5
            imageView.layer.borderColor = UIColor(red: 47/255.0, green: 49/255.0, blue: 52/255.0, alpha: 1).cgColor
      // self.imageView.contentMode = .scaleAspectFit
            imageView.contentMode = .scaleAspectFit
            imageView.layer.masksToBounds = true
            imageView.backgroundColor = .clear
            imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
    }()

    lazy  var nameLbl : UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .clear
        lbl.textColor = UIColor(red: 209/255.0, green: 230/255.0, blue: 0/255.0, alpha: 1)
        lbl.contentMode = .scaleAspectFit
        lbl.font = UIFont(name: "Times-BoldItalic", size: CGFloat(fixedScreenBounds.width/17.2))
        lbl.numberOfLines = 2
        lbl.layer.masksToBounds = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
         return lbl
    }()
    
    lazy  var makeLbl : UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = nameLbl.backgroundColor
        lbl.textColor = nameLbl.textColor
        lbl.contentMode = .scaleAspectFit
        lbl.font = UIFont(name: "Times-BoldItalic", size: CGFloat(fixedScreenBounds.width/20))
        lbl.layer.masksToBounds = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
         return lbl
    }()
    
    lazy  var colorLbl : UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = nameLbl.backgroundColor
        lbl.textColor = nameLbl.textColor
        lbl.contentMode = .scaleAspectFit
        lbl.font = makeLbl.font
        lbl.layer.masksToBounds = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
         return lbl
    }()
    lazy  var fuelTypeLbl : UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = nameLbl.backgroundColor
        lbl.textColor = nameLbl.textColor
        lbl.contentMode = .scaleAspectFit
        lbl.font = makeLbl.font
        lbl.layer.masksToBounds = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
         return lbl
    }()

    
    lazy  var latitudeLbl : UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = nameLbl.backgroundColor
        lbl.textColor = nameLbl.textColor
        lbl.contentMode = .scaleAspectFit
        lbl.font = makeLbl.font
        lbl.layer.masksToBounds = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
         return lbl
    }()



    lazy  var longitudeLbl : UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = nameLbl.backgroundColor
        lbl.textColor = nameLbl.textColor
        lbl.contentMode = .scaleAspectFit
        lbl.font = makeLbl.font
        lbl.layer.masksToBounds = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
         return lbl
    }()

    lazy var locationBtn: UIButton = {

    let btn = UIButton()
    btn.setImage(#imageLiteral(resourceName: "4200473-64"), for: .normal)
    //btn.backgroundColor = .yellow
    btn.addTarget(self, action: #selector(locationBtnAction), for: .touchUpInside)
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 0);
    btn.imageView?.contentMode = .scaleAspectFit
    btn.adjustsImageSizeForAccessibilityContentSizeCategory = true
    return btn
}()


override func setHighlighted(_ highlighted: Bool, animated: Bool)
{
    super.setHighlighted(highlighted, animated: animated)
    contentView.backgroundColor =  .black
    textLabel?.textColor = .systemBlue
    textLabel?.textAlignment = .right
    detailTextLabel?.textColor = .systemGray
    detailTextLabel?.textAlignment = .right
    textLabel?.textAlignment = .right
    detailTextLabel?.textAlignment = .right


    
}

override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    setUpConfigure()

    //Cell Customization
    textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
    textLabel?.numberOfLines = 10
    textLabel?.adjustsFontSizeToFitWidth = true
   // detailTextLabel?.textColor = .black
    detailTextLabel?.font = UIFont.systemFont(ofSize: 12, weight: .light)

    
}
required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}
}
extension CarDetailsSecondViewCell {
    
    func setUpConfigure(){
        DispatchQueue.main.async { [self] in
            self.selectionStyle = .none
        self.contentView.addSubview(self.nameLbl)
        self.contentView.addSubview(self.makeLbl)
        self.contentView.addSubview(self.colorLbl)
        self.contentView.addSubview(self.latitudeLbl)
        self.contentView.addSubview(self.longitudeLbl)
        self.contentView.addSubview(self.fuelTypeLbl)
        self.contentView.addSubview(self.locationBtn)
        self.contentView.addSubview(self.vehicleimageView)

        self.vehicleimageView.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 5).isActive = true
        self.vehicleimageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 10).isActive = true
        self.vehicleimageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.vehicleimageView.heightAnchor.constraint(equalToConstant: 95).isActive = true

        
    self.nameLbl.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 5).isActive = true
    //self.nameLbl.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 90).isActive = true
    self.nameLbl.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -25).isActive = true
        if (UIDevice.current.userInterfaceIdiom == .phone)
        {
            self.nameLbl.heightAnchor.constraint(equalToConstant: 25).isActive = true
        }
        else
        {
            self.nameLbl.heightAnchor.constraint(equalToConstant: 70).isActive = true
        }

   // self.name.heightAnchor.constraint(equalToConstant: 35).isActive = true
            

    self.makeLbl.topAnchor.constraint(equalTo: self.nameLbl.bottomAnchor,constant: 20).isActive = true
    self.makeLbl.leadingAnchor.constraint(equalTo: self.nameLbl.leadingAnchor,constant: 0).isActive = true
    self.makeLbl.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -5).isActive = true
    self.makeLbl.heightAnchor.constraint(equalTo: self.nameLbl.heightAnchor, constant: 0).isActive = true
            
            
    self.colorLbl.topAnchor.constraint(equalTo: self.makeLbl.bottomAnchor,constant: 10).isActive = true
    self.colorLbl.leadingAnchor.constraint(equalTo: self.makeLbl.leadingAnchor,constant: 0).isActive = true
    self.colorLbl.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant: -10).isActive = true
    self.colorLbl.heightAnchor.constraint(equalTo: self.makeLbl.heightAnchor, constant: 0).isActive = true

            
    self.latitudeLbl.topAnchor.constraint(equalTo: self.colorLbl.bottomAnchor,constant: 10).isActive = true
    self.latitudeLbl.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 10).isActive = true
   // self.latitudeLbl.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant:  -10).isActive = true
    self.latitudeLbl.heightAnchor.constraint(equalTo: self.colorLbl.heightAnchor, constant: 0).isActive = true


    self.longitudeLbl.topAnchor.constraint(equalTo: self.latitudeLbl.bottomAnchor,constant: 10).isActive = true
    self.longitudeLbl.leadingAnchor.constraint(equalTo: self.latitudeLbl.leadingAnchor,constant: 0).isActive = true
    self.longitudeLbl.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant:  -10).isActive = true
    self.longitudeLbl.heightAnchor.constraint(equalTo: self.colorLbl.heightAnchor, constant: 0).isActive = true
            
        
    locationBtn.topAnchor.constraint(equalTo: colorLbl.bottomAnchor, constant: 5).isActive = true
    locationBtn.leadingAnchor.constraint(equalTo: nameLbl.trailingAnchor, constant: 0).isActive = true
    locationBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
    locationBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true

        
        

        
    }
   
    
    }
    
    
    @objc func locationBtnAction(){

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal

        print(latitudeLbl.text!)
        if let latText = formatter.number(from:self.latitudeLbl.text!) {
            self.latValue = Double((latText.doubleValue))
        }
        if let longitudeText = formatter.number(from:self.longitudeLbl.text!)  {
            self.longiValue = Double(longitudeText.doubleValue)
        }
      //  print("lat",latValue,"long",longiValue)

        let mapVc = MapViewController()
        mapVc.modalTransitionStyle = .crossDissolve
        mapVc.modalPresentationStyle = .fullScreen
        mapVc.latToMapVIew = latValue
        mapVc.longToMapView = longiValue
        DispatchQueue.main.async
        {
            var topController: UIViewController = UIApplication.shared.windows.first{ $0.isKeyWindow}! .rootViewController!
            while (topController.presentedViewController != nil) {
                topController = topController.presentedViewController!
                //topController.present(alert, animated: true, completion: nil)

            }
             topController.present(mapVc, animated: true, completion: nil)

        }

    }

}
