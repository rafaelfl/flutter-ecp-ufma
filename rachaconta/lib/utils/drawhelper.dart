import 'dart:math';

class DrawHelper {
  // Retorna os números escolhidos para pagar um valor extra
  // choosenNumbers = número de escolhidos
  // maxPlayers = número máximo de participantes
  static getChoosens(int choosenNumbers, int maxPlayers) {
    var random = new Random();
    var choosens = [];
    for (var i = 0; i < choosenNumbers; i++) {
      choosens.add(random.nextInt(maxPlayers));
    }
    return choosens;
  }

  // Retorna um array onde a posicao zero é o total pessoas normais vao pagar e o segundo o total que os sorteados irão pagar
  // choosenNumbers = número de escolhidos
  // maxPlayers = número máximo de participantes
  // total = Total da conta
  // percent = Quantidade que será repartida entre os sorteados

  static whoPayWhat(
      int maxPlayers, double percent, int choosenNumbers, double total) {
    double normalPay = (total - (total * percent)) / maxPlayers;
    double choosenPay = ((total * percent) / choosenNumbers) + normalPay;
    return [normalPay.toStringAsFixed(2), choosenPay.toStringAsFixed(2)];
  }
}
