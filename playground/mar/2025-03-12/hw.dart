void main(){

  print(sumOfMultiples(10));
  print(sumOfMultiples(20));

  print(isPrime(7));
  print(isPrime(12));
  print(isPrime(23));
}


int sumOfMultiples(int limit){
  int ans = 0;
  for (int i = 1; i < limit; i++){
    if (i % 3 == 0 || i % 5 == 0){
      ans += i;
    }
  }
  return ans;
}


bool isPrime(int number){
  if (number < 2){
    return false;
  }
  if( number == 2 || number == 3){
    return true;
  }
  if(number % 2 == 0){
    return false;
  }
  for (int i = 3; i * i <= number; i += 2){
    if (number % i == 0){
      return false;
    }
  }
  return true;
}