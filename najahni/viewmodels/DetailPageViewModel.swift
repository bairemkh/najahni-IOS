//
//  DetailPageViewModel.swift
//  najahni
//
//  Created by bairem mohamed on 22/11/2022.
//

import Foundation

class DetailPageViewModel : ObservableObject
{
    @Published var title = "Title"
    @Published var Description = ""
    @Published var free = "free"
    @Published var isLiked = false
}
