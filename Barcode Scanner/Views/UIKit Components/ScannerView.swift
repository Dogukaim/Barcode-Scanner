//
//  ScannerView.swift
//  Barcode Scanner
//
//  Created by Doğukan Varılmaz on 29.04.2023.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertITem: AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    final class Coordinator: NSObject,ScannerVCDelegate {
        
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            switch error {
                case .invalidDeviceInput:
                DispatchQueue.main.async {
                    self.scannerView.alertITem = AlertContext.invalidDeviceInput
                }
                case .invalidScannedValue:
                    scannerView.alertITem = AlertContext.invalidScannedType
            }
        }
    }
}
    
