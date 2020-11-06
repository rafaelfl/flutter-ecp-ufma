import 'dart:io';

class Produto {
  // Constructor
  Produto(this.preco);
  // Atribute
  final double preco;
}

/* Cardápio */

class Pizza extends Produto {
  String sabor;
  Pizza(
    double preco,
    this.sabor,
  ) : super(preco);

  Map<String, dynamic> toMap() {
    return {
      'descricao': "Uma pizza sabor ${sabor} por ${preco}"
    };
  }
}

class Refrigerante extends Produto {
  String marca;
  Refrigerante(
    double preco,
    this.marca,
  ) : super(preco);
  Map<String, dynamic> toMap() {
    return {
      'descricao': "Um refrigerante da marca ${marca} por ${preco}"
    };
  }
}

class Batata extends Produto {
  String recheio;
  Batata(double preco, this.recheio) : super(preco);
  Map<String, dynamic> toMap() {
    return {
      'descricao': "Uma batata com recheio de ${recheio} por ${preco}"
    };
  }
}

void dividirTela(){
    print("--------------------------------------");
}


void main() {
  var pedidos = [];
  var opcao = 1;
  while (opcao != 2) {
    dividirTela();
    print(
        'O que você deseja:\n1 - Adicionar item \n2 - Finalizar\n3 - Listar pedidos');
    opcao = int.parse(stdin.readLineSync());
    switch (opcao) {
      case 1:
        {
          print('O que você deseja:\n1 - Pizza\n2 - Refrigerente\n3 - Batata');
          int pedido = int.parse(stdin.readLineSync());
          if (pedido == 1) {
            print("Qual o sabor:\n1 - Queijo\n2 - Calabreza");
            var sabor;
            sabor = int.parse(stdin.readLineSync());
            switch (sabor) {
              case 1:
                {
                  Pizza p = Pizza(45.00, 'Queijo');
                  pedidos.add(p);
                }
                break;
              case 2:
                {
                  Pizza p = Pizza(45.00, 'Calabreza');
                  pedidos.add(p);
                }
                break;
              default:
                {
                  print("Sabor inválido");
                  break;
                }
            }
          } else if (pedido == 2) {
            print("Qual a marca:\n1 - Coca Cola\n2 - Jesus");
            var marca;
            marca = int.parse(stdin.readLineSync());
            switch (marca) {
              case 1:
                {
                  Refrigerante r = Refrigerante(10.00, 'Coca Cola');
                  pedidos.add(r);
                }
                break;
              case 2:
                {
                  Refrigerante r = Refrigerante(10.00, 'Jesus');
                  pedidos.add(r);
                }
                break;
              default:
                {
                  print("Marca inválida");
                  break;
                }
            }
          } else if (pedido == 3) {
            print("Qual o recheio:\n1 - Queijo\n2 - Carne");
            var marca;
            marca = int.parse(stdin.readLineSync());
            switch (marca) {
              case 1:
                {
                  Batata b = Batata(10.00, 'Queijo');
                  pedidos.add(b);
                }
                break;
              case 2:
                {
                  Batata b = Batata(10.00, 'Carne');
                  pedidos.add(b);
                }
                break;
              default:
                {
                  print("Marca inválida");
                  break;
                }
            }
          } else {
            print('pedido inválido');
            break;
          }
        }
        break;
      case 2:
        {
          print("Pedido finalizado");
          pedidos.forEach((element) {
            print(element.toMap());
          });

          var total = 0.0;

          pedidos.forEach((item)=>{
            total += item.preco
          });

          print("Total: ${total}");
          
        }
        break;
      case 3:
        {
          pedidos.forEach((element) {
            print(element.toMap());
          });
        }
        break;
      default:
        {
          print("Opção inválida");
        }
    }
  }
}
