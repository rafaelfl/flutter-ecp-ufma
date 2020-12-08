import 'package:rachaconta/utils/drawhelper.dart';

class Draw {
  double totalValue; // Conta
  int quantityAllPeople; // Quantidade de participantes
  double percentageDraw; // Qual será a porcentagem que será sorteada
  int numberOfWinners; // Número de pessoas que serão sorteadas

  Draw(
      this.totalValue,
      this.quantityAllPeople,
      this.percentageDraw,
      this.numberOfWinners);

  Map<String, dynamic> roll() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // Gerando os números sorteados
    data['choosens'] = DrawHelper.getChoosens(this.numberOfWinners, this.quantityAllPeople);
    // Calculando quanto cada um vai pagar, 0 = normal, 1 = sorteados
    data['whopay'] = DrawHelper.whoPayWhat(this.quantityAllPeople, this.percentageDraw, this.numberOfWinners, this.totalValue).toString();
    return data;
  }
}


