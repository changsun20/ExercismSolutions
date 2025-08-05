module BookingUpForBeauty

// The following line is needed to use the DateTime type
open System

let schedule (appointmentDateDescription: string) : DateTime =
    DateTime.Parse(appointmentDateDescription)

let hasPassed (appointmentDate: DateTime) : bool = appointmentDate < DateTime.Now

let isAfternoonAppointment (appointmentDate: DateTime) : bool =
    let hour = appointmentDate.Hour
    hour >= 12 && hour < 18

let description (appointmentDate: DateTime) : string =
    sprintf "You have an appointment on %s." (appointmentDate.ToString())

let anniversaryDate () : DateTime = DateTime(DateTime.Now.Year, 9, 15)
