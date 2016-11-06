//
//  Stack.swift
//  Stack
//
//  Created by Christian Otkjær on 06/11/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import Foundation

/// Classic Stack

public struct Stack<Element>
{
    private var elements: [Element]
    
    public init()
    {
        elements = []
    }
    
    public init(literalElements: Element...)
    {
        elements = literalElements
    }
    
    public init<S : Sequence>(_ s: S) where S.Iterator.Element == Element
    {
        elements = Array(s)
    }
    
    public init(repeating repeatedValue: Element, count: Int)
    {
        elements = Array(repeating: repeatedValue, count: count)
    }
    
    public var count: Int { return elements.count }
    
    public var isEmpty: Bool { return elements.isEmpty }
    
    @discardableResult
    public mutating func push(_ element: Element?) -> Element?
    {
        guard let element = element else { return nil }
        elements.append(element)
        return element
    }
    
    @discardableResult
    public mutating func pop() -> Element? { return isEmpty ? nil : elements.removeLast() }
    
    public mutating func peek() -> Element? { return elements.last }
}
