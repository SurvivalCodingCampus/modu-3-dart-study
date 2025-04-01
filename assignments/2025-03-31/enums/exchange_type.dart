enum ExchangeType {
  bats,
  nasdaq,
  nyse,
  nyseArca,
  nyseMkt;

  static ExchangeType fromString(String name) {
    switch (name) {
      case 'BATS':
        return ExchangeType.bats;
      case 'NASDAQ':
        return ExchangeType.nasdaq;
      case 'NYSE':
        return ExchangeType.nyse;
      case 'NYSE MKT':
        return ExchangeType.nyseMkt;
      case 'NYSE ARCA':
        return ExchangeType.nyseArca;
      default:
        throw ArgumentError('지원하지 않는 거래소: $name');
    }
  }
}
