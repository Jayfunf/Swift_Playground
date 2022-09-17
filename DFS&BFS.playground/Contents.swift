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

func reculsiveDFS(_ startNode: Int) { // Complete
    //recul_Matrix[startNode] = true // Matrix
    recul_List[startNode] = true // List
    
    //print(startNode, terminator: " ")
    
//    for i in adjacencyMatrix[startNode] { // Matrix
//        if !recul_Matrix[i] {
//            reculsiveDFS(i)
//        }
//    }
    
    for i in adjacencyList[startNode]! { // List
        print("List: ", adjacencyList[startNode]!)
        print("stratNode: ", startNode)
        print("i: ", i)
        print("recul_List[i]: ", !recul_List[i])
        if !recul_List[i] { // false이면 동작
            print("reculsive")
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


print("\n")
print(normalDFS(graph: adjacencyList, start: 1))
