//
//  BootcampsViewModel.swift
//  CombineUIKit
//
//  Created by Roberto Rojo Sahuquillo on 3/11/22.
//

import Foundation
import Combine

final class BootcampsViewModel: ObservableObject{
    
    @Published var bootcamps: [Bootcamp] = Array<Bootcamp>()
    var subcribers = Set<AnyCancellable>()
    
    
    
}
