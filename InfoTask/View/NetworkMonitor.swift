//
//  NetworkMonitor.swift
//  DiffableCollectionView
//
//  Created by k sujeet sudhakar nag on 18/10/20.
//  Copyright © 2020 k sujeet sudhakar nag. All rights reserved.
//

import Foundation
import Network

final class NetWorkMonitor{
    
    static let shared = NetWorkMonitor()
    static let pathShared = NWPathMonitor()

    private let queue = DispatchQueue.global()
    private let monitor: NWPathMonitor
    
    public private(set) var isConnected: Bool = false
    public private (set) var connectionType: ConnectionType = .unknown
    
    enum ConnectionType {
        case wifi
        case cellular
        case ethernet
        case unknown
    }
    
    private init(){
        monitor = NWPathMonitor()
    }
    
    public func startMonitoring(){
        
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = {[weak self] path in
            self?.isConnected = path.status != .unsatisfied
            self?.getConnectionType(path)
            print(self?.isConnected ?? "N/A")
            print("Monitoring")

        }
    }
    
    public func stopMonitoring(){
        monitor.cancel()
    }
    
    private func getConnectionType(_ path: NWPath){
        
        if path.usesInterfaceType(.wifi) {
            connectionType = .wifi
        }
       else if path.usesInterfaceType(.cellular) {
            connectionType = .cellular
        }

       else if path.usesInterfaceType(.wiredEthernet) {
            connectionType = .ethernet
        }
        else {
            connectionType = .unknown
        }

    }
}
