//
//  User.swift
//  QuickCard2
//
//  Created by Phanupong Permpimol on 28/9/2566 BE.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String
    var title: String
    var email: String
    var companyUrl: String
    var address: String
    
    var stat: Stat
}
extension User{
    static var selectedUser = User.users[0]
    static let users = [
        User(firstName: "Jonathan",
            lastName: "Wong",
            title: "Senior Software Engineer",
            email: "mobileunder10@gmail.com",
            companyUrl: "mobileunder10.com",
            address: "12345 Highland Road",
            stat: Stat(requests: 50, completed: 60, satisfaction: 7, delayDays: 80, duration: 90)),
        User(firstName: "Nermal",
            lastName: "Vero",
            title: "Software Engineer",
            email: "nvero@yahoo.com",
            companyUrl: "vero123.com",
            address: "8822 Royal Road",
            stat: Stat(requests: 10, completed: 20, satisfaction: 3, delayDays: 40, duration: 50)),
        User(firstName: "Evelyn",
            lastName: "Smith",
            title: "Business Analyst",
            email: "esmith@outlook.com",
            companyUrl: "esmithvet.com",
            address: "5544 Camino Del Sur",
            stat: Stat(requests: 20, completed: 40, satisfaction: 6, delayDays: 80, duration: 100)),
        User(firstName: "Phoebe",
            lastName: "Lee",
            title: "Senior Business Analyst",
            email: "plee@gmail.com",
            companyUrl: "pleeproducts.com",
            address: "12345 Phaser Court",
            stat: Stat(requests: 30, completed: 60, satisfaction: 3, delayDays: 65, duration: 35)),
        User(firstName: "Aaron",
            lastName: "Huang",
            title: "Mechanical Engineer",
            email: "ahuang@gmail.com",
            companyUrl: "ahrobots.com",
            address: "789 Robot Road",
            stat: Stat(requests: 50, completed: 80, satisfaction: 9, delayDays: 10, duration: 10)),
        User(firstName: "Nathan",
            lastName: "Chan",
            title: "Product Engineer",
            email: "mobileunder10@gmail.com",
            companyUrl: "mobileunder10.com",
            address: "12345 Highland Road",
            stat: Stat(requests: 10, completed: 20, satisfaction: 3, delayDays: 40, duration: 50)),
        User(firstName: "Avery",
            lastName: "Johnson",
            title: "Senior Software Engineer",
            email: "averyjohnson@outlook.com",
            companyUrl: "avpharm.com",
            address: "12121 Pathos Lane",
            stat: Stat(requests: 30, completed: 60, satisfaction: 9, delayDays: 30, duration: 60)),
        User(firstName: "Harriet",
            lastName: "Brown",
            title: "Staff Software Engineer",
            email: "hbrown@yahoo.com",
            companyUrl: "catfurrr.com",
            address: "999 Cat Fur Lane",
            stat: Stat(requests: 20, completed: 40, satisfaction: 6, delayDays: 80, duration: 90)),
        User(firstName: "Lillian",
            lastName: "Martin",
            title: "Software Engineer",
            email: "lmartinez@gmail.com",
            companyUrl: "sharksneversleep.com",
            address: "123 Under the Sea Lane",
            stat: Stat(requests: 55, completed: 65, satisfaction: 7, delayDays: 85, duration: 95)),
        User(firstName: "Natalie",
            lastName: "Kim",
            title: "Software Manager",
            email: "nataliekim@yahoo.com",
            companyUrl: "natalite.com",
            address: "8888 Hidden Marker Road",
            stat: Stat(requests: 15, completed: 25, satisfaction: 3, delayDays: 45, duration: 55)),
    ]
}
