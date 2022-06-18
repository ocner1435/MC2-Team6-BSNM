//
//  PostView.swift
//  Req
//
//  Created by 조성산 on 2022/06/16.
//

import SwiftUI

struct PostView: View {
    //날짜 모델
    let releaseDate = Date()
    
    static let kDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 M월"
        return formatter
    }()
    @Binding var searchText: String

    @Binding var loadSearch: Bool


    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black)
                .frame(width: 358, height: 1)
            Text("\(releaseDate, formatter: Self.kDateFormat)")
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 200))
                .foregroundColor(.black)
            
            PostGridView(searchText: $searchText, data: testDataSet)
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                loadSearch = true
            }
        })
    }
}

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView(searchText: $searchText, loadSearch: $loadSearch)
//    }
//}