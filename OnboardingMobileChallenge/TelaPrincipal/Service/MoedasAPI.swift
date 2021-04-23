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
    
    // MARK: - Variáveis
    var listaMoedas: [ListaMoeda] = []
    var erros = Erros()
    
    // MARK: - Funções
    public func requestMoedas(queue: DispatchQueue = .main, completionHandler: @escaping([ListaMoeda]) -> Void) {
        AF.request(DadosChamadaApi.urlListaMoedas, method: .get, headers: DadosChamadaApi.headers).response { [self] (responseData) in
            guard let data = responseData.data else { return }
            do {
                let retorno = try JSONDecoder().decode([ListaMoeda].self, from: data)
                let retornoJustCrypto = retorno.filter { $0.typeIsCrypto == 1 }
                let retornoNotNil = retornoJustCrypto.filter { $0.priceUsd != nil }
                let retornoMaiorQueZero = retornoNotNil.filter { $0.priceUsd ?? 0.0 > 0.5 }
                let haveName = retornoMaiorQueZero.filter { $0.name ?? "" != "" }
                let retornoComImagem = haveName.filter { $0.idIcon != nil }
                self.listaMoedas = retornoComImagem
                completionHandler(retornoComImagem)
            } catch {
                guard let statusCode = responseData.response?.statusCode else { return }
                self.erros.sobrescreverMensagemDeErro(statusCode: statusCode)
            }
        }
    }
}
