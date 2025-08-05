module SqueakyClean

open System

let transform (c: char) : string =
    match c with
    | '-' -> "_"
    | ' ' -> ""
    | c when Char.IsUpper c -> "-" + string (Char.ToLower c)
    | c when Char.IsNumber c -> ""
    | c when c >= 'α' && c <= 'ω' -> "?"
    | _ -> string c


let clean (identifier: string) : string = identifier |> String.collect transform
