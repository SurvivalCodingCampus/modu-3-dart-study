# 과제 설명

## 디버깅 연습문제

### 연습문제 2

- getTyB에서 조건문에 2 ~ 4와 14 ~ 16 조건이 빠져있음.

- nowDate의 DateFormat이 MM(month)가 아니라 mm(minute)으로 되어 있음.

<br>

- 조건문이 &&가 아닌 || 로 되어있어서 무조건 갑자 1국이 출력되는 오류


```
if (nowTime.hour >= 0 && nowTime.hour < 2) {
  return timeDataOne.first.ty1;
}
```



- month만 사용하는 getTyA에서 timeDataOne을 확인할 필요가 없음. getTyB에서 empty 확인하는 것으로 수정