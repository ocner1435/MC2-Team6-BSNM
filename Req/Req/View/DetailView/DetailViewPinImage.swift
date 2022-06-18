//
//  PinImage.swift
//  Req
//
//  Created by heojaenyeong on 2022/06/13.
//

import SwiftUI

struct DetailViewPinImage: View {
    let pinX : CGFloat
    let pinY : CGFloat
    let pinWidth : CGFloat = 88
    let pinHeight : CGFloat = 76
    var selected : Bool
    @State var newPin : Bool = true
    //createPinLottie : 핀 생성될때 로티
    //selectePinLottie : 핀 선택될때 로티
    //unselectePinLottie : 핀 선택해제 될때 로티
    //LottieView(filename: "selectPinLottie").frame(width: pinWidth, height: pinHeight).position(x: pinX, y: pinY)
    var body: some View {
        if selected {
            LottieView(filename: "selectPinLottie").frame(width: pinWidth, height: pinHeight).position(x: pinX, y: pinY).onAppear{
                newPin = false
            }
        } else {
            if newPin {
                LottieView(filename: "createPinLottie").frame(width: pinWidth, height: pinHeight).position(x: pinX, y: pinY)
            } else {
                LottieView(filename: "unSelectPinLottie").frame(width: pinWidth, height: pinHeight).position(x: pinX, y: pinY)
            }
        }
    }
}