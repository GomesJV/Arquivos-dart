/// Escreva uma classe Data cuja instância (objeto) represente uma data. Esta classe deverá dispor dos
/// seguintes métodos:
///
/// Construtor: define a data que determinado objeto (através de parâmetro), este método verifica se a 
/// data está correta, caso não esteja a data é configurada como 01/01/0001.
///
/// Compara: recebe como parâmetro um outro objeto da Classe data, compare com a data corrente e
/// retorne: 0 se as datas forem iguais; 1 se a data corrente for maior que a do parâmetro; -1 se a data do parâmetro for maior que a corrente.
/// 
/// isBissexto: retorna verdadeiro se o ano da data corrente for bissexto e falso caso contrário
/// 
/// Clone: o objeto clona a si próprio, para isto, ele cria um novo objeto da classe Data com os
/// mesmos valores de atributos e retorna sua referência pelo método.

class Data {

  static bool validar(String dia, String mes, bool bissexto){
    if([4, 6, 9, 11].contains(int.parse(mes))){
      return int.parse(dia) <= 30;
    }else if([1, 3, 5, 7, 8, 10, 12].contains(int.parse(mes))){
      return int.parse(dia) <= 31;
    }else{
      if(bissexto){
        return int.parse(dia) <= 29;
      }else{
        return int.parse(dia) <= 28;
      }
    }
  }

  static Map<String, int> modelar(int mes, bool bissexto){
    Map<String, int> modelo = {};
    modelo['ano'] = bissexto ? 366 : 365;

    if(mes == 2){
      modelo['mes'] = bissexto ? 29 : 28;
    }else{
      modelo['mes'] = [4, 6, 9, 11].contains(mes) ? 30 : 31;
    }

    return Map.from(modelo);
  }

  String dia = '01';
  String mes = '01';
  String ano = '0001';

  Data(String dia, String mes, String ano){
    if(validar(dia, mes, isBissexto())){
      this.dia = dia;
      this.mes = mes;
      this.ano = ano;
    }
  }

  bool isBissexto() => int.parse(ano) % 4 == 0 && int.parse(ano) % 100 != 0 || int.parse(ano) % 400 == 0;

  int compara(Data data){
    Map<String, int> modeloThis = modelar(int.parse(mes), isBissexto());
    Map<String, int> modeloOuther = modelar(int.parse(data.mes), data.isBissexto());

    int sizeThis = int.parse(dia) + (int.parse(mes) * modeloThis['mes']) + (int.parse(ano) * modeloThis['ano']);
    int sizeOuther = int.parse(data.dia) + (int.parse(data.mes) * modeloOuther['mes']) + (int.parse(data.ano) * modeloOuther['ano']);

    if(sizeThis > sizeOuther){
      return 1;
    }else if(sizeOuther > sizeThis){
      return -1;
    }else{
      return 0;
    }
  }

  Data clone() => Data(this.dia, this.mes, this.ano);

}
