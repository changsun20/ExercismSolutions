module LogLevels

let message (logLine: string) : string =
    let colonIndex = logLine.IndexOf(": ")
    logLine.Substring(colonIndex + 2).Trim()

let logLevel (logLine: string) : string =
    let startIndex = logLine.IndexOf("[") + 1
    let endIndex = logLine.IndexOf("]")

    logLine
        .Substring(startIndex, endIndex - startIndex)
        .ToLower()

let reformat (logLine: string) : string =
    let msg = message logLine
    let level = logLevel logLine
    sprintf "%s (%s)" msg level
