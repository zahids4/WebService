//
//  File.swift
//  
//
//  Created by Saim Zahid on 2022-01-17.
//

public struct StoryList: Decodable {
    public let stories: [Story]
}

public struct Story: Decodable, Identifiable {
    public let id: String
    public let title: String
    public let cover: String
}
