// O ticker será a fonte de dados para o aplicativo de timer.

class Ticker {
  const Ticker();
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}

// Tudo o que nossa Tickerclasse faz é expor uma função tick que pega o número de ticks (segundos) 
//que queremos e retorna um fluxo que emite os segundos restantes a cada segundo.