abstract class WalletRepo{
  Future<dynamic> getWallet(context);
  Future<dynamic> withdrawBonus(context, data);
  Future<dynamic> getTransaction(context,  {int? page, int? limit});

}