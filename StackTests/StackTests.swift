//
//  StackTests.swift
//  StackTests
//
//  Created by Christian Otkjær on 06/11/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import XCTest
@testable import Stack

class StackTests: XCTestCase
{
    func test_init()
    {
        let stack = Stack<String>()
        
        XCTAssertEqual(stack.count, 0)
    }
    
    func test_init_literal()
    {
        var stack = Stack(literalElements: "a", "b", "c")
        
        XCTAssertEqual(stack.count, 3)
        XCTAssertEqual(stack.pop(), "c")
    }
    
    func test_init_sequence()
    {
        var stack = Stack(["a", "b", "c"])
        
        XCTAssertEqual(stack.count, 3)
        XCTAssertEqual(stack.pop(), "c")
    }
 
    func test_init_repeating()
    {
        var stack = Stack(repeating: ["a", "b", "c"], count: 5)
        
        XCTAssertEqual(stack.count, 5)
        XCTAssertEqual(stack.pop(), ["a", "b", "c"])
    }
    
    func test_push()
    {
        var stack = Stack<Int>()
        
        XCTAssertEqual(stack.count, 0)
        
        stack.push(3)

        XCTAssertEqual(stack.count, 1)
        
        XCTAssertEqual(stack.push(4), 4)

        XCTAssertEqual(stack.peek(), 3)
        
        XCTAssertNil(stack.push(nil))
        
        XCTAssertEqual(stack.count, 1)
        
        XCTAssertEqual(stack.peek(), 3)
    }

    func test_pop()
    {
        var stack = Stack<Int>()
        
        XCTAssertEqual(stack.count, 0)
        
        XCTAssertNil(stack.pop())
        
        stack.push(3)
        
        XCTAssertEqual(stack.count, 1)
        
        XCTAssertEqual(stack.pop(), 3)
    }

    func test_peek()
    {
        var stack = Stack<Int>()
        
        XCTAssertEqual(stack.count, 0)
        
        XCTAssertNil(stack.peek())
        
        stack.push(3)
        
        XCTAssertEqual(stack.count, 1)
        
        XCTAssertEqual(stack.peek(), 3)
        XCTAssertEqual(stack.peek(), 3)
        XCTAssertEqual(stack.peek(), 3)
        
        stack.pop()
        
        XCTAssertNil(stack.peek())
    }

}
