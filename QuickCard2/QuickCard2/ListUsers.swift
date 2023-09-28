//
//  ListUsers.swift
//  QuickCard2
//
//  Created by Phanupong Permpimol on 28/9/2566 BE.
//

import SwiftUI

struct ListUsers: View {
    var body: some View {
        List {
            ForEach(User.users){ user in
                VStack {
                    Text("\(user.firstName) \(user.lastName)")
                        .font(.headline)
                    Text(user.title).font(.subheadline)
                }
            }
        }
    }
}

struct ListUsers_Previews: PreviewProvider {
    static var previews: some View {
        ListUsers()
    }
}
