# bison-flex-calculator
It's a flex and bison calculator demonstrating polymorphism in the abstract syntax tree. bison flex polymorphism.

# Examples :
### Test 1
![Test1](https://github.com/Ahmed-Jedidi/bison-flex-calculator/assets/74512793/b624fcf2-76d6-4396-ba9b-9c16baa33053)

### Test 2
![Test2](https://github.com/Ahmed-Jedidi/bison-flex-calculator/assets/74512793/3717934e-7382-48ca-b3d6-d895119cf7af)


### Test 3
![Test3](https://github.com/Ahmed-Jedidi/bison-flex-calculator/assets/74512793/8811fae1-1421-490f-ad43-edde3eb371e7)


# Required commands :

1. ```
   bison -d grammaire.y
   ```

2. ```
   flex  -o scanner.c scanner.l
   ```

3. ```
   gcc  -o calc scanner.c grammaire.tab.c -lm
   ```

4. ```
   calc < valid.txt
   ```

Remark : Execute calc.exe file, you can test with the expression in valid.txt file.
