

import Foundation
import UIKit
class CarDetailsCollectionViewCell: UICollectionViewCell
{
     lazy  var uploadedBrandimageView : UIImageView = {
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

   
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(red: 209/255.0, green: 230/255.0, blue: 0/255.0, alpha: 1)
         label.textColor = .red
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        if (UIDevice.current.userInterfaceIdiom == .phone)
        {
           label.font = UIFont(name: "Times-BoldItalic", size: 20)
        }
        else
        {
            label.font = UIFont(name: "Times-BoldItalic", size: 30)

        }
      //  label.font = UIFont.preferredFont(forTextStyle: .headline)
       // label.backgroundColor = UIColor(red: 223/255.0, green: 77/255.0, blue: 63/255.0, alpha: 1)
        return label
         
    }()
    
//var arrdata = [UploadedGetData]()
static let reuseIdentifier = "CarDetailsCollectionViewCell"
    override init(frame: CGRect) {
      super.init(frame: frame)
     setUpConfigure()
        
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpConfigure(){
        DispatchQueue.main.async {
            self.backgroundColor = .black
            self.addSubview(self.titleLabel)
            self.addSubview(self.uploadedBrandimageView)
            
            self.uploadedBrandimageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5).isActive = true
            self.uploadedBrandimageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5).isActive = true
            self.uploadedBrandimageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5).isActive = true
            self.uploadedBrandimageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -35).isActive = true

            self.titleLabel.topAnchor.constraint(equalTo: self.uploadedBrandimageView.bottomAnchor, constant: 5).isActive = true
            self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5).isActive = true
            self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5).isActive = true
               self.titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true

        }
    }// end
}
