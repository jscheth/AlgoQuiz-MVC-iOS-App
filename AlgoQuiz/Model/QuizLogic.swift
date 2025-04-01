//
//  QuizModel.swift
//  AlgoQuiz
//
//  Created by Jonathan Cheth on 3/30/25.
//

struct QuizLogic {
    var questionNumber = 0
    var score = 0
    
    let questions = [
        Question(question: "A stack follows the Last In, First Out (LIFO) principle.", answer: "True"),
        Question(question: "A queue is a linear data structure that follows the Last In, First Out (LIFO) principle.", answer: "False"),
        Question(question: "A binary search tree (BST) allows duplicate values.", answer: "False"),
        Question(question: "The time complexity of searching in a balanced binary search tree is O(log n).", answer: "True"),
        Question(question: "In a min-heap, the parent node is always smaller than or equal to its child nodes.", answer: "True"),
        Question(question: "Breadth-first search (BFS) is typically implemented using a stack.", answer: "False"),
        Question(question: "The worst-case time complexity of quicksort is O(n^2).", answer: "True"),
        Question(question: "A linked list uses contiguous memory locations like an array.", answer: "False"),
        Question(question: "A graph can be represented using an adjacency list or an adjacency matrix.", answer: "True"),
        Question(question: "Dijkstra’s algorithm finds the shortest path in a weighted graph with negative weights.", answer: "False")
    ]
    
    func getQuestion() -> String {
        return questions[questionNumber].question
    }
    
    func getProgress() -> Float {
        var progress = Float(questionNumber) / Float(questions.count)
        return progress
    }
    
    func getScore() -> Int {
        return score
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < questions.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == questions[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    
    
}
