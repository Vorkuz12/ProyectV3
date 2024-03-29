//
//  MovieViewModel.swift
//  Rest API
//
//  
//
//

import Foundation

class MovieViewModel {
    
    private var apiService = ApiService()
    private var popularMovies = [Movie]()
    
    func fetchPopularMoviesData(completion: @escaping () -> ()) {
        
        // weak self - prevent retain cycles
        apiService.getPopularMoviesData { [weak self] (result) in
            
            switch result {
            case .success(let listOf):
                self?.popularMovies = listOf.movies
                completion()
            case .failure(let error):
                // Something is wrong with the JSON file or the model
                print("Error processing json data: \(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if popularMovies.count != 0 {
            return popularMovies.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> Movie {
        return popularMovies[indexPath.row]
    }
    
    func getMovieDetail(id: Int, completion: @escaping (_:MovieDetail) -> ()) {
        
        apiService.getMovieDetail(id: id, completion: { (result) in
            
            switch result {
            case .success(let movie):
                completion(movie)
            case .failure(let error):
                // Something is wrong with the JSON file or the model
                print("Error processing json data: \(error)")
            }
        })
    }
    
    func getMovieCredits(id: Int, completion: @escaping (_:MovieCredits) -> ()) {
        
        apiService.getMovieCredits(id: id, completion: { (result) in
            
            switch result {
            case .success(let movieCredits):
                completion(movieCredits)
            case .failure(let error):
                // Something is wrong with the JSON file or the model
                print("Error processing json data: \(error)")
            }
        })
    }
    
    func search(term: String, completion: @escaping (_:[Movie]) -> ()) {
        
        apiService.search(term: term, completion: { (result) in
            
            switch result {
            case .success(let listOf):
                self.popularMovies = listOf.results
                completion(listOf.results)
            case .failure(let error):
                // Something is wrong with the JSON file or the model
                print("Error processing json data: \(error)")
            }
        })
    
    }
    
}
