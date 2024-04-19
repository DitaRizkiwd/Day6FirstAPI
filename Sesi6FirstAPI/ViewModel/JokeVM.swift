//
//  JokeVM.swift
//  Sesi6FirstAPI
//
//  Created by MACBOOK PRO on 19/04/24.
//

import Foundation

@MainActor //memastikan bahwa proses di background dapat berjalan secara paralel dengan ui dengan membedakan thread yang digunakan menghindari terjadinya frees=ze
class JokeVM: ObservableObject{
    @Published var joke: Joke?
    @Published var isLoading = false
    @Published var errorMessage:String?
    
    func fetchJoke() async {
        isLoading = true
        errorMessage = nil
        
        do{
            joke = try await APIService.shared.fetchJokeServices()
            print("Setup: \(joke?.setup ?? "No Setup")")
            print("punchline : \(joke?.punchline ?? "No puncline")")
            isLoading = false
            
        } catch{
            errorMessage = error.localizedDescription
            isLoading = false
            print("Error : Could not get data from UR : \(Constants.jokeAPI).\(error.localizedDescription)")
            
        }
    }
}
