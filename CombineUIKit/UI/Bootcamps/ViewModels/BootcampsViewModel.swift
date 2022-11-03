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
    
    func loadBotcamps() {
        
        let url = URL(string: "https://dragonball.keepcoding.education/api/data/bootcamps")
        var request: URLRequest = URLRequest(url: url!)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.getStatusCode() == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: [Bootcamp].self, decoder: JSONDecoder())
            //We can solve erros here
//            .receive(on: DispatchQueue.main) //We modify UI but only works in SwifUI
            .sink { completion in
                switch completion{
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    print("Success")
                }
            } receiveValue: { data in
                self.bootcamps = data
            }
            .store(in: &subcribers)
    }
    
}
