const intSize = 8;
const doubleSize = 8;
const counts = [1000, 2000, 10000];

int getElementSize(Type type) {
  return type == int ? intSize : doubleSize;
}
