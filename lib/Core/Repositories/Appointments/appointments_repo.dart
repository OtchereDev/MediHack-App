abstract class AppointmentsRepo {
  Future<dynamic> getPendingRefferal(context);
  Future<dynamic> getCompletedRefferal(context);
  Future<dynamic> getRefferalDetails(context, String id);
  Future<dynamic> getAllRefferals(context);
  Future<dynamic> createAppointment(context, data);
}
