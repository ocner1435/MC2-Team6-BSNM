//
//  WriteFeedbackNavigationCancelButton.swift
//  Req
//
//  Created by 이재웅 on 2022/06/14.
//

import SwiftUI

struct WriteFeedbackNavigationCancelButton: View {
    @Binding var changeFeedbackBottomView: FeedbackType
    @Binding var title: String
    @Binding var description: String
    @Binding var pins: [Pin]
    @Binding var idCount: Int
    
    var body: some View {
        Button {
            switch changeFeedbackBottomView {
            case .touchPin, .writeFeedback:
                cancelWrtieFeedback()
            default:
                cancelAdjustFeedback()
            }
        } label: {
            Text("취소")
                .font(.system(size: 18.0, weight: .semibold))
                .foregroundColor(.black)
        }
    }
}

extension WriteFeedbackNavigationCancelButton {
    
    // 피드백 작성 취소버튼
    func cancelWrtieFeedback() {
        // 추가버튼 누른 직후 다시 취소할 경우 동작 안하도록 구현
        if changeFeedbackBottomView == .writeFeedback {
            // Pin에 부여한 id에 맞게 취소할 시 배열에서 삭제하기 위함
            let nowId = idCount - 1
            pins.remove(at: nowId)
            idCount = nowId
            
            title = ""
            description = ""
        }
        
        changeFeedbackBottomView = .addFeedback
    }
    
    // 피드백 수정 취소버튼
    func cancelAdjustFeedback() {
        title = ""
        description = ""
        
        changeFeedbackBottomView = .beforeAdjustFeedback
    }
}
