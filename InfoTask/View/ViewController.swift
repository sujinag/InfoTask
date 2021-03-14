

import Foundation
import UIKit
import Kingfisher
//import AlamofireImage
import Alamofire
import Network


class ViewController: UIViewController {
      let parse = APIManager()
      var mappedDataFromUrlArr = [ApiResponseModel]()
      let monitor = NWPathMonitor()
   fileprivate lazy var mainCollectionView : UICollectionView = {
        
          let layout = UICollectionViewFlowLayout()
          let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        layout.scrollDirection = .vertical
              collectionView.translatesAutoresizingMaskIntoConstraints = false
          return collectionView
        

    }()

    
    fileprivate func reloadData() {
        self.mainCollectionView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("sujeet")
        self.mainCollectionView.delegate = self
        self.mainCollectionView.dataSource = self
        self.view.addSubview(self.mainCollectionView)
        self.mainCollectionView.register( CarDetailsCollectionViewCell.self, forCellWithReuseIdentifier: CarDetailsCollectionViewCell.reuseIdentifier)
       
        
//        NetWorkMonitor.pathShared.pathUpdateHandler = { path in
//            if path.status == .satisfied {
//                DispatchQueue.main.async
//                {
//                    print("Wifi Connected")
//                    self.view.backgroundColor = .green
//                }
//            }
//            else{
//                DispatchQueue.main.async
//                {
//                    self.view.backgroundColor = .red
//                    //AlertClass.showAlert(title: "Alert", msg: "No internet Connection", viewController: self)
//                    print("Wifi DisConnected")
//                }
//
//            }
//
//        }
//
//        let pathMonitorQueue = DispatchQueue(label: "Network")
//        NetWorkMonitor.pathShared.start(queue: pathMonitorQueue)
        
        
        
        if NetWorkMonitor.shared.isConnected {
            print("Internet Connected")
            parse.fetchDataFromURL { data in
                
                self.mappedDataFromUrlArr = data
                if self.mappedDataFromUrlArr.count == 0{
                    print("no data")
                }
                DispatchQueue.main.async { [self] in
                    self.reloadData()
                }
                print(self.mappedDataFromUrlArr)
            }

        }
        else
        {
            AlertClass.showAlert(title: "Alert", msg: "No Network", viewController: self)

            print("Internet Not Connected")
        }
        
        
        layOutConstraints()
        
     

        // Do any additional setup after loading the view.
    }
    
    
    fileprivate func layOutConstraints()
    {
        
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            self.mainCollectionView.topAnchor.constraint(equalTo: view.topAnchor,constant: 120).isActive = true
        }
        
       else if UIDevice.current.userInterfaceIdiom == .phone
        {
        self.mainCollectionView.topAnchor.constraint(equalTo: view.topAnchor,constant: 70).isActive = true
        }
        self.mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        self.mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        self.mainCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true

    }


}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return mappedDataFromUrlArr.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CarDetailsCollectionViewCell.reuseIdentifier,
                       for: indexPath) as? CarDetailsCollectionViewCell else { fatalError("Could not create new cell")
           
        }
        let titles = mappedDataFromUrlArr[indexPath.row ]
//        print("titles",titles)
        cell.layer.cornerRadius = 16
        cell.layer.borderWidth = 2.5
        cell.layer.borderColor = UIColor(red: 47/255.0, green: 49/255.0, blue: 52/255.0, alpha: 1).cgColor
       // cell.backgroundColor = .purple
       cell.titleLabel.text = titles.modelName ?? ""
        let url = URL(string: titles.carImageUrl ?? "")
        let serialQueue = DispatchQueue(label: "mySerialQueue")
            if let url = url{
            KingfisherManager.shared.retrieveImage(with: url as Resource, options: nil, progressBlock: nil){(image, error,cache, imageURL)in
                serialQueue.async {
                    DispatchQueue.main.async {

                    cell.uploadedBrandimageView.image = image
                    cell.uploadedBrandimageView.kf.indicatorType = .activity
                    cell.uploadedBrandimageView.kf.setImage(with: url, placeholder:cell.uploadedBrandimageView.image , options: [.transition(.fade(0.3))])
                    }
                
                }

            }

        }
            return cell
        }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
            print("cell selected")
        let titles = mappedDataFromUrlArr[indexPath.row ]
       // print("cell selected titles",titles.vDetails)
        let secVc = CarDetailsSecondViewController()
        secVc.vehicleDetailsArr = [titles]
        secVc.modalTransitionStyle = .crossDissolve
        secVc.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async
        {
            self.present(secVc, animated: true, completion: nil)
        }
    
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
       {
           let size = (collectionView.frame.size.width - 10)/2
            return CGSize(width: size, height: size)

    }
    


   

}
