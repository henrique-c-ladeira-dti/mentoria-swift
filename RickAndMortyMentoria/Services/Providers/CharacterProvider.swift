//
//  CharacterProvider.swift
//  RickAndMortyMentoria
//
//  Created by Henrique Ladeira on 09/11/23.
//

import Foundation

enum CharacterProvider {
    case getAllCharacters
    case getSingleCharacter(id: Int)
    case getMultipleCharacter(ids: [Int])
    case filterCharacters(queryItems: [URLQueryItem])
}

extension CharacterProvider: ApiEndpoint {
    var baseURLString: String {
        "https://rickandmortyapi.com"
    }
    
    var apiPath: String {
        "api"
    }
    
    var separatorPath: String? {
        "character"
    }
    
    var path: String {
        switch self {
        case .getAllCharacters: return ""
        case .getSingleCharacter(let id): return "\(id)"
        case .getMultipleCharacter(let ids): return "\(ids.map { "\($0)" }.joined(separator: ",").dropLast())"
        case .filterCharacters: return ""
        }
    }
    
    var headers: [String : String]? {
        nil
    }
    
    var queryForCall: [URLQueryItem]? {
        switch self {
        case .filterCharacters(let queryItems): return queryItems
        default: return nil
        }
    }
    
    var params: [String : Any]? {
        nil
    }
    
    var method: APIHTTPMethod {
        .GET
    }
    
    var customDataBody: Data? {
        nil
    }
    
    
}
