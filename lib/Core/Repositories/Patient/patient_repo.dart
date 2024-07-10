abstract class PatientRepo{
  Future<dynamic> patientLogin(context, data);
  Future<dynamic> patientVerify(context, data);
  Future<dynamic> getMyReport(context, id);

}