var nums = [10, 30, 20, 15, 8, 13, 25, 90, 45]

// MARK: Use .sorted()
nums.sorted()

// MARK: Use .sorted(by)
nums.sorted { a, b in
    a > b
}

// MARK: Use shorthand closure
let sorted_nums = nums.sorted { $0 > $1 }
sorted_nums

// MARK: Use special function in .sorted(by)
nums.sorted(by: >)
nums.sorted(by: <)

//public func >(_ lhs: Int, _ rhs: Int) -> Bool { }

// MARK: Use .sorted(by) to achieve more complicated sort

// Separate even and odd number
nums.sorted { a, _ in
    a % 2 == 0
}


// Separate even and odd number by increasing order
var evenAndOddIncreasing = nums.sorted { a, b in
    if a % 2 == 0 && b % 2 == 0 {
        return a < b
    } else if a % 2 != 0 && b % 2 != 0 {
        return a < b
    } else {
        return a % 2 == 0
    }
}
evenAndOddIncreasing

// MARK: use .filter()
// Take elements that even number
nums.filter { value in
    value % 2 == 0
}

// Take elements that larger than 20
nums.filter { value in
    value > 20
}

// Use key path in .filter
struct DataEntry {
    var index: Int
    var flag: Bool
}

let dataEntries: [DataEntry] = {
    var array: [DataEntry] = []
    for i in 0...10 {
        if i < 5 {
            array.append(DataEntry(index: i, flag: false))
        } else {
            array.append(DataEntry(index: i, flag: true))
        }
    }
    return array
}()

dataEntries.filter(\.flag)

// MARK: Use .reduce()

// FIRST: inout keyword

var value1 = 0
var value2 = 10

// Want to get value1 = 10, value2 = 0, by calling swapValues(value1, value2)

func swapValues(_ value1: inout Int, _ value2: inout Int) {
    let temp = value1
    value1 = value2
    value2 = temp
}

swapValues(&value1, &value2)

value1
value2


// Try to get the sum of all elements
nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

var count = 0
for num in nums {
    count += num
}
count

// reduce(into:)
nums.reduce(into: 0) { partialResult, nextElement in
    partialResult += nextElement
}

// reduce(:,:)
nums.reduce(0) { partialResult, nextElement in
    return partialResult + nextElement
}

nums

// Define a sum() function on collection
// For example, nums.sum()

extension Collection where Element: AdditiveArithmetic {
    func sum() -> Element {
        self.reduce(Element.zero, +)
    }
}

nums.sum()

//dataEntries
// More advanced usage.
dataEntries.reduce(0) { partialResult, nextElement in
    partialResult + (nextElement.flag ? nextElement.index : 0)
}

// MARK: map

// Used to convert an array of data to an array of data of other types or values
nums
nums.map { value in
    value * 10
}

dataEntries.map { dataEntry in
    dataEntry.index
}


// Use key path again
dataEntries.map(\.index)

dataEntries.map { (dataEntry: DataEntry) -> Int? in
    if dataEntry.flag {
        return dataEntry.index
    } else {
        return nil
    }
}


// What if we don't want to nil here?
// Use compactMap!

dataEntries.compactMap { (dataEntry: DataEntry) -> Int? in
    if dataEntry.flag {
        return dataEntry.index
    } else {
        return nil
    }
}




// What about flatMap?

let nestedNums = [
    [1, 2, 3, 4, 5],
    [6, 7, 8],
    [9]
]

// What if we want to add 1 to each element but return an 1d array?
nestedNums.flatMap { nums in
    nums.map({ $0 + 1})
}


// Chaining higher-order functions
nums = [13, 15, 6, 89, 20, 10, 54]

let chained_vals = nums
.map {
    $0 * 3
}
.filter {
    $0 <= 50
}
.sorted(by: <)
.compactMap { value in
    value % 2 == 0 ? DataEntry(index: value, flag: true) : nil
}

//chained_vals

// Try to implement filter!

func myFilter(on data: [Int], _ isIncluded: (Int) -> Bool) -> [Int] {
    var results = [Int]()
    for element in data {
        if isIncluded(element) {
            results.append(element)
        }
    }
    return results
}

nums
myFilter(on: nums) { value in
    value % 2 == 0
}


// Make filter function works on an array of any Type instead of just an array of Int

func myFilter<Element>(on data: [Element], _ isIncluded: (Element) -> Bool) -> [Element] {
    var results = [Element]()
    for element in data {
        if isIncluded(element) {
            results.append(element)
        }
    }
    return results
}

let doubles = [1.1, 2.2]
myFilter(on: doubles) { element in
    element < 1.3
}


let programming_languages = [
    "C++",
    "Swift",
    "C#",
    "Rust",
    "JavaScript",
    "TypeScript",
    "Haskell",
    "C",
    "Java"
]

// Find all languages that start with "C"
myFilter(on: programming_languages) { myStr in
    myStr.hasPrefix("C")
}

// How to make it more native so we can just say programming_languages.myFilter()
extension Array {
    func myFilter(_ isIncluded: (Element) -> Bool) -> [Element] {
        var results: [Element] = []
        for element in self {
            if isIncluded(element) {
                results.append(element)
            }
        }
        return results
    }
}

let extened_vals = programming_languages.myFilter { $0.hasPrefix("C") }
extened_vals


// Recall the sum() we defined before.
// Use sum on any collection. Don't have to be an array integer
extension Collection {
    func sum<T: AdditiveArithmetic>(
        _ transform: (Element) throws -> T
    ) rethrows -> T {
        return try self.map(transform).sum()
    }
}

dataEntries

dataEntries.sum { dataEntry in
    dataEntry.index
}

