//
//  Rover.swift
//  MarsRover
//
//  Created by Nick Reichard on 4/27/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation

import Foundation

struct Grid {
    var width: Int
    var height: Int
    
    init?(width: Int, height: Int) {
        guard width > 1, height > 1 else {
            return nil
        }
        self.width = width
        self.height = height
    }
}

struct Location: Equatable {
    var x: Int
    var y: Int
}

func ==(lhs: Location, rhs: Location) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}

enum Direction: String {
    case north = "N"
    case west = "W"
    case south = "S"
    case east = "E"
}

enum Command: String {
    case turnLeft = "L"
    case turnRight = "R"
    case moveForward = "M"
    
    static func list(from string: String) -> [Command] {
        return string.characters.flatMap { character in
            Command(rawValue: String(character))
        }
    }
}

struct Rover {
    var grid: Grid
    var location: Location
    var direction: Direction
    
    mutating func turnLeft() {
        switch direction {
        case .north:
            direction = .west
        case .west:
            direction = .south
        case .south:
            direction = .east
        case .east:
            direction = .north
        }
    }
    
    mutating func turnRight() {
        switch direction {
        case .north:
            direction = .east
        case .west:
            direction = .north
        case .south:
            direction = .west
        case .east:
            direction = .south
        }
    }
    
    mutating func moveForward() {
        switch direction {
        case .north:
            location.y += 1
        case .west:
            location.x -= 1
        case .south:
            location.y -= 1
        case .east:
            location.x += 1
        }
    }
    
    mutating func process(command: Command) {
        switch command {
        case .turnLeft: turnLeft()
        case .turnRight: turnRight()
        case .moveForward: moveForward()
        }
    }
    
    mutating func process(commands: [Command]) {
        commands.forEach { process(command: $0) }
    }
}
