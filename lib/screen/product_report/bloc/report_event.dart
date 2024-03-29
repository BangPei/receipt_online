part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  List<Object> get props => [];
}

class OnGetReportDetail extends ReportEvent {
  final ReportDetail detail;
  const OnGetReportDetail(this.detail);
}

class OnPushReportDetail extends ReportEvent {
  final List<ReportDetail> details;
  const OnPushReportDetail(this.details);
}

class OnMapReportDetail extends ReportEvent {
  final ReportDetail detail;
  const OnMapReportDetail(this.detail);
}

class OnMapReport extends ReportEvent {
  final String periode;
  const OnMapReport(this.periode);
}
