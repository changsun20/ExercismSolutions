module LogLevels

let message (logLine: string) : string =
    let colonIndex = logLine.IndexOf(": ")

    if colonIndex >= 0 then
        logLine.Substring(colonIndex + 2).Trim()
    else
        ""

let logLevel (logLine: string) : string =
    let startIndex = logLine.IndexOf("[") + 1
    let endIndex = logLine.IndexOf("]")

    if startIndex > 0 && endIndex > startIndex then
        logLine
            .Substring(startIndex, endIndex - startIndex)
            .ToLower()
    else
        ""

let reformat (logLine: string) : string =
    let msg = message logLine
    let level = logLevel logLine
    sprintf "%s (%s)" msg level
