//
//  Category.swift
//  BookLibraryCollectionView
//
//  Created by Luiz on 4/8/21.
//

import Foundation

enum Category: String, Hashable, CaseIterable {

    case openSource = "Open Sourcer"
    case algorithmicArt = "Algorithmic Art"
    case business = "Business"
    case clientServer = "Client-Server"
    case softwareEngineering = "Software Engineering"
    case networking = "Networking"
    case computerGraphics = "Computer Graphics"
    case perl = "Perl"
    case internet = "Internet"
    case java = "Java"
    case Theory = "Theory"
    case xml = "XML"
    case softwareDevelopment = "Software Development"
    case microsoft = "Microsoft"
    case microsoftNet = "Microsoft .NET"
    case mobileTechnology = "Mobile Technology"
    case objectOrientedProgramming = "Object-Oriented Programming"
    case mobile = "Mobile"
    case php = "PHP"
    case other = "Other"


    init(){self.init() }
}
