//
//  UserPreferencesController.swift
//  Sunarp
//
//  Created by Joel Chuco Marrufo on 22/07/22.
//

import Foundation

class UserPreferencesController {
 
    private static let preferences = UserDefaults.standard
    
    static func clearPreference() {
        self.clearGuid()
        self.clearAccessToken()
        self.clearRefreshToken()
        self.clearTokenType()
        self.clearJti()
    }
    
    //MARK: - First Launch
    static func isFirstLaunch() -> Bool {
        return preferences.object(forKey: "USER_FIRST_LAUNCH") as? Bool ?? true
    }
    
    static func setFirstLaunch(isFirstLaunch: Bool?) {
        if isFirstLaunch == nil {
            clearFirstLaunch()
        } else {
            preferences.set(isFirstLaunch, forKey: "USER_FIRST_LAUNCH")
            preferences.synchronize()
        }
    }
    
    static func clearFirstLaunch() {
        preferences.set(true, forKey: "USER_FIRST_LAUNCH")
        preferences.synchronize()
    }
    
    //MARK: - GUID
    static func getGuid() -> String {
        return preferences.object(forKey: "USER_GUID") as? String ?? ""
    }
    
    static func setGuid(guid: String?) {
        if guid == nil {
            clearGuid()
        } else {
            preferences.set(guid, forKey: "USER_GUID")
            preferences.synchronize()
        }
    }
    
    static func clearGuid() {
        preferences.set("", forKey: "USER_GUID")
        preferences.synchronize()
    }
    
    //MARK: - ACCESS TOKEN
    static func getAccessToken() -> String {
        return preferences.object(forKey: "USER_ACCESS_TOKEN") as? String ?? ""
    }
    
    static func setAccessToken(accessToken: String?) {
        if accessToken == nil {
            clearAccessToken()
        } else {
            preferences.set(accessToken, forKey: "USER_ACCESS_TOKEN")
            preferences.synchronize()
        }
    }
    
    static func clearAccessToken() {
        preferences.set("", forKey: "USER_ACCESS_TOKEN")
        preferences.synchronize()
    }
    
    
    //MARK: - REFRESH TOKEN
    static func getRefreshToken() -> String {
        return preferences.object(forKey: "USER_REFRESH_TOKEN") as? String ?? ""
    }
    
    static func setRefreshToken(refreshToken: String?) {
        if refreshToken == nil {
            clearRefreshToken()
        } else {
            preferences.set(refreshToken, forKey: "USER_REFRESH_TOKEN")
            preferences.synchronize()
        }
    }
    
    static func clearRefreshToken() {
        preferences.set("", forKey: "USER_REFRESH_TOKEN")
        preferences.synchronize()
    }
    
    //MARK: - TOKEN TYPE
    static func getTokenType() -> String {
        return preferences.object(forKey: "USER_TOKEN_TYPE") as? String ?? ""
    }
    
    static func setTokenType(tokenType: String?) {
        if tokenType == nil {
            clearTokenType()
        } else {
            preferences.set(tokenType, forKey: "USER_TOKEN_TYPE")
            preferences.synchronize()
        }
    }
    
    static func clearTokenType() {
        preferences.set("", forKey: "USER_TOKEN_TYPE")
        preferences.synchronize()
    }
    
    //MARK: - JTI
    static func getJti() -> String {
        return preferences.object(forKey: "USER_JTI") as? String ?? ""
    }
    
    static func setJti(jti: String?) {
        if jti == nil {
            clearJti()
        } else {
            preferences.set(jti, forKey: "USER_JTI")
            preferences.synchronize()
        }
    }
    
    static func clearJti() {
        preferences.set("", forKey: "USER_JTI")
        preferences.synchronize()
    }
    
    //MARK: - DOCUMENTOS
    static func documentosJson() -> JSONArray {
        return preferences.object(forKey: "PARAMETER_TIPO_DOCUMENTO") as? [[String:Any]] ?? [[:]]
    }
    
    static func setDocumentosJson(_ dict: JSONArray) {
        preferences.set(dict, forKey: "PARAMETER_TIPO_DOCUMENTO")
        preferences.synchronize()
    }
    
    static func clearDocumentos() {
        preferences.set("", forKey: "PARAMETER_TIPO_DOCUMENTO")
        preferences.synchronize()
    }
    
    //MARK: - JTI
    static func getReloadData() -> Bool {
        return preferences.object(forKey: "HISTORY_RELOAD_DATA") as? Bool ?? false
    }
    
    static func setReloadData(reloadData: Bool?) {
        if reloadData == nil {
            clearReloadData()
        } else {
            preferences.set(reloadData, forKey: "HISTORY_RELOAD_DATA")
            preferences.synchronize()
        }
    }
    
    static func clearReloadData() {
        preferences.set("", forKey: "HISTORY_RELOAD_DATA")
        preferences.synchronize()
    }
    
    //MARK: - REFRESH TOKEN
    static func getTipoDocDesc() -> String {
        return preferences.object(forKey: "USER_TIPO_DOC_DESC") as? String ?? ""
    }
    
    static func setTipoDocDesc(tipoDocDesc: String?) {
        if tipoDocDesc == nil {
            clearTipoDocDesc()
        } else {
            preferences.set(tipoDocDesc, forKey: "USER_TIPO_DOC_DESC")
            preferences.synchronize()
        }
    }
    
    static func clearTipoDocDesc() {
        preferences.set("", forKey: "USER_TIPO_DOC_DESC")
        preferences.synchronize()
    }
    
    //MARK: - USER
    
    
    
}
