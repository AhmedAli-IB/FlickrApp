//
//  BaseViewModel.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 10/01/2021.
//

import Foundation

// MARK: - Base View Model
//
class BaseViewModel {

    typealias Element = Any

    /// State
    var state = PublishSubject<State<Element>>()

}
