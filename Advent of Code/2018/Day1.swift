//
//  Day1.swift
//  Advent of Code
//
//  Created by Ryan Arana on 12/1/18.
//  Copyright © 2018 aranasaurus.com. All rights reserved.
//

import Foundation

struct AdventOfCode2018 {
    struct Day1 {
        static func part1(inputs: String = rawInput) -> Int {
            var i = 0
            var cache = Set<Int>()
            cache.insert(0)
            for input in inputs.split(separator: "\n") {
                i = compute(input, on: i, withCache: &cache)
            }
            return i
        }

        static func part2(inputs: String = rawInput) -> Int {
            var i = 0
            var cache = Set<Int>()
            cache.insert(0)
            while true {
                for input in inputs.split(separator: "\n") {
                    let previousCacheCount = cache.count
                    i = compute(input, on: i, withCache: &cache)
                    if previousCacheCount == cache.count {
                        return i
                    }
                }
            }
            return i
        }

        static func compute<T: StringProtocol>(_ str: T, on startValue: Int, withCache values: inout Set<Int>) -> Int {
            guard let opp = str.first, let num = Int(str[str.index(after: str.startIndex)...]) else { return startValue }

            var i = startValue

            switch opp {
            case "+": i += num
            case "-": i -= num
            default: return i
            }

            values.insert(i)
            return i
        }
    }
}

