//
//  LocalizationManger.swift
//  Design
//
//  Created by kasper on 9/7/20.
//  Copyright © 2020 com.Mahmoud.Abdul-Wahab.NewDesign25. All rights reserved.
//

import UIKit

protocol LocalizationDelegate : class {
    func resetApp()
}

class LocalizationManger : NSObject{
    
    enum LanguageDirection {
        case leftToRight
        case rightToLeft
    }
    
    enum Language : String {
        case English = "en"
        case Arabic  = "ar"
    }
    
    
    static let shared  = LocalizationManger()
    
    private var bundle : Bundle? = nil // i will use it to reload the current bundel insted of closing the reOpinig the app to set the new langauge  [ switching the language without restarting the app]
    private var languageKey = "UKPrefLang"// to save lang in userdefalts
    
    weak var delegate : LocalizationDelegate?
    
    ///**** some helper Functions
    
    // get he currently selected langauge form the userDefault
    
    func getLanguage()-> Language?{
        if let languageCode = UserDefaults.standard.string(forKey: languageKey) , let language = Language(rawValue: languageCode){
            return language
        }
        return nil
    }
    
    // check if language is available [ if the user onpened the app on the first time i will set the language as the device lang but i support english and arabic only here so i must check i the device lang supported in my app or not if not  i will set any default languse like english
    
    
    private func islanguageAvailable(_ code : String)-> Language?{
        var finalCode = ""
        if code.contains("ar"){
            finalCode = "ar"
        }else if code.contains("en"){
            finalCode = "en"
        }
        return Language(rawValue: finalCode)
    }
    
    
    /// check the language direction
    private func getlanguageDirection() -> LanguageDirection{
        if  let language = getLanguage() {
            switch language {
                
            case .English:
                return  .leftToRight
            case .Arabic:
                return  .rightToLeft
            }
        }
        return .leftToRight
    }
    
    
    // this function responsable for translation
    ///get localized String for the given code  from the active  Bundle
    
    func localizedString(for key : String , value comment : String) -> String{
        var localized  = ""
        if let bundel = bundle {
     
            localized =  bundel.localizedString(forKey: key, value: comment, table: nil)
        }
        return localized
    }
    
 
    
    /// *** **  setting langauge for localization  -->> to get he language in the getLanguageFunction()
    func setlanguage(langauge : Language){
        UserDefaults.standard.set(langauge.rawValue , forKey: languageKey)
        //set bundel path
        // get language translation file
        if let path = Bundle.main.path(forResource: langauge.rawValue, ofType: "lproj") {// lproj --> inside the project files
        bundle = Bundle(path: path)
        }else{
            // localization file for the language not found ----
            //fallback
            resetLocalization()
        }
        
        UserDefaults.standard.synchronize()
        resetApp()
    }
    
    
    // reset bundle
    func resetLocalization(){
        bundle = Bundle.main
    }
    
    // reset app for the new language
    func resetApp(){
        let dir  = getlanguageDirection()
        var semantic:UISemanticContentAttribute!
        switch dir{
            
        case .leftToRight:
            semantic = .forceLeftToRight
        case .rightToLeft:
            semantic = .forceRightToLeft
        }
        UITabBar.appearance().semanticContentAttribute = semantic
        UIView.appearance().semanticContentAttribute   = semantic
        UINavigationBar.appearance().semanticContentAttribute = semantic
        delegate?.resetApp()
    }
    
    // configure  startup language
    
    func setAppInintialLanguage() {
        //check if user chooed language before mean opened this app before
        if let selectedLanguage = getLanguage(){
            setlanguage(langauge: selectedLanguage)
        }else {
            // no langauge was selected
            // i will get default device langauge
            let languageCode = Locale.preferredLanguages.first
            if let code = languageCode , let langauge  = islanguageAvailable(code){
                // check is the default device language supported by me or not
                // here it's supported
                   setlanguage(langauge: langauge)
            }else{
                // it's not supported  so use default fall back
                setlanguage(langauge: .English)
            }
        }
        resetApp()
    }
}


extension String {
    var localized : String {
        return LocalizationManger.shared.localizedString(for: self, value: "")
    }
}
