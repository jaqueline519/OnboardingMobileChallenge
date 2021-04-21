//
//  MoedasAPI.swift
//  OnboardingMobileChallenge
//
//  Created by Jaqueline Bittencourt Santos on 14/04/21.
//
import Foundation
import UIKit
import Alamofire
import ModuloCommons

public class MoedasAPI: NSObject {
    
    var listaMoedas: [ListaMoeda] = []
    var erros = Erros()
  

    public func requestMoedas(queue: DispatchQueue = .main, completionHandler: @escaping([ListaMoeda]) -> Void) {

        AF.request(DadosChamadaApi.urlListaMoedas, method: .get, headers: DadosChamadaApi.headers).response { [self]
            (responseData) in
            guard let data = responseData.data else {return}
            //print(data)
            do {
                let retorno = try JSONDecoder().decode([ListaMoeda].self, from: data)
//                self.listaMoedas = retorno
                let retornoJustCrypto = retorno.filter { $0.typeIsCrypto == 1}
                let retornoNotNil = retornoJustCrypto.filter { $0.priceUsd != nil }
                let retornoMaiorQueZero = retornoNotNil.filter { Double($0.priceUsd ?? 0) > 0.0 }
//                Double($0) ?? .nan
                let retornoComImagem = retornoMaiorQueZero.filter { $0.idIcon != nil }
                self.listaMoedas = retornoComImagem
                print("---\(self.listaMoedas.count)")
//                self.listaMoedas = listaMoedas.filter{let price = $0.priceUsd ?? 0}
//                self.listaMoedas = listaMoedas.filter{ $0.priceUsd > 0.0 }
        
                completionHandler(retorno)
//                print(retorno)
            } catch{
                guard let statusCode = responseData.response?.statusCode else {return}
                self.erros.sobrescreverMensagemDeErro(statusCode: statusCode)
            }
        }
    }
}
