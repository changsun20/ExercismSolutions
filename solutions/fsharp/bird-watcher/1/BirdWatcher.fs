module BirdWatcher

let lastWeek: int [] = [| 0; 2; 5; 3; 7; 8; 4 |]

let yesterday (counts: int []) : int = counts.[counts.Length - 2]

let total (counts: int []) : int = Array.sum counts

let dayWithoutBirds (counts: int []) : bool = Array.contains 0 counts

let incrementTodaysCount (counts: int []) : int [] =
    let todaysCount = counts.[counts.Length - 1]
    let newCounts = Array.copy counts
    newCounts.[newCounts.Length - 1] <- todaysCount + 1
    newCounts

let unusualWeek (counts: int []) : bool =
    match counts with
    | [| _; 0; _; 0; _; 0; _ |] -> true
    | [| _; 10; _; 10; _; 10; _ |] -> true
    | [| 5; _; 5; _; 5; _; 5 |] -> true
    | _ -> false
