//
//  BarcodeScannerViewModel.swift
//  Barcode Scanner
//
//  Created by Doğukan Varılmaz on 29.04.2023.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    
    @Published  var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    var  statusText: String {
        scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
}
