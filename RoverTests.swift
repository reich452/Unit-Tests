//
//  RoverTests.swift
//  MarsRover
//
//  Created by Nick Reichard on 4/27/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.

// MARK: Note - normally would use these classes in different files 

import Foundation
import XCTest
@testable import MarsRover

class GridTests: XCTestCase {
    
    func testInitializerFailsWithNegativeHeight() {
        let grid = Grid(width: 1, height: -1)
        XCTAssertNil(grid)
    }
    
    func testInitializerFailsWithNegativeWidth() {
        let grid = Grid(width: -1, height: 1)
        XCTAssertNil(grid)
    }
    
}

class DirectionTests: XCTestCase {
    func testRejectsInvalidInput() {
        let direction = Direction(rawValue: "X")
        XCTAssertNil(direction)
    }
    
    func testHandlesValidDirections() {
        let north = Direction(rawValue: "N")
        let west = Direction(rawValue: "W")
        let south = Direction(rawValue: "S")
        let east = Direction(rawValue: "E")
        XCTAssertEqual(north, .north)
        XCTAssertEqual(west, .west)
        XCTAssertEqual(south, .south)
        XCTAssertEqual(east, .east)
    }
}

class CommandTests: XCTestCase {
    func testRejectsInvalidInput() {
        let direction = Direction(rawValue: "X")
        XCTAssertNil(direction)
    }
    
    func testHandlesValidDirections() {
        let turnLeft = Command(rawValue: "L")
        let turnRight = Command(rawValue: "R")
        let moveForward = Command(rawValue: "M")
        XCTAssertEqual(turnLeft, .turnLeft)
        XCTAssertEqual(turnRight, .turnRight)
        XCTAssertEqual(moveForward, .moveForward)
    }
    
    func testListWithEmptyString() {
        
    }
    
    func testListWithSingleItemString() {
        
    }
    
    func testListWithStringWithInvalidInput() {
        
    }
    
    func testListWithValidInput() {
        let input = "LLRM"
        let expected = [Command.turnLeft, .turnLeft, .turnRight, .moveForward]
        let commands = Command.list(from: input)
        XCTAssertEqual(expected, commands)
    }
    
}



class RoverTests: XCTestCase {
    
    func testCommandSet1() {
        guard let grid = Grid(width: 5, height: 5) else {
            XCTFail()
            return
        }
        let location = Location(x: 1, y: 2)
        let commands = "LMLMLMLMM"
        var rover = Rover(grid: grid, location: location, direction: .north)
        let expectedLocation = Location(x: 1, y: 3)
        let expectedDirection = Direction.north
        rover.process(commands: Command.list(from: commands))
        XCTAssertEqual(rover.location, expectedLocation)
        XCTAssertEqual(rover.direction, expectedDirection)
    }
    
}
