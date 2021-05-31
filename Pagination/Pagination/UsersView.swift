//
//  UsersView.swift
//  Pagination
//
//  Created by Apoorv Garg on 17/04/21.
//

import SwiftUI

struct UsersView: View {
    
    //MARK:- PROPERTIES
    @StateObject var usersVM = UsersViewModel()
    
    //MARK:- BODY
    var body: some View {
        NavigationView{
            ScrollView {
                LazyVStack {
                    ForEach(usersVM.users, id: \.self) { user in
                        UserView(user: user)
                            .onAppear(){
                                usersVM.loadMoreContent(currentItem: user)
                            }
                    }
                }
            }
            .navigationTitle("Users")
            
        }
    }
}

//MARK:- PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
