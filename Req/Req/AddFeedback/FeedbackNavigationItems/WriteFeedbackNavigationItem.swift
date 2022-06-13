//
//  WriteFeedbackNavigationItem.swift
//  Req
//
//  Created by 이재웅 on 2022/06/13.
//

import SwiftUI

struct WriteFeedbackNavigationItem: View {
    @Binding var changeFeedbackBottomView: FeedbackType
    @Binding var title: String
    @Binding var description: String
    @Binding var pins: [Pin]
    @Binding var idCount: Int
    @Binding var currentPin: Pin
    
    private var isWritten: Bool {
        if title != "" && description != "" { return true }
        else { return false }
    }
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 16.0)
            
            Button {
                if changeFeedbackBottomView == .writeFeedback {
                    cancelWrtieFeedback()
                } else if changeFeedbackBottomView == .afterAdjustFeedback {
                    cancelAdjustFeedback()
                }
                //TODO: touchPin 상태에서 취소버튼을누를 시 작동하도록 구현
            } label: {
                Text("취소")
                    .font(.system(size: 18.0, weight: .semibold))
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            switch changeFeedbackBottomView {
            case .writeFeedback, .afterAdjustFeedback:
                Button {
                    if changeFeedbackBottomView == .writeFeedback {
                        completeWrtingFeedback()
                    } else if changeFeedbackBottomView == .afterAdjustFeedback {
                        completeAdjustFeedback()
                    }
                    
                } label: {
                    Text("확인")
                        .font(.system(size: 18.0, weight: .semibold))
                        .foregroundColor(isWritten ? .black : .gray)
                }
                .disabled(!isWritten)
            default:
                EmptyView()
            }
            
            
            Spacer()
                .frame(width: 16.0)
            
        } // HStack
        .frame(width: 390.0, height: 51.0)
    }
}

extension WriteFeedbackNavigationItem {
    
    // 피드백 작성 취소버튼
    func cancelWrtieFeedback() {
        // 추가버튼 누른 직후 다시 취소할 경우 동작 안하도록 구현
        if idCount != 0 {
            // Pin에 부여한 id에 맞게 취소할 시 배열에서 삭제하기 위함
            let nowId = idCount - 1
            pins.remove(at: nowId)
            idCount = nowId
        }
        
        changeFeedbackBottomView = .addFeedback
    }
    
    // 피드백 작성 확인버튼
    func completeWrtingFeedback() {
        let nowId = idCount - 1
        pins[nowId].title = title
        pins[nowId].description = description
        
        title = ""
        description = ""
        
        changeFeedbackBottomView = .addFeedback
    }
    
    // 피드백 수정 취소버튼
    func cancelAdjustFeedback() {
        title = ""
        description = ""
        
        changeFeedbackBottomView = .beforeAdjustFeedback
    }
    
    // 피드백 수정 완료버튼
    func completeAdjustFeedback() {
        currentPin.title = title
        currentPin.description = description
        
        pins[currentPin.id] = currentPin
        
        title = ""
        description = ""
        
        changeFeedbackBottomView = .beforeAdjustFeedback
    }
}
