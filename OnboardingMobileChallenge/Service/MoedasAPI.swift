//
//  MoedasAPI.swift
//  OnboardingMobileChallenge
//
//  Created by Jaqueline Bittencourt Santos on 14/04/21.
//
import Foundation
import UIKit
import Alamofire

struct ApiKey {
    static let urlListaMoedas = "https://rest-sandbox.coinapi.io/v1/assets/"
    static let headers: HTTPHeaders = [
        "X-CoinAPI-Key": "FC08A1F5-7823-40C8-BC82-B4BE39E12796",
        "Accept": "application/json"
    ]
}


public class MoedasAPI: NSObject {
    
    var listaMoedas: [ListaMoeda] = []
    var erros = Erros()
    
    public func requestMoedas(){
        
        AF.request(ApiKey.urlListaMoedas, method: .get, headers: ApiKey.headers).response { [self]
            (responseData) in
            guard let data = responseData.data else {return}
            print(data)
            do {
                let retorno = try JSONDecoder().decode([ListaMoeda].self, from: data)
                self.listaMoedas = retorno
                print(retorno)
            } catch{
                guard let statusCode = responseData.response?.statusCode else {return}
                self.erros.sobrescreverMensagemDeErro(statusCode: statusCode)
            }
        }
    }
}
