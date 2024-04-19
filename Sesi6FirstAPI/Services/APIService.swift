//
//  APIService.swift
//  Sesi6FirstAPI
//
//  Created by MACBOOK PRO on 19/04/24.
//

import Foundation
// kenapa pakai class ? untuk memastikan bahwa hanya ada satu object bersama yang akan digunakan diseluruh aplikasi,
//disebut dengan singleton, jadi setiap ada perubahan state di bagian lain dari aplikasi, statenya akan sama di semua bagian, seperti konsep mobil yang diubah warna ketika sudah memiliki kuncinya
//cara memanggilnya APIService.shared
//

class APIService {
    static let shared = APIService()
    
    //untuk mencegah kelas APIService di re-create di tempat lain
    private init(){}
    
    func fetchJokeServices() async throws -> Joke {
        let urlString = URL(string: Constants.jokeAPI)
        
        guard let url = urlString else{
            print("😡 Error : Clould not convert \(String(describing: urlString)) to a URL")
            throw URLError(.badURL)
        }
        print("🕸️ We are accessing the url \(url)")
        
        //request data
        let (data, response) = try await URLSession.shared.data(from: url)
        
        //handle response
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        guard(200...299).contains(httpResponse.statusCode) else{
            throw URLError(.init(rawValue: httpResponse.statusCode))
        }
        
        //handle data
        let joke = try JSONDecoder().decode(Joke.self, from: data)
        return joke
    }
}


