import 'package:app_flutter_basic_widget_example/aula_10_image/animal.dart';

class AnimalAPI {
  static List<Animal> getAnimais() {
    List<Animal> animais = [
      Animal(nome: 'Boby 1', url: 'resource/image/cachorro1.png', idade: 10),
      Animal(nome: 'Boby 2', url: 'resource/image/cachorro2.jpg', idade: 12),
      Animal(nome: 'Boby 3', url: 'resource/image/cachorro3.jpg', idade: 13),
      Animal(nome: 'Boby 4', url: 'resource/image/cachorro4.jpg', idade: 11),
      Animal(nome: 'Boby 5', url: 'resource/image/gato1.jpg', idade: 14),
      Animal(nome: 'Boby 6', url: 'resource/image/gato2.jpeg', idade: 15),
      Animal(nome: 'Boby 7', url: 'resource/image/gato3.png', idade: 16),
    ];
    return animais;
  }
}
