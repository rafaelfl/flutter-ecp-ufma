import 'dart:math';

class DrawHelper {
  // Retorna os números escolhidos para pagar um valor extra
  // choosenNumbers = número de escolhidos
  // maxPlayers = número máximo de participantes
  static List getChoosens(int choosenNumbers, int maxPlayers) {
    var random = new Random();
    var choosens = [];
    while (choosens.length < choosenNumbers) {
      var randomNumber = (random.nextInt(maxPlayers) + 1);
      if (!choosens.contains(randomNumber)) {
        // Adiciona um número no array
        choosens.add(randomNumber);
      }
    }
    return choosens;
  }

  // Retorna um array onde a posicao zero é o total pessoas normais vao pagar e o segundo o total que os sorteados irão pagar
  // choosenNumbers = número de escolhidos
  // maxPlayers = número máximo de participantes
  // total = Total da conta
  // percent = Quantidade que será repartida entre os sorteados

  static List<dynamic> whoPayWhat(
      int maxPlayers, int percent, int choosenNumbers, double total) {
    double normalPay = (total - (total * (percent * 0.01))) / maxPlayers;
    double choosenPay =
        ((total * (percent * 0.01)) / choosenNumbers) + normalPay;
    return [normalPay.toStringAsFixed(2), choosenPay.toStringAsFixed(2)];
  }

  static String getDirection() {
    Random random = new Random();
    int result = random.nextInt(101);
    if (result % 2 == 0) {
      return "Direita";
    } else {
      return "Esquerda";
    }
  }
}
