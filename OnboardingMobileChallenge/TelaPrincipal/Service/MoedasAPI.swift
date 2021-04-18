//
//  MoedasAPI.swift
//  OnboardingMobileChallenge
//
//  Created by Jaqueline Bittencourt Santos on 14/04/21.
//
import Foundation
import UIKit
import Alamofire

public class MoedasAPI: NSObject {
    
    var listaMoedas: [ListaMoeda] = []
    var erros = Erros()
  

    public func requestMoedas(queue: DispatchQueue = .main, completionHandler: @escaping([ListaMoeda]) -> Void) {

        AF.request(DadosChamadaApi.urlListaMoedas, method: .get, headers: DadosChamadaApi.headers).response { [self]
            (responseData) in
            guard let data = responseData.data else {return}
            print(data)
            do {
                let retorno = try JSONDecoder().decode([ListaMoeda].self, from: data)
                self.listaMoedas = retorno
                completionHandler(retorno)
//                print(retorno)
            } catch{
                guard let statusCode = responseData.response?.statusCode else {return}
                self.erros.sobrescreverMensagemDeErro(statusCode: statusCode)
            }
        }
    }
}
