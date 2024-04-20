part of timer_details;

abstract class TimesheetEvent {}

class TimesheetInitEvent extends TimesheetEvent {}

class TimesheetUpdateEvent extends TimesheetEvent {}