extension AdventOfCode2018.Day1 {
    static let rawInput: String = """
+19
-15
+6
+6
+17
-18
+7
+14
+12
+13
-16
+13
+8
+6
-12
-3
-5
+12
-15
+2
-16
-11
+19
+3
-15
+19
-8
+14
-1
-16
-14
+15
+19
+10
-22
-17
+8
-6
-15
-9
-6
-17
-18
-1
+17
+18
-17
+5
-12
+17
-8
+11
-19
-16
+12
+8
-12
+6
-15
+19
+1
-10
-17
-16
-17
-19
-13
+19
-11
-4
-10
+5
+6
+5
-13
-7
+13
-21
-18
-16
-5
-11
-12
-15
-19
+8
-13
-14
-8
+4
+20
+19
+19
+18
-16
+4
-17
-19
-3
+13
+14
-15
-16
+8
+11
+1
+22
+15
+16
+9
+17
+13
+10
-14
-4
-11
+18
-2
+8
+15
+17
-3
-5
+16
-2
+3
+4
-9
-14
-9
-16
+20
-7
-2
+18
-3
-7
+4
+19
+13
+14
-11
-18
-2
-8
+1
+16
+17
+9
-14
+7
+2
+9
-12
+5
-10
+16
-31
-21
+13
-1
+16
-2
+21
-8
+23
-4
+3
+3
+4
+13
+6
-11
+18
+2
-11
-1
-4
+2
+16
+20
-3
+8
-6
+13
-4
-16
-15
+12
+9
-4
-12
-21
+23
-10
+41
+10
+27
-3
+16
+3
-4
-2
+16
-9
+8
-5
-18
+2
+7
-19
+7
-15
+11
+19
+5
-1
-9
+15
+4
+10
-4
+18
+5
+19
-8
-13
-13
+2
+3
-18
+10
+10
-14
+13
-11
+16
+18
-1
+18
-1
+3
-12
+17
-12
+2
-4
-14
+2
+11
+18
+15
-7
+15
+18
+4
+1
-12
-7
-17
-5
+1
+3
+4
-19
+5
+5
-11
-5
+14
+17
+11
+14
-13
+8
-15
+13
+13
+17
+13
+16
-1
-14
+19
+16
-19
-14
+19
+16
+10
-3
+16
+14
+10
+16
+5
+12
-1
+3
-5
+7
+7
+18
+10
-18
+16
-3
-7
-19
+10
-3
-9
-11
+12
-9
-6
-6
-2
-5
-14
-11
-10
+3
-6
-16
-2
-11
+7
-14
-16
+6
+1
+18
-11
+3
+18
+21
+11
-1
+17
+4
+18
-4
+13
-18
-3
+19
-20
-11
-10
-14
-11
-2
-16
-16
-17
+3
+6
-5
+3
-13
-18
+1
+14
-12
+7
-2
+18
-7
-8
-4
-13
+2
+6
-11
+8
-15
+13
+23
-7
+17
+10
-23
+15
-18
+2
-4
-14
-18
-20
+4
-8
+14
-3
-9
-9
+4
+24
-9
-5
+19
+3
+20
-12
+11
+17
+29
-2
-14
+22
+6
-9
+8
+16
+24
+16
-11
-2
-2
-3
+14
+5
+42
-3
-24
+23
-7
+1
+14
-11
+13
-4
-3
+16
-3
+28
+8
+11
+16
+5
+2
+16
+9
-19
-9
-7
-29
-8
-27
-5
+51
+29
+44
+11
+13
+2
+54
+16
-2
-19
+7
+7
+11
-21
-14
+50
+19
+4
-9
-4
+19
+5
-13
-12
-8
+4
-22
-12
+28
+12
-18
-25
+18
-27
+13
+4
+32
+20
+8
+14
-12
+1
+5
+11
-15
-16
+18
+1
-6
+14
-19
+9
-23
-34
+78
+15
-17
+19
+14
+16
+14
-18
+3
-20
+24
+17
+11
-16
+78
+10
-29
+17
+124
-17
+146
-55
-17
+222
-15
+19
+25
-24
-15
-4
+21
+73857
+6
+15
+3
+16
-14
+18
+5
-6
-5
+8
-17
-15
+18
-9
+10
-8
-10
-16
+9
-1
-2
-15
-11
-13
-16
-5
+15
+4
+14
-5
+8
+7
-18
-3
+2
+8
+5
+5
+14
+18
-17
+16
-5
-18
+8
+7
+20
+4
+11
+6
-4
-8
-2
-1
+14
+4
+5
-6
-5
+16
-3
+19
+13
-12
+5
+1
+18
+2
+5
-13
-1
-1
+4
+1
+4
+17
+14
+3
-14
-13
-18
-3
+11
+18
+10
-15
+4
+15
+16
+8
-14
+5
+18
+12
+18
-9
-6
+12
-1
+7
+8
+12
+15
+11
-16
+15
+18
-6
-2
-3
+10
+10
+13
-12
+9
-3
-13
+20
-12
+19
+6
+3
+18
-15
+13
+5
-17
+15
-8
+17
-18
-11
+15
+12
-9
-16
+11
+10
-13
-3
-8
-12
-18
-17
-20
-2
-10
+15
-7
+9
+4
+14
+11
-2
-11
+5
-8
-19
-4
-2
-9
-15
+8
-5
+7
+13
-11
+8
-11
-20
-10
+11
-21
+16
-2
-17
-15
+9
+16
+8
+3
+6
-15
+21
+15
+7
-17
+35
+9
+14
+19
-3
+4
-8
+11
+17
+13
+14
+4
-9
+1
-17
-1
-13
-19
-19
+13
+24
-17
-17
+20
-12
-20
-2
-4
-19
-5
+20
+1
+8
-4
-17
+10
+23
+37
+10
+8
+23
+3
+14
-7
+19
-17
-18
+8
+6
+20
-3
+2
-6
-17
+9
-8
+17
-7
+11
-8
-9
+15
-4
-9
+8
+18
+12
-9
+13
-15
+17
+16
-12
-2
-14
-4
+19
-16
+3
+19
+19
-17
+9
+4
+14
-15
-18
-4
-8
-14
-18
+20
-13
-17
-19
+4
+5
+11
-9
-14
+15
+31
+11
+11
-20
+1
+14
+4
+11
+3
+17
-14
+9
+13
+16
+6
+5
-6
+13
+3
+4
+13
+10
+14
+4
-1
-16
-14
-6
+2
+8
-5
+3
+17
-4
-5
+14
-12
+5
+1
+14
+20
-5
-5
+18
-19
+9
-11
+1
-12
+17
+9
-6
+5
+25
-13
+7
-4
+8
-3
-24
-40
-16
-5
+10
-6
-18
-14
+17
+10
+18
+16
-14
-18
-11
-15
-13
+11
+6
+8
-18
+5
-8
+4
-13
+19
+15
+12
+6
-16
+4
-5
-7
-7
+6
-3
-18
+17
-29
+7
+7
+3
-13
+1
+15
-12
-14
+22
-7
-17
-3
-19
-15
+9
+19
-9
+19
-6
+14
-5
-6
-39
+30
-15
-51
-44
+1
-22
+26
-60
-25
-10
+19
-22
+11
-9
-29
+5
+9
+7
-14
-17
+4
+3
+4
+3
-19
-8
-18
+13
-18
+3
-8
+9
-13
-5
-28
-9
+5
-9
-3
-4
+1
-3
+19
-4
-7
+2
+2
+11
+17
+14
-18
-22
-16
-16
-1
-10
-4
+1
-17
+24
+17
+24
+1
-6
-15
+28
+7
-6
-18
-12
+33
+34
+3
+11
+5
+15
+2
+4
-14
-10
+19
+8
+20
-74755
"""
}
