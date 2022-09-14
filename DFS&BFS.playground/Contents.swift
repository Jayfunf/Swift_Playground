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

let adjacencyList:[Int: [Int]] = [ // Adjacency List
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

class DFS {
    var recul_visited = Array.init(repeating: false, count: adjacencyMatrix.count)
    var recul_visited2 = Array.init(repeating: false, count: adjacencyMatrix.count)
    var normal_visited = Array.init(repeating: 0, count: adjacencyList.count)
    var normal_visited2 = Array.init(repeating: 0, count: adjacencyList.count)
    
    func reculsiveMatrix(_ startNode: Int) { // Complete
        recul_visited[startNode] = true
        
        print(startNode, terminator: " ")
        
        for i in adjacencyMatrix[startNode] {
            if !recul_visited[i] {
                reculsiveMatrix(i)
            }
        }
    }
    
    func reculsiveList(_ startNode: Int) { // Complete
        recul_visited2[startNode] = true
        
        print(startNode, terminator: " ")
        
        for i in adjacencyList[startNode]! {
            if !recul_visited2[i] {
                reculsiveList(i)
            }
        }
    }
    
    func normalMatrix() {
        
    }
    
    func normalList() {
        
    }
    
}

struct BFS {
    
}

var test = DFS()
test.reculsiveMatrix(1)
print("\n")
test.reculsiveList(1)
