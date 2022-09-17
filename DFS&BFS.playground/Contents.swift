import UIKit

let adjacencyMatrix = [ // Adjacency Matrix
    [],
    [2,3],  //1
    [1,4,5],//2
    [1,6,7],//3
    [2],    //4
    [2],    //5
    [3],    //6
    [3,8],  //7
    [7]     //8
]

let adjacencyList:[Int: [Int]] = [ // Adjacency List structed by Dictionary
    0:[0],
    1:[2,3],
    2:[1,4,5],
    3:[1,6,7],
    4:[2],
    5:[2],
    6:[3],
    7:[3,8],
    8:[7]
]

var recul_Matrix = Array.init(repeating: false, count: adjacencyMatrix.count)
var recul_List = Array.init(repeating: false, count: adjacencyList.count)
func reculsiveDFS(_ startNode: Int) {
    print(startNode, terminator: " ")

//    recul_Matrix[startNode] = true // Matrix
//    for i in adjacencyMatrix[startNode] { // Matrix
//        if !recul_Matrix[i] {
//            reculsiveDFS(i)
//        }
//    }

    recul_List[startNode] = true // List
    for i in adjacencyList[startNode]! { // List
        if !recul_List[i] { // false이면 동작
            reculsiveDFS(i)
        }
    }
} // 1 2 4 5 3 6 7 8
reculsiveDFS(1)

func normalDFS(graph: [Int: [Int]], start: Int) -> [Int] {
    var visitedQueue: [Int] = []
    var needVisitStack: [Int] = [start]

    while !needVisitStack.isEmpty {
        let node: Int = needVisitStack.removeLast()
        if visitedQueue.contains(node) { continue }

        visitedQueue.append(node)
        needVisitStack += graph[node] ?? []
    }
    return visitedQueue
} // [1, 3, 7, 8, 6, 2, 5, 4]
print(normalDFS(graph: adjacencyList, start: 1))

func normalBFS(graph: [Int: [Int]], start: Int) -> [Int] {
    var visitedQueue: [Int] = []
    var needVisitQueue: [Int] = [start]
    
    while !needVisitQueue.isEmpty {
        let node: Int = needVisitQueue.removeFirst()
        if visitedQueue.contains(node) { continue }
        
        visitedQueue.append(node)
        needVisitQueue += graph[node] ?? []
    }
    return visitedQueue
} // [1, 2, 3, 4, 5, 6, 7, 8]
print(normalBFS(graph: adjacencyList, start: 1))
