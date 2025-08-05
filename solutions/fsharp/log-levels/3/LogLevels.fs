module LogLevels

let message (logLine: string) : string =
    let colonIndex = logLine.IndexOf(": ")
    logLine.[colonIndex + 2 ..].Trim()

let logLevel (logLine: string) : string =
    let endIndex = logLine.IndexOf("]")
    logLine.[1 .. endIndex - 1].ToLower()

let reformat (logLine: string) : string =
    $"{message logLine} ({logLevel logLine})"
