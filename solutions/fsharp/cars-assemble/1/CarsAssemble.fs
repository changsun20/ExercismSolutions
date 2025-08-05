module CarsAssemble

let successRate (speed: int) : float =
    match speed with
    | 0 -> 0.0
    | s when s <= 4 -> 1.0
    | s when s <= 8 -> 0.9
    | s when s = 9 -> 0.8
    | _ -> 0.77

let productionRatePerHour (speed: int) : float = float speed * 221.0 * successRate speed

let workingItemsPerMinute (speed: int) : int =
    productionRatePerHour speed / 60.0 |> int
