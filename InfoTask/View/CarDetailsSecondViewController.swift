//
//  CarDetailsSecondViewController.swift
//  InfoTask
//
//  Created by k sujeet sudhakar nag on 02/03/21.
//

import UIKit
import Kingfisher
class CarDetailsSecondViewController: UIViewController {
    let fixedScreenBounds = UIScreen.main.fixedCoordinateSpace.bounds
    let cellReuseIdentifier = "cell"
    var vehicleDetailsArr = [ApiResponseModel]()

  fileprivate  lazy var navLabel: UILabel = {
        let label = UILabel()
        label.textColor =  UIColor(red: 209/255.0, green: 230/255.0, blue: 0/255.0, alpha: 1)
        label.text = "VehicleDetails"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont(name: "Times-BoldItalic", size: CGFloat(fixedScreenBounds.width/15))

        //label.backgroundColor = UIColor(red: 223/255.0, green: 77/255.0, blue: 63/255.0, alpha: 1)
        return label
         
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

   fileprivate lazy var userTableView: UITableView = {
        
        let tableview = UITableView()
        tableview.backgroundColor = .clear
        tableview.estimatedRowHeight = 243
        tableview.rowHeight = UITableView.automaticDimension
        tableview.refreshControl = UIRefreshControl()
        tableview.refreshControl?.tintColor = navLabel.textColor
        tableview.separatorColor = navLabel.textColor
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    fileprivate func viewLoadingMethod() {
        
        self.view.addSubview(self.backBtn)
        self.view.addSubview(self.navLabel)
        self.view.addSubview(self.userTableView)
        userTableView.refreshControl!.addTarget(self, action: #selector(refreshCtrlAction), for: .valueChanged)

        self.userTableView.register(CarDetailsSecondViewCell.self, forCellReuseIdentifier: self.cellReuseIdentifier)
        self.userTableView.dataSource = self
        self.userTableView.delegate = self
        self.userTableView.allowsMultipleSelectionDuringEditing = true
        
        layoutConstraints()
        tableViewReloadMethod()
    }

    fileprivate func layoutConstraints()
      {
        backBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true

         navLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
         navLabel.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 60).isActive = true
         navLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35).isActive = true
         navLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
      userTableView.topAnchor.constraint(equalTo: navLabel.bottomAnchor, constant: 20).isActive = true
      userTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
      userTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
      userTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
         

     }
    fileprivate func tableViewReloadMethod()
    {  print("Reload called")
                DispatchQueue.main.async
                {
                    self.userTableView.reloadData()
                }
        

    }
    @objc fileprivate func refreshCtrlAction(refreshControl: UIRefreshControl)
    {
        //print("Hello World!")
        userTableView.reloadData()
        refreshControl.endRefreshing()
   }

    @objc fileprivate func btnAction()
    {
            self.dismiss(animated: true, completion: nil)

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
              viewLoadingMethod()
        // Do any additional setup after loading the view.
    }
    

  

}
extension CarDetailsSecondViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return vehicleDetailsArr.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                guard  let cell  = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? CarDetailsSecondViewCell else {
            
            return UITableViewCell()
        }
        DispatchQueue.main.async {
            
        
        cell.backgroundColor = .clear
            let userData = self.vehicleDetailsArr[indexPath.row]
           // print("userDataFromSecVC",userData as Any)
          //  cell.layer.cornerRadius = 22
            cell.nameLbl.text =  "Name:\(userData.vehicleDetails?.name ?? "")" 
            cell.makeLbl.text = "Make:\(userData.vehicleDetails?.make ?? "")"
            cell.colorLbl.text = "LicensePlate:\(userData.licensePlate ?? "")"
            cell.latitudeLbl.text =  String(userData.location?.latitude ?? 0.0)
            cell.longitudeLbl.text = String(userData.location?.longitude ?? 0.0)
           // cell.fuelTypeLbl.text = userData.vehicleDetails?.fuel_type
            //print(cell.latitudeLbl.text)
            let url = URL(string: userData.carImageUrl ?? "")
            let serialQueue = DispatchQueue(label: "mySerialQueue")
                if let url = url{
                KingfisherManager.shared.retrieveImage(with: url as Resource, options: nil, progressBlock: nil){(image, error,cache, imageURL)in
                    serialQueue.async {
                        DispatchQueue.main.async {

                        cell.vehicleimageView .image = image
                        cell.vehicleimageView.kf.indicatorType = .activity
                        cell.vehicleimageView.kf.setImage(with: url, placeholder:cell.vehicleimageView.image , options: [.transition(.fade(0.3))])
                        }
                    
                    }

                }

            }

        }
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        
//        if self.SelectedCell == indexPath.row && isCollapse
//        {
//            return 243
//        }
//        else
//        {
//            return 60
//        }
       let size = (tableView.frame.size.width - 14)/1.5
                return CGFloat(size)
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        tableView.deselectRow(at: indexPath, animated: true)
//        if SelectedCell == indexPath.row {
//            if self.isCollapse == false
//            {
//                self.isCollapse = true
//            }
//            else
//            {
//                self.isCollapse = false
//            }
//        }
//        else
//        {
//            self.isCollapse = true
//        }
//        self.SelectedCell = indexPath.row
//        tableView.reloadRows(at: [indexPath], with: .automatic)
//    }
    
    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//       // print(indexPath.row)
//    }
    
    




}

