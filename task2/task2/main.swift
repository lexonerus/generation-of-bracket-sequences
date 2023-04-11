//
//  main.swift
//  task2
//
//  Created by Alexey Krzywicki on 11.04.2023.
//

import Foundation

struct Point {
    var x: Int
    var y: Int
}

func getDistance(_ a: Point, _ b: Point) -> Int {
    return abs(a.x - b.x) + abs(a.y - b.y)
}

let n = Int(readLine()!)!
var cities = [Point]()
for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let point = Point(x: line[0], y: line[1])
    cities.append(point)
}

let k = Int(readLine()!)!
let startAndEnd = readLine()!.split(separator: " ").map { Int($0)! }
let start = startAndEnd[0] - 1 // Нумерация городов начинается с 0
let end = startAndEnd[1] - 1

// Создаем граф и заполняем его весами ребер
var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
for i in 0..<n {
    for j in 0..<n {
        if i != j {
            let distance = getDistance(cities[i], cities[j])
            if distance <= k {
                graph[i][j] = distance
            } else {
                graph[i][j] = Int.max // Бесконечный вес для недоступных ребер
            }
        }
    }
}

// Алгоритм Флойда-Уоршелла для поиска кратчайших путей между всеми парами вершин
for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            if graph[i][k] < Int.max && graph[k][j] < Int.max && graph[i][j] > graph[i][k] + graph[k][j] {
                graph[i][j] = graph[i][k] + graph[k][j]
            }
        }
    }
}

// Вывод результата
if graph[start][end] == Int.max {
    print("-1")
} else {
    print(graph[start][end])
}
