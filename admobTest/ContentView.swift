//
//  ContentView.swift
//  admobTest
//
//  Created by 박만호 on 2020/05/28.
//  Copyright © 2020 apen. All rights reserved.
//

import SwiftUI
import GoogleMobileAds


final class Interstitial:NSObject, GADInterstitialDelegate{
    var interstitialID = "ca-app-pub-3940256099942544/4411468910"
    var interstitial:GADInterstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
    
    override init() {
        super.init()
        LoadInterstitial()
    }
    
    func LoadInterstitial(){
        let req = GADRequest()
        self.interstitial.load(req)
        self.interstitial.delegate = self
    }
    
    func showAd(){
        if self.interstitial.isReady{
           let root = UIApplication.shared.windows.first?.rootViewController
           self.interstitial.present(fromRootViewController: root!)
        }
       else{
           print("Not Ready")
       }
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        self.interstitial = GADInterstitial(adUnitID: interstitialID)
        LoadInterstitial()
    }
}

struct ContentView:View{
    var interstitial:Interstitial
    
    init(){
        self.interstitial = Interstitial()
    }
    
    var body : some View{
      Button(action: {self.interstitial.showAd()}){
        Text("My Button")
      }
    }
}
