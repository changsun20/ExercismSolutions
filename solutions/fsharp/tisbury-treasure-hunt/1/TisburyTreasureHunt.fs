module TisburyTreasureHunt

let getCoordinate (line: string * string) : string = snd line


//convertCoordinate "2A"
// (2, 'A')
let convertCoordinate (coordinate: string) : int * char =
    int (string coordinate[0]), coordinate[1]

let compareRecords (azarasData: string * string) (ruisData: string * (int * char) * string) : bool =
    let azarasCoordinate = convertCoordinate (snd azarasData)
    let (_, ruisCoordinate, _) = ruisData
    azarasCoordinate = ruisCoordinate

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
