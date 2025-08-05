module TisburyTreasureHunt

let getCoordinate (line: string * string) : string = snd line


//convertCoordinate "2A"
// (2, 'A')
let convertCoordinate (coordinate: string) : int * char =
    int (string coordinate[0]), coordinate[1]

let compareRecords (_, coord1: string) (_, coord2: int * char, _) : bool = convertCoordinate coord1 = coord2

let createRecord
    (azarasData: string * string)
    (ruisData: string * (int * char) * string)
    : (string * string * string * string) =
    match compareRecords azarasData ruisData with
    | true ->
        let (treasure, coordinate) = azarasData
        let (location, _, quadrant) = ruisData
        (coordinate, location, quadrant, treasure)
    | false -> ("", "", "", "")
